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
} // Attributes = [NoThrow, Const]
