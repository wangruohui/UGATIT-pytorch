#!/bin/bash

DATE=`date "+%m%d-%H%M"`
EXP_NAME=$1
GPUS=${2:-8}
JOBNAME=ugatit-orig-${DATE}-${EXP_NAME}

srun -p mediaf \
    --job-name=$JOBNAME \
    --gres=gpu:$GPUS \
    --ntasks=$GPUS \
    --cpus-per-task=4 \
    --kill-on-bad-exit=1 \
    python main.py --light 8 --dataset selfie2anime \
    2>&1 | tee ~/$JOBNAME.log
