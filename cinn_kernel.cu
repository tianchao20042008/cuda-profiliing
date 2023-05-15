#include "cuda_runtime.h"
#include <cuda_fp16.h>
#define CINN_WITH_CUDA
#define CINN_CUDA_FP16
#include <stdio.h>
#include "float16.h"
using cinn::common::float16;
using cinn::common::half4;
using cinn::common::half8;
using cinn::common::float8;
#include <iostream>

constexpr int N=256, H=112, W=112, C=64;
constexpr int REDUCE_NUMEL = N*H*W;

#include "no_zero_opt.cuh"
#include "zero_opt.cuh"

int main() {
  cudaSetDevice(0);
  // 256x56x56x256
	const float16* elementwise_add_1____GRAD = nullptr;
  size_t size_elementwise_add_1____GRAD = sizeof(float16) * 256 * 56 * 56 * 256;
  cudaMalloc((void**)&(elementwise_add_1____GRAD), size_elementwise_add_1____GRAD);
  // 256x56x56x256
  const float16* relu_3__tmp_0____GRAD____RENAME____block0____1 = nullptr;
  size_t size_relu_3__tmp_0____GRAD____RENAME____block0____1 = sizeof(float16) * 256 * 56 * 56 * 256;
  cudaMalloc((void**)&(relu_3__tmp_0____GRAD____RENAME____block0____1), size_relu_3__tmp_0____GRAD____RENAME____block0____1);
  // 256x56x56x256
  const float16* relu_3__tmp_0 = nullptr;
  size_t size_relu_3__tmp_0 = sizeof(float16) * 256 * 56 * 56 * 256;
  cudaMalloc((void**)&(relu_3__tmp_0), size_relu_3__tmp_0);
  // 256x56x56x256
  const float16* conv2d_57__tmp_0 = nullptr;
  size_t size_conv2d_57__tmp_0 = sizeof(float16) * 256 * 56 * 56 * 256;
  cudaMalloc((void**)&(conv2d_57__tmp_0), size_conv2d_57__tmp_0);
  // 256x56x56x256
  const float16* conv2d_56__tmp_0 = nullptr;
  size_t size_conv2d_56__tmp_0 = sizeof(float16) * 256 * 56 * 56 * 256;
  cudaMalloc((void**)&(conv2d_56__tmp_0), size_conv2d_56__tmp_0);
  // 256
  const float* batch_norm_3__tmp_0 = nullptr;
  size_t size_batch_norm_3__tmp_0 = sizeof(float) * 256;
  cudaMalloc((void**)&(batch_norm_3__tmp_0), size_batch_norm_3__tmp_0);
  // 256
  const float* batch_norm_4__tmp_0 = nullptr;
  size_t size_batch_norm_4__tmp_0 = sizeof(float) * 256;
  cudaMalloc((void**)&(batch_norm_4__tmp_0), size_batch_norm_4__tmp_0);
  // 896x896x256
  float* var_15740 = nullptr;
  size_t size_var_15740 = sizeof(float) * 896 * 896 * 256;
  cudaMalloc((void**)&(var_15740), size_var_15740);
  // 896x256
  float* var_15941 = nullptr;
  size_t size_var_15941 = sizeof(float) * 896 * 256;
  cudaMalloc((void**)&(var_15941), size_var_15941);
  // 896x256
  float* var_15938 = nullptr;
  size_t size_var_15938 = sizeof(float) * 896 * 256;
  cudaMalloc((void**)&(var_15938), size_var_15938);
  // 896x256
  float* var_15932 = nullptr;
  size_t size_var_15932 = sizeof(float) * 896 * 256;
  cudaMalloc((void**)&(var_15932), size_var_15932);
  // 256x56x56x256
  float* var_15742 = nullptr;
  size_t size_var_15742 = sizeof(float) * 256 * 56 * 56 * 256;
  cudaMalloc((void**)&(var_15742), size_var_15742);
  // 896x256
  float* var_15935 = nullptr;
  size_t size_var_15935 = sizeof(float) * 896 * 256;
  cudaMalloc((void**)&(var_15935), size_var_15935);
  for (int i = 0; i < 20; ++i) {
    no_zero_opt<<<224, 1024>>>(
      // 256x56x56x256
      elementwise_add_1____GRAD,
      // 256x56x56x256
      relu_3__tmp_0____GRAD____RENAME____block0____1,
      // 256x56x56x256
      relu_3__tmp_0,
      // 256x56x56x256
      // conv2d_57__tmp_0,
      // 256x56x56x256
      conv2d_56__tmp_0,
      // 256
      batch_norm_3__tmp_0,
      // 256
      // batch_norm_4__tmp_0,
      // 896x896x256
      // float* __restrict__ var_15740,
      // 896x256
      var_15941,
      // 896x256
      var_15938,
      // 896x256
      var_15932,
      // 256x56x56x256
      var_15742//,
      // 896x256
      //float* __restrict__ var_15935
    );
    zero_opt<<<224, 1024>>>(
      // 256x56x56x256
      elementwise_add_1____GRAD,
      // 256x56x56x256
      relu_3__tmp_0____GRAD____RENAME____block0____1,
      // 256x56x56x256
      relu_3__tmp_0,
      // 256x56x56x256
      // conv2d_57__tmp_0,
      // 256x56x56x256
      conv2d_56__tmp_0,
      // 256
      batch_norm_3__tmp_0,
      // 256
      // batch_norm_4__tmp_0,
      // 896x896x256
      // float* __restrict__ var_15740,
      // 896x256
      var_15941,
      // 896x256
      var_15938,
      // 896x256
      var_15932,
      // 256x56x56x256
      var_15742//,
      // 896x256
      //float* __restrict__ var_15935
    );
  }
  cudaDeviceSynchronize();
  printf("%s\n", cudaGetErrorString(cudaGetLastError()));
  return 0;
}
