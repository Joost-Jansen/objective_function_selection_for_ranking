import json


def change_parameters(dataset_name):
    folder = dataset_name + '_configs'
    objective_functions = ['approxNDCG', 'neuralNDCG', 'ranknet', 'pointwise']
    objective_in_files = ['ApproxNDCG', 'NeuralNDCG', 'rankNet', 'pointwise']

    # objective_functions = ['pointwise']
    # objective_in_files = ['pointwise']

    ratios = ['', '_20', '_40', '_60', '_80', '_100']
    for index, objective_function in enumerate(objective_functions):
        for ratio in ratios:
            folder_path = folder + '/' + objective_function + '/' + 'config_' + objective_in_files[
                index] + ratio + '.json'

            # Load the JSON file
            with open(folder_path, 'r') as f:
                data = json.load(f)

            # For MSLR change slate and metrics
            data['training']['epochs'] = 10
            # data['metrics'] = [
            #     "ndcg_10",
            #     "ndcg_50",
            #     "ndcg_100",
            #     "mrr_10",
            #     "mrr_50",
            #     "mrr_100"
            #   ]

            # For MSLR change val_metric and expected_metrics
            # data['val_metric'] = "ndcg_10"
            # data['expected_metrics']['val'] = {
            #     "ndcg_10": 0.4
            # }

            # for pointwise, change objective function
            # data['loss']['name'] = "pointwise_rmse"
            # data['loss']['args'] = {
            #     "no_of_levels": 5
            # }

            # for MSLP, change dataset name
            # data['data']['path'] = "datasets/MSLR-WEB10K/Fold1_percentage" + ratio
            # Save the modified JSON data to the file
            with open(folder_path, 'w') as f:
                json.dump(data, f, indent=4)


# change_parameters('MQ2008')
change_parameters('MSLR')
