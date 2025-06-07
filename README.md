# Benchmarks
Run benchmarks from git folder(same as this file) like so.
## Cirq benchmarks
```
python cirq-benchmark/bench.py
```
## CPU benchmarks
```
futhark bench src/simple_bench.fut --backend=multicore --concurrency=1
futhark bench src/qft_bench.fut    --backend=multicore --concurrency=1
futhark bench src/grover_bench.fut --backend=multicore --concurrency=1
```
## GPU benchmarks
futhark bench with your compatible gpu backend,
choices are:
### NVIDIA
```
futhark bench src/simple_bench.fut --backend=cuda
futhark bench src/qft_bench.fut    --backend=cuda
futhark bench src/grover_bench.fut --backend=cuda
```
### AMD
```
futhark bench src/simple_bench.fut --backend=hip
futhark bench src/qft_bench.fut    --backend=hip
futhark bench src/grover_bench.fut --backend=hip
```
### Cross vendor
```
futhark bench src/simple_bench.fut --backend=opencl
futhark bench src/qft_bench.fut    --backend=opencl
futhark bench src/grover_bench.fut --backend=opencl
```
