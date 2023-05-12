rm -f kernel
nvcc cinn_kernel.cu   --std=c++14    --gpu-architecture=sm_80  -o  kernel