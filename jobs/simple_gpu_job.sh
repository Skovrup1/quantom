#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=simple_gpu_bench
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=12:00:00
module load cuda
futhark bench src/simple_bench.fut --backend=cuda --concurrency=1
