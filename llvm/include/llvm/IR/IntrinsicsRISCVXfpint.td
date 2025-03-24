def riscv_v128f16_ty : LLVMType<v128f16>;
def riscv_v128f32_ty : LLVMType<v128f32>;

let TargetPrefix = "riscv" in {
  def int_riscv_set_dl_vvv_s : 
    Intrinsic<[], 
              [llvm_i32_ty,llvm_i32_ty,llvm_i32_ty], 
              [IntrNoMem, ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, IntrHasSideEffects]>;
  def int_riscv_set_dl_vvv_v : 
    Intrinsic<[], 
              [llvm_i32_ty,llvm_i32_ty,llvm_i32_ty],
              [IntrNoMem, ImmArg<ArgIndex<0>>, ImmArg<ArgIndex<1>>, ImmArg<ArgIndex<2>>, IntrHasSideEffects]>;
  // def int_riscv_dl_vvv_f32_mult : 
  //   Intrinsic<[riscv_v128f32_ty], 
  //             [llvm_ptr_ty, llvm_ptr_ty, llvm_ptr_ty, llvm_i32_ty, llvm_i32_ty, llvm_i32_ty],
  //             [ImmArg<ArgIndex<3>>, ImmArg<ArgIndex<4>>, ImmArg<ArgIndex<5>>]>;
  def int_riscv_dl_vvv_f32_mult : 
    Intrinsic<[], 
              [llvm_ptr_ty, llvm_ptr_ty, llvm_ptr_ty, llvm_i32_ty, llvm_i32_ty, llvm_i32_ty],
              [ImmArg<ArgIndex<3>>, ImmArg<ArgIndex<4>>, ImmArg<ArgIndex<5>>]>;
} // TargetPrefix = "riscv"