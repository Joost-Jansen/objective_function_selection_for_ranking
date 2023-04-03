#!/bin/bash

# before start - from the main dir run:
# docker build -t allrank:latest .

DIR=$(dirname $0)
PROJECT_DIR="$(cd $DIR/..; pwd)"
PROJECT_DIR2=/mnt/c/Users/joost/Documents/allRank
echo $PROJECT_DIR2;
#pointwise
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config0.json --run-id first_test --job-dir results/first_test'


#########
#MQ2008##
#########
echo "starting MQ2008 tests"
# #RankNet
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_rankNet --job-dir results/result_rankNet'
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/ranknet/config_rankNet.json --run-id result_20 --job-dir results/MQ2008/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/ranknet/config_rankNet_40.json --run-id result_40 --job-dir results/MQ2008/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/ranknet/config_rankNet_60.json --run-id result_60 --job-dir results/MQ2008/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/ranknet/config_rankNet_80.json --run-id result_80 --job-dir results/MQ2008/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/ranknet/config_rankNet_100.json --run-id result_100 --job-dir results/MQ2008/result_rankNet/';
echo "RankNet done";

# #ApproxNDCG
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_ApproxNDCG --job-dir results/result_ApproxNDCG'
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/approxNDCG/config_ApproxNDCG_20.json --run-id result_20 --job-dir results/MQ2008/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/approxNDCG/config_ApproxNDCG_40.json --run-id result_40 --job-dir results/MQ2008/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/approxNDCG/config_ApproxNDCG_60.json --run-id result_60 --job-dir results/MQ2008/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/approxNDCG/config_ApproxNDCG_80.json --run-id result_80 --job-dir results/MQ2008/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/approxNDCG/config_ApproxNDCG_100.json --run-id result_100 --job-dir results/MQ2008/result_ApproxNDCG/';
echo "done ApproxNDCG";

#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/neuralNDCG/config_NeuralNDCG_20.json --run-id result_20 --job-dir results/MQ2008/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/neuralNDCG/config_NeuralNDCG_40.json --run-id result_40 --job-dir results/MQ2008/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/neuralNDCG/config_NeuralNDCG_60.json --run-id result_60 --job-dir results/MQ2008/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/neuralNDCG/config_NeuralNDCG_80.json --run-id result_80 --job-dir results/MQ2008/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MQ2008_configs/neuralNDCG/config_NeuralNDCG_100.json --run-id result_100 --job-dir results/MQ2008/result_NeuralNDCG/';
# echo "done";

###############
##MSLR-WEB10K##
###############
echo "starting MSLR-WEB10K tests"

# #RankNet
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_rankNet.json --run-id result_rankNet --job-dir results/result_rankNet'
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/ranknet/config_rankNet_20.json --run-id result_20 --job-dir results/MSLR_WEB10K/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/ranknet/config_rankNet_40.json --run-id result_40 --job-dir results/MSLR_WEB10K/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/ranknet/config_rankNet_60.json --run-id result_60 --job-dir results/MSLR_WEB10K/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/ranknet/config_rankNet_80.json --run-id result_80 --job-dir results/MSLR_WEB10K/result_rankNet/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/ranknet/config_rankNet_100.json --run-id result_100 --job-dir results/MSLR_WEB10K/result_rankNet/';
echo "RankNet done";

# #ApproxNDCG
# docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/config_ApproxNDCG.json --run-id result_ApproxNDCG --job-dir results/result_ApproxNDCG'
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/approxNDCG/config_ApproxNDCG_20.json --run-id result_20 --job-dir results/MSLR_WEB10K/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/approxNDCG/config_ApproxNDCG_40.json --run-id result_40 --job-dir results/MSLR_WEB10K/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/approxNDCG/config_ApproxNDCG_60.json --run-id result_60 --job-dir results/MSLR_WEB10K/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/approxNDCG/config_ApproxNDCG_80.json --run-id result_80 --job-dir results/MSLR_WEB10K/result_ApproxNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/approxNDCG/config_ApproxNDCG_100.json --run-id result_100 --job-dir results/MSLR_WEB10K/result_ApproxNDCG/';
echo "done ApproxNDCG";

#NeuralNDCG
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/neuralNDCG/config_NeuralNDCG_20.json --run-id result_20 --job-dir results/MSLR_WEB10K/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/neuralNDCG/config_NeuralNDCG_40.json --run-id result_40 --job-dir results/MSLR_WEB10K/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/neuralNDCG/config_NeuralNDCG_60.json --run-id result_60 --job-dir results/MSLR_WEB10K/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/neuralNDCG/config_NeuralNDCG_80.json --run-id result_80 --job-dir results/MSLR_WEB10K/result_NeuralNDCG/';
docker run -e PYTHONPATH=/allrank -v $PROJECT_DIR:/allrank allrank:latest /bin/sh -c 'python allrank/main.py --config-file-name allrank/configs/MSLR_configs/neuralNDCG/config_NeuralNDCG_100.json --run-id result_100 --job-dir results/MSLR_WEB10K/result_NeuralNDCG/';
echo "done";
