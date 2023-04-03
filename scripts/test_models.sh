#!/bin/bash

# before start - from the main dir run:
# docker build -t allrank:latest .

DIR=$(dirname $0)
PROJECT_DIR="$(cd $DIR/..; pwd)"
echo $PROJECT_DIR
#pointwise
#docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config0.json --run-id first_test --job-dir /allrank/first_test'
# docker run -e PYTHONPATH=/allrank -v /mnt/c/Users/joost/Documents/allRank:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/result_rankNet  --roles test --config-file-name allrank/config_rankNet.json --run-id test --job-dir results/result_rankNet';


#########
#MQ2008##
#########
#RankNet
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/MQ2008/result_rankNet  --roles test --config-file-name allrank/configs/MQ2008_configs/ranknet/config_rankNet.json --run-id test --job-dir results/MQ2008/result_rankNet';
#ApproxNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/MQ2008/result_ApproxNDCG  --roles test --config-file-name allrank/configs/MQ2008_configs/approxNDCG/config_ApproxNDCG.json --run-id test --job-dir results/MQ2008/result_ApproxNDCG';
#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/MQ2008/result_NeuralNDCG  --roles test --config-file-name allrank/configs/MQ2008_configs/neuralNDCG/config_NeuralNDCG.json --run-id test --job-dir results/MQ2008/result_NeuralNDCG';

###############
##MSLR-WEB10K##
###############
#RankNet
#RankNet
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/MQ2008/result_rankNet  --roles test --config-file-name allrank/configs/MSLR_configs/ranknet/config_rankNet.json --run-id test --job-dir results/MSLR_WEB10K/result_rankNet';
#ApproxNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/MQ2008/result_ApproxNDCG  --roles test --config-file-name allrank/configs/MSLR_configs/approxNDCG/config_ApproxNDCG.json --run-id test --job-dir results/MSLR_WEB10K/result_ApproxNDCG';
#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/MQ2008/result_NeuralNDCG  --roles test --config-file-name allrank/configs/MSLR_configs/neuralNDCG/config_NeuralNDCG.json --run-id test --job-dir results/MSLR_WEB10K/result_NeuralNDCG';
