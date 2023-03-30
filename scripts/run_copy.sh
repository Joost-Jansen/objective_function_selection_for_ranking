#!/bin/bash

# before start - from the main dir run:
# docker build -t allrank:latest .

DIR=$(dirname $0)
PROJECT_DIR="$(cd $DIR/..; pwd)"

#pointwise
#docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config0.json --run-id first_test --job-dir /allrank/first_test'

#RankNet
#docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_rankNet --job-dir /allrank/result_rankNet'

#ApproxNDCG
#docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_ApproxNDCG --job-dir /allrank/result_ApproxNDCG'

#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_NeuralNDCG.json --run-id result_NeuralNDCG --job-dir /allrank/result_NeuralNDCG'
