// def SDT_RISCV_DL_SET_PROFILE : SDTypeProfile<0, 3, [SDTCisVT<0, i32>, SDTCisVT<1, i32>, SDTCisVT<2, i32> ]>;
// def SDT_RISCV_DL_FP32_PROFILE : SDTypeProfile<1, 6, [SDTCisVT<0, v128f32>, SDTCisVT<1, iPTR>, SDTCisVT<2, iPTR>, SDTCisVT<3, iPTR>, SDTCisVT<4, i32>, SDTCisVT<5, i32>, SDTCisVT<6, i32>]>;

// def riscv_set_dl_vvv_s : SDNode<"RISCVISD::SET_DL_VVV_S", SDT_RISCV_DL_SET_PROFILE>;
// def riscv_set_dl_vvv_v : SDNode<"RISCVISD::SET_DL_VVV_S", SDT_RISCV_DL_SET_PROFILE>;
// def riscv_dl_vvv_mult_f32 : SDNode<"RISCVISD::DL_VVV_MULT_F32", SDT_RISCV_DL_FP32_PROFILE>;

// def : Pat<(riscv_set_dl_vvv_s i32::$idx1, i32::$idx2, i32::$idx3), (SET_DL_VVV_S i32::$idx1, i32::$idx2, i32::$idx3)>;
// def : Pat<(riscv_set_dl_vvv_v i32::$idx1, i32::$idx2, i32::$idx3), (SET_DL_VVV_V i32::$idx1, i32::$idx2, i32::$idx3)>;
// def : Pat<(riscv_dl_vvv_mult_f32 v128f32:$a, iPTR:$b, iPTR:$c, iPTR:$d, i32:$e, i32:$f, i32:$g), (DL_VVV_MULT_F32 v128f32:$a, iPTR:$b, iPTR:$c, iPTR:$d, i32:$e, i32:$f, i32:$g)>;

// class RVInstRBase<bits<3> funct3, RISCVOpcode opcode, dag outs,
//                   dag ins, string opcodestr, string argstr>
//     : RVInst<outs, ins, opcodestr, argstr, [], InstFormatR> {
//   bits<5> rs2;
//   bits<5> rs1;
//   bits<5> rd;

//   let Inst{25-20} = rs2;
//   let Inst{19-15} = rs1;
//   let Inst{14-12} = funct3;
//   let Inst{11-7} = rd;
//   let Inst{6-0} = opcode.Value;
// }

let Predicates = [HasVendorXfpint, IsRV32], DecoderNamespace = "Xfpint" in {
  def SET_DL_VVV_S : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2, uimm5:$idx3), "SET_DL_VVV_S", "$idx1, $idx2, $idx3", [], InstFormatOther> {
    bits<5> idx1;
    bits<5> idx2;
    bits<5> idx3;

    let Defs = [DL_VVV_RS0, DL_VVV_RS1, DL_VVV_RS2];
    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;
    // let isAsmParserOnly = 1;

    let Inst{31-25} = 0;
    let Inst{24-20} = idx1;
    let Inst{19-15} = idx2;
    let Inst{14-13} = 0;
    let Inst{12} = 0;
    let Inst{11-7} = idx3;
    let Inst{6-0}  = 0b0011100;
  }
}