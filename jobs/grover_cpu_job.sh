#!/bin/bash
#SBATCH --job-name=grover_cpu_bench
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=8G
#SBATCH --time=12:00:00
futhark bench src/grover_bench.fut --backend=multicore --concurrency=1
