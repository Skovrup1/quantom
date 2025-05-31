#!/bin/bash
#SBATCH -p gpu 
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=qft30
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=4 
#SBATCH --mem=64G
#SBATCH --time=00:30:00
module load cuda
futhark bench --backend=cuda --entry=qft main.fut
