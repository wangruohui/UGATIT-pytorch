#!/bin/bash -x 

DATE=`date "+%m%d-%H%M"`
RESULT=result-${DATE}

# python main.py --light 8 --dataset selfie2anime --save_freq 8000 --print_freq 10
python main.py \
    --light 8 \
    --dataset selfie2anime \
    --save_freq 8000 \
    --result_dir $RESULT
    2>&1 | tee ${RESULT}/log
