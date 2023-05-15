__global__
void __launch_bounds__(1024) no_zero_opt(
  // 256x56x56x256
	const float16* __restrict__ elementwise_add_1____GRAD,
  // 256x56x56x256
  const float16* __restrict__ relu_3__tmp_0____GRAD____RENAME____block0____1,
  // 256x56x56x256
  const float16* __restrict__ relu_3__tmp_0,
  // 256x56x56x256
  // const float16* __restrict__ conv2d_57__tmp_0,
  // 256x56x56x256
  const float16* __restrict__ conv2d_56__tmp_0,
  // 256
  const float* __restrict__ batch_norm_3__tmp_0,
  // 256
  // const float* __restrict__ batch_norm_4__tmp_0,
  // 896x896x256
  // float* __restrict__ var_15740,
  // 896x256
  float* __restrict__ var_15941,
  // 896x256
  float* __restrict__ var_15938,
  // 896x256
  float* __restrict__ var_15932,
  // 256x56x56x256
  float* __restrict__ var_15742//,
  // 896x256
  //float* __restrict__ var_15935
  )
{
  float16 _var_15734_temp_buffer [ 1 ];
  float _var_15931_temp_buffer [ 1 ];
  //float _var_15934_temp_buffer [ 1 ];
  float _var_15937_temp_buffer [ 1 ];
  //float _var_15940_temp_buffer [ 1 ];
  float16* var_15734 = _var_15734_temp_buffer;
  float* var_15931 = _var_15931_temp_buffer;
  //float* var_15934 = _var_15934_temp_buffer;
  float* var_15937 = _var_15937_temp_buffer;
  //float* var_15940 = _var_15940_temp_buffer;
  float* var_15932__reduce_init = var_15932;
  //float* var_15935__reduce_init = var_15935;
  float* var_15938__reduce_init = var_15938;
  float* var_15941__reduce_init = var_15941;
  if (((int)blockIdx.x < 224)) {
    if (((int)threadIdx.x < 1024)) {
    {
      //var_15935__reduce_init[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = 0.00000000f;
      var_15938__reduce_init[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = 0.00000000f;
      var_15941__reduce_init[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = 0.00000000f;
      var_15932__reduce_init[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = 0.00000000f;
      for (int32_t kk_406 = 0; kk_406 < 896; kk_406 += 1) {
        var_15734[0] = (((relu_3__tmp_0[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))] > (float16)0.0000f)) ? (elementwise_add_1____GRAD[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))] + relu_3__tmp_0____GRAD____RENAME____block0____1[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))]) : (float16)0.0000f);
        //var_15740[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))] = ((float)(var_15734[0]));
        var_15742[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))] = ((float)(var_15734[0]));
        //var_15934[0] = var_15740[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))];
        //var_15940[0] = ((var_15740[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))] * ((float)(conv2d_57__tmp_0[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))]))) - (var_15740[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))] * batch_norm_4__tmp_0[((int)threadIdx.x & 255)]));
        var_15937[0] = ((((float)(var_15734[0])) * ((float)(conv2d_56__tmp_0[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))]))) - (((float)(var_15734[0])) * batch_norm_3__tmp_0[((int)threadIdx.x & 255)]));
        var_15931[0] = var_15742[((1024 * (int)blockIdx.x) + ((229376 * kk_406) + (int)threadIdx.x))];
        // var_15935[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = (var_15935[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] + var_15934[0]);
        var_15938[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = (var_15938[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] + var_15937[0]);
        //var_15941[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = (var_15941[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] + var_15940[0]);
        var_15932[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] = (var_15932[((1024 * (int)blockIdx.x) + (int)threadIdx.x)] + var_15931[0]);
      };
    }
    };
  };
}
