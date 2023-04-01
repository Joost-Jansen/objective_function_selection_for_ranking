import os
from argparse import ArgumentParser, Namespace
from pprint import pformat
from urllib.parse import urlparse

import numpy as np
import pandas as pd
from allrank.training.train_utils import compute_metrics
import torch
from attr import asdict

from allrank.click_models.click_utils import click_on_slates
from allrank.config import Config
from allrank.data.dataset_loading import load_libsvm_dataset_role
from allrank.data.dataset_saving import write_to_libsvm_without_masked
from allrank.inference.inference_utils import rank_slates, metrics_on_clicked_slates
from allrank.models.model import make_model
from allrank.models.model_utils import get_torch_device, CustomDataParallel, load_state_dict_from_file
from allrank.utils.args_utils import split_as_strings
from allrank.utils.command_executor import execute_command
from allrank.utils.config_utils import instantiate_from_recursive_name_args
from allrank.utils.file_utils import create_output_dirs, PathsContainer, copy_local_to_gs
from allrank.utils.ltr_logging import init_logger
from allrank.utils.python_utils import all_equal
from allrank.data.dataset_loading import LibSVMDataset
from torch.utils.data.dataloader import DataLoader

def parse_args() -> Namespace:
    parser = ArgumentParser("allRank rank and apply click model")
    parser.add_argument("--job-dir", help="Base output path for all experiments", required=True)
    parser.add_argument("--run-id", help="Name of this run to be recorded (must be unique within output dir)",
                        required=True)
    parser.add_argument("--config-file-name", required=True, type=str, help="Name of json file with model config")
    parser.add_argument("--input-model-path", required=True, type=str, help="Path to the model to read weights")
    parser.add_argument("--roles", required=True, type=split_as_strings,
                        help="List of comma-separated dataset roles to load and process")

    return parser.parse_args()

def __create_data_loader(ds: LibSVMDataset, config: Config) -> DataLoader:
    return DataLoader(ds, batch_size=config.data.batch_size, num_workers=config.data.num_workers, shuffle=False)

def run(paths, logger, args, percentage):
    # reproducibility
    torch.manual_seed(42)
    torch.cuda.manual_seed_all(42)
    np.random.seed(42)

    logger.info("will save data in {output_dir}".format(output_dir=paths.base_output_path))

    # read config
    config = Config.from_json(paths.config_path)
    print(config)
    logger.info("Config:\n {}".format(pformat(vars(config), width=1)))

    output_config_path = os.path.join(paths.output_dir, "used_config.json")
    execute_command("cp {} {}".format(paths.config_path, output_config_path))

    datasets = {role: load_libsvm_dataset_role(role, config.data.path + "_percentage_" + str(percentage), config.data.slate_length) for role in args.roles}

    n_features = [ds.shape[-1] for ds in datasets.values()]
    assert all_equal(n_features), f"Last dimensions of datasets must match but got {n_features}"

    # gpu support
    dev = get_torch_device()
    logger.info("Will use device {}".format(dev.type))

    # instantiate model
    model = make_model(n_features=n_features[0], **asdict(config.model, recurse=False))

    model.load_state_dict(load_state_dict_from_file(args.input_model_path + "/results/result_" + str(percentage)+ "/model.pkl", dev))
    logger.info(f"loaded model weights from {args.input_model_path }"+ "/results/results_" + str(percentage)+ "/model.pkl")

    if torch.cuda.device_count() > 1:
        model = CustomDataParallel(model)
        logger.info("Model training will be distributed to {} GPUs.".format(torch.cuda.device_count()))
    model.to(dev)

   
    ranked_slates = rank_slates(datasets, model, config)

    dataloaders = {role: __create_data_loader(ds, config) for role, ds in datasets.items()}

    val_metrics = {role: compute_metrics(config.metrics, model, dl, dev) for role, dl in dataloaders.items()}
    
    for role, metrics in val_metrics.items():
        logger.info(f"{role} metrics summary:")
        logger.info(metrics)

    if urlparse(args.job_dir).scheme == "gs":
        copy_local_to_gs(paths.local_base_output_path, args.job_dir)

    val_metrics['test']['percentage'] = percentage
    print(val_metrics["test"])
    return pd.DataFrame.from_dict(val_metrics['test'], orient='index').T


if __name__ == "__main__":
    percentages = [50, 60, 70, 80]


    args = parse_args()
    paths = PathsContainer.from_args(args.job_dir, args.run_id, args.config_file_name)
    os.makedirs(paths.base_output_path, exist_ok=True)
    create_output_dirs(paths.output_dir)
    logger = init_logger(paths.output_dir)


    metrics = None
    for percentage in percentages:
        logger.info("Percentage: " + str(percentage))
        if metrics is None:
            metrics = run(paths, logger, args, percentage)
        else:
            metric = run(paths, logger, args, percentage)
            metrics = pd.concat([metrics, metric], ignore_index=True)
    
    logger.info("All results:")
    logger.info(metrics)
    logger.info('saved at: ' + args.job_dir + '/all_test_results.csv')
    metrics.to_csv(args.job_dir + '/all_test_results.csv', index=False)
        

    