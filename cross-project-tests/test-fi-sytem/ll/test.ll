declare void @llvm.riscv.set.dl.vvv.s(i32, i32, i32)
declare void @llvm.riscv.set.dl.vvv.v(i32, i32, i32)
declare <128 x float> @llvm.riscv.dl.vvv.f32.mult(ptr, ptr, ptr, i32, i32, i32)

define i32 @test(ptr %a, ptr %b, ptr %c) {
  call void @llvm.riscv.set.dl.vvv.s(i32 1, i32 2, i32 3)
  call void @llvm.riscv.set.dl.vvv.v(i32 1, i32 2, i32 3)
  %3 = call <128 x float> @llvm.riscv.dl.vvv.f32.mult(ptr %a, ptr %b, ptr %c, i32 1, i32 2, i32 3)
  ret i32 0
}