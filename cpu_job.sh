#!/bin/bash
#SBATCH --job-name=cpu_qbench
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=128G
#SBATCH --time=24:00:00
futhark bench bench.fut --backend=multicore --concurrency=1
