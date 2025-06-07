#!/bin/bash
#SBATCH --job-name=qft_gpu_bench
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=80G
#SBATCH --time=12:00:00
futhark bench src/qft_bench.fut --backend=multicore --concurrency=1
