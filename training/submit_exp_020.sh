#!/bin/bash --login

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=spencer.gardiner@gmail.com
#SBATCH --qos=dw87
#SBATCH --mem=128G
#SBATCH --cpus-per-gpu=12
#SBATCH --gres=gpu:1
#SBATCH --time=72:00:00
#SBATCH --job-name=no_pre_weights_baseline



module purge
module load cuda

mamba activate kat

python ./training.py \
           --path_for_outputs "/home/ssgardin/nobackup/autodelete/ProteinMPNN_KAN/baseline_no_pretrained_weights" \
           --path_for_training_data "/home/ssgardin/nobackup/autodelete/pdb_2021aug02" \
           --num_examples_per_epoch 1000 \
           --save_model_every_n_epochs 50 \
           --pretrain_weights "/home/ssgardin/nobackup/autodelete/ProteinMPNN_KAN/soluble_model_weights/v_48_030.pt" \
