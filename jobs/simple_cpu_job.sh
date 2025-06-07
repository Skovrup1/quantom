#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=simple_cpu_bench
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=8G
#SBATCH --time=12:00:00
futhark bench src/simple_bench.fut --backend=multicore --concurrency=1
