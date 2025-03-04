declare i32 @llvm.riscv.vsetvli(
  i32, i32, i32);

define signext i32 @vsetvl_sext() {
; CHECK-LABEL: vsetvl_sext:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli a0, 1, e16, m2, ta, ma
; CHECK-NEXT:    ret
  %a = call i32 @llvm.riscv.vsetvli(i32 1, i32 1, i32 1)
  ret i32 %a
}