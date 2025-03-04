declare i32 @llvm.riscv.mopr.i32(i32 %a, i32 %b)

define i32 @mopr0_32(i32 %a) nounwind {
; RV32ZIMOP-LABEL: mopr0_32:
; RV32ZIMOP:       # %bb.0:
; RV32ZIMOP-NEXT:    mop.r.0 a0, a0
; RV32ZIMOP-NEXT:    ret
  %tmp = call i32 @llvm.riscv.mopr.i32(i32 %a, i32 0)
  ret i32 %tmp
}