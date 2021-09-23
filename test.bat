#export CUBLAS_WORKSPACE_CONFIG=:4096:8
#export CUBLAS_WORKSPACE_CONFIG=:16:8
#export CUDA_VISIBLE_DEVICES=4
python main.py --light 8 --dataset selfie2anime --device cpu
