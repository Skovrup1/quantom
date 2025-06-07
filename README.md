# Benchmarks
Run benchmarks from git folder(same as this file) like so.
./grover_cpu_job.sh
./grover_gpu_job.sh
./qft_cpu_job.sh
./qft_gpu_job.sh
./simple_cpu_job.sh
./simple_gpu_job.sh

## GPU benchmarks
If don't have a CUDA compatible gpu,
you will have to manually call futhark bench with your compatible gpu backend,
choices are:

### AMD
futhark bench src/simple_bench.fut --backend=hip
futhark bench src/qft_bench.fut    --backend=hip
futhark bench src/grover_bench.fut --backend=hip

### Cross vendor
futhark bench src/simple_bench.fut --backend=hip
futhark bench src/qft_bench.fut    --backend=hip
futhark bench src/grover_bench.fut --backend=hip
