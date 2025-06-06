//===- config_ag_gemm_kernel_sm80_tp1_nnodes1.cu ------------------ C++ ---===//
//
// Copyright 2025 ByteDance Ltd. and/or its affiliates. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//===----------------------------------------------------------------------===//

// clang-format off
#include "flux/op_registry.h"
namespace bytedance::flux {
using namespace cute;

static int config_ag_gemm_kernel_sm80_tp1_nnodes1 = []() {
  auto &inst = TuningConfigRegistry::instance();
  inst.add(make_gemm_meta(make_gemm_dtype_config(_BF16{}(),_BF16{}(),_Void{}(),_BF16{}()),_Sm80{}(),_AGKernel{}(),_RRR{}(),_GemmV2{}()),make_runtime_config(8192,49152,12288,make_all_gather_runtime_config(1,1,0)),make_gemm_hparams(make_gemm_v2_hparams(cute::make_tuple(64l,64l,32l),cute::make_tuple(16l,8l,16l),_StreamkDP{}()),None{},cute::make_tuple(128l,256l,32l),_GemmStreamK{}(),3,_RasterAlongM{}()));
  return 0;
}();
}
// clang-format on
