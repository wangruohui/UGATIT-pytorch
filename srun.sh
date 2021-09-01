#!/bin/bash -x 

DATE=`date "+%m%d-%H%M"`
#EXP_NAME=$1
GPUS=${1:-8}
JOBNAME=ugatit-orig-${DATE}

srun -p mediaf \
    --job-name=$JOBNAME \
    --gres=gpu:$GPUS \
    --ntasks=$GPUS \
    --cpus-per-task=4 \
    --kill-on-bad-exit=1 \
    python main.py --light 8 --dataset selfie2anime --save_freq 10000\
    2>&1 | tee ~/$JOBNAME.log
