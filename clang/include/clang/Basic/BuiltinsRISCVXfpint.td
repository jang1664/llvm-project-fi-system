class RISCXfpintBuiltin<string prototype, string features = ""> : TargetBuiltin {
  let Spellings = ["__builtin_riscv_fpint_" # NAME];
  let Prototype = prototype;
  let Features = features;
}

let Attributes = [NoThrow, Const] in {
//===----------------------------------------------------------------------===//
// Xfpint extensions
//===----------------------------------------------------------------------===//
def set_dl_vvv_s  : RISCXfpintBuiltin<"void(int, int, int)", "xfpint">;
def set_dl_vvv_v  : RISCXfpintBuiltin<"void(int, int, int)", "xfpint">;
def dl_vvv_f32_mult  : RISCXfpintBuiltin<"void(int*, int*, int*, int, int, int)", "xfpint">;
} // Attributes = [NoThrow, Const]
