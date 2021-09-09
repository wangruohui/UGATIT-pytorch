#!/bin/bash -x 

#DATE=`date "+%m%d-%H%M%S"`
PARTITION=${1:-mediaf}
GPUS=1
JOBNAME=test-${DATE}
#RESULT=result-${DATE}

srun -p $PARTITION \
    --job-name=$JOBNAME \
    --gres=gpu:$GPUS \
    --ntasks=1 \
    --cpus-per-task=$((4*GPUS)) \
    --kill-on-bad-exit=1 \
    python main.py --light 8 --phase test --dataset selfie2anime --result_dir result-0906-171053
