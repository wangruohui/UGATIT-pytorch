#!/bin/bash -x 

DATE=`date "+%m%d-%H%M"`
GPUS=${1:-1}
JOBNAME=ugatit-orig-${DATE}
RESULT=result-${DATE}

mkdir $RESULT

srun -p mediaf \
    --job-name=$JOBNAME \
    --gres=gpu:$GPUS \
    --ntasks=$GPUS \
    --cpus-per-task=4 \
    --kill-on-bad-exit=1 \
    python main.py --light 8 \
    --dataset selfie2anime \
    --save_freq 5000 \
    --result_dir=$RESULT \
    2>&1 | tee ${RESULT}.log
