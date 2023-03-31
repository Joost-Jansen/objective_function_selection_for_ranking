#!/bin/bash

# before start - from the main dir run:
# docker build -t allrank:latest .

DIR=$(dirname $0)
PROJECT_DIR="$(cd $DIR/..; pwd)"
PROJECT_DIR2=/mnt/c/Users/joost/Documents/allRank
echo $PROJECT_DIR2;
#pointwise
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config0.json --run-id first_test --job-dir results/first_test'

# #RankNet
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_rankNet --job-dir results/result_rankNet'
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_50 --job-dir results/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_60 --job-dir results/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_70 --job-dir results/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_80 --job-dir results/result_rankNet/';
echo "RankNet done";

# #ApproxNDCG
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_ApproxNDCG --job-dir results/result_ApproxNDCG'
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_50 --job-dir results/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_60 --job-dir results/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_70 --job-dir results/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_80 --job-dir results/result_ApproxNDCG/';
echo "done ApproxNDCG";

#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_NeuralNDCG.json --run-id result_50 --job-dir results/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_NeuralNDCG.json --run-id result_60 --job-dir results/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_NeuralNDCG.json --run-id result_70 --job-dir results/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_NeuralNDCG.json --run-id result_80 --job-dir results/result_NeuralNDCG/';
echo "done";