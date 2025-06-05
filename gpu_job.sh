#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=gpu_qbench
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --time=24:00:00
module load cuda
futhark bench gpu_bench.fut --backend=cuda --concurrency=1
