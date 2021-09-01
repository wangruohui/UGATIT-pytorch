#!/bin/bash -x

DATE=`date "+%m%d-%H%M"`
GPUS=${1:-8}
JOBNAME=ugatit-orig-${DATE}
RESULT=result-${DATE}

srun -p mediaf \
    --job-name=$JOBNAME \
    --gres=gpu:$GPUS \
    --ntasks=$GPUS \
    --cpus-per-task=4 \
    --kill-on-bad-exit=1 \
    python main.py \
        --light 8 \
        --dataset selfie2anime \
        --save_freq 8000 \
        --result_dir $RESULT \
    2>&1 | tee ~/$JOBNAME.log
