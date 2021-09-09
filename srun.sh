#!/bin/bash -x

DATE=`date "+%m%d-%H%M%S"`
PARTITION=${1:-mediaf}
GPUS=${2:-8}
JOBNAME=ugatit-orig-${DATE}
RESULT=result-${DATE}

srun -p $PARTITION \
    --job-name=$JOBNAME \
    --gres=gpu:$GPUS \
    --ntasks=1 \
    --cpus-per-task=$((4*GPUS)) \
    --kill-on-bad-exit=1 \
    python main.py \
        --light 8 \
        --dataset selfie2anime \
        --save_freq 40000 \
        --identity_weight 0 \
        --result_dir $RESULT \
    2>&1 | tee ${RESULT}.log
