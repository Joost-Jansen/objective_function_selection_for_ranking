#!/bin/bash

# before start - from the main dir run:
# docker build -t allrank:latest .

DIR=$(dirname $0)
PROJECT_DIR="$(cd $DIR/..; pwd)"
echo $PROJECT_DIR
#pointwise
#docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config0.json --run-id first_test --job-dir /allrank/first_test'
# docker run -e PYTHONPATH=/allrank -v /mnt/c/Users/joost/Documents/allRank:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/result_rankNet  --roles test --config-file-name allrank/config_rankNet.json --run-id test --job-dir results/result_rankNet';

#RankNet
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/result_rankNet  --roles test --config-file-name allrank/config_rankNet.json --run-id test --job-dir results/result_rankNet';
#ApproxNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/result_ApproxNDCG  --roles test --config-file-name allrank/config_ApproxNDCG.json --run-id test --job-dir results/result_ApproxNDCG';
#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/testModel.py --input-model-path results/result_NeuralNDCG  --roles test --config-file-name allrank/config_NeuralNDCG.json --run-id test --job-dir results/result_NeuralNDCG';