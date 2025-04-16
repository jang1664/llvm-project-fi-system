def uimm12 : RISCVUImmLeafOp<12>;
// def F32GPR : RegisterOperand<F32VR>;
// def F16GPR : RegisterOperand<F16VR>;
def fpint_tuimm1 : TImmLeaf<XLenVT, [{return isUInt<2>(Imm);}]>;
def fpint_tuimm2 : TImmLeaf<XLenVT, [{return isUInt<2>(Imm);}]>;
def fpint_tuimm5 : TImmLeaf<XLenVT, [{return isUInt<5>(Imm);}]>;
def fpint_tuimm12 : TImmLeaf<XLenVT, [{return isUInt<12>(Imm);}]>;

// formats
let Predicates = [HasVendorXfpint, IsRV32], DecoderNamespace = "Xfpint" in {
  class F_MR<bits<3> funct3, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3, uimm1:$en1, uimm1:$en2, uimm1:$en3), opcodestr, "$rs1, $rs2, $rs3, $en1, $en2, $en3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<5> rs3;
    bits<1> en1;
    bits<1> en2;
    bits<1> en3;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;

    let Inst{31-27} = rs3;
    let Inst{26-25} = 0;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = funct3;
    let Inst{11}    = en3;
    let Inst{10}    = en2;
    let Inst{9}     = en1;
    let Inst{8-7}   = 0;
    let Inst{6-0}   = 0b1011011;
  }

  class F_Mat<bits<3> funct3, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3, uimm1:$widx, uimm1:$en1, uimm1:$en2, uimm1:$en3), opcodestr, "$rs1, $rs2, $rs3, $widx, $en1, $en2, $en3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<5> rs3;
    bits<1> en1;
    bits<1> en2;
    bits<1> en3;
    bits<1> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;

    let Inst{31-27} = rs3;
    let Inst{26}    = 0;
    let Inst{25}    = widx;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = funct3;
    let Inst{11}    = en3;
    let Inst{10}    = en2;
    let Inst{9}     = en1;
    let Inst{8-7}   = 0;
    let Inst{6-0}   = 0b1111011;
  }

  class F_MUR<bits<7> funct7, bits<3> funct3, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, uimm1:$en1, uimm1:$en2), opcodestr, "$rs1, $rs2, $en1, $en2", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<1> en1;
    bits<1> en2;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;

    let Inst{31-25} = funct7;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = funct3;
    let Inst{11}    = 0;
    let Inst{10}    = en2;
    let Inst{9}     = en1;
    let Inst{8-7}   = 0;
    let Inst{6-0}   = 0b0011111;
  }

  class F_DMA<bits<3> funct3, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3), opcodestr, "$rs1, $rs2, $rs3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<5> rs3;

    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-27} = rs3;
    let Inst{26-25} = 0;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = funct3;
    let Inst{11-7}   = 0;
    let Inst{6-0}   = 0b0111111;
  }

  class F_CTRL<bits<3> funct3, string opcodestr> : RVInst<(outs), (ins), opcodestr, "", [], InstFormatOther> {
    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-15} = 0;
    let Inst{14-12} = funct3;
    let Inst{11-7}   = 0;
    let Inst{6-0}   = 0b1011111;
  }

  class F_SYNC<bits<3> funct3, string opcodestr> : RVInst<(outs), (ins uimm5:$imm), opcodestr, "$imm", [], InstFormatOther> {
    bits<5> imm;
    
    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-15} = 0;
    let Inst{14-12} = funct3;
    let Inst{11-7}  = imm;
    let Inst{6-0}   = 0b1110111;
  }
}


// instructions
let Predicates = [HasVendorXfpint, IsRV32], DecoderNamespace = "Xfpint" in {
  foreach I = !range(0, 3, 1) in {
    def set_addr_cfg_#I : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3), "set_addr_cfg."#I, "$rs1, $rs2, $rs3", [], InstFormatOther> {
      bits<5> rs1;
      bits<5> rs2;
      bits<5> rs3;

      let Defs = [
        !cast<RISCVReg>("AddrGen"#I#"Dim0Strd"), !cast<RISCVReg>("AddrGen"#I#"Dim0Bound"),
        !cast<RISCVReg>("AddrGen"#I#"Dim1Strd"), !cast<RISCVReg>("AddrGen"#I#"Dim1Bound"),
        !cast<RISCVReg>("AddrGen"#I#"Dim2Strd"), !cast<RISCVReg>("AddrGen"#I#"Dim2Bound"),
      ];
      let hasSideEffects = 1;
      let mayLoad = 0;
      let mayStore = 0;
      // let isAsmParserOnly = 1;

      let Inst{31-27} = rs3;
      let Inst{26-25} = 0;
      let Inst{24-20} = rs2;
      let Inst{19-15} = rs1;
      let Inst{14-12} = 0;
      let Inst{11-9} = 0;
      let Inst{8-7} = I;
      let Inst{6-0}  = 0b0001011;
    }

    def set_cood_cfg_#I : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3), "set_cood_cfg."#I, "$rs1, $rs2, $rs3", [], InstFormatOther> {
      bits<5> rs1;
      bits<5> rs2;
      bits<5> rs3;

      let Defs = [
        !cast<RISCVReg>("CoodGen"#I#"Dim0Base"), !cast<RISCVReg>("CoodGen"#I#"Dim0Incr"),
        !cast<RISCVReg>("CoodGen"#I#"Dim1Base"), !cast<RISCVReg>("CoodGen"#I#"Dim1Incr"),
        !cast<RISCVReg>("CoodGen"#I#"Dim2Base"), !cast<RISCVReg>("CoodGen"#I#"Dim2Incr"),
      ];
      let hasSideEffects = 1;
      let mayLoad = 0;
      let mayStore = 0;
      // let isAsmParserOnly = 1;

      let Inst{31-27} = rs3;
      let Inst{26-25} = 0;
      let Inst{24-20} = rs2;
      let Inst{19-15} = rs1;
      let Inst{14-12} = 0;
      let Inst{11-9} = 0;
      let Inst{8-7} = I;
      let Inst{6-0}  = 0b0101011;
    }
  }

  def mul_m_vv_f32 : F_MR<0b000, "mul.m.vv.f32">;
  def add_m_vv_f16 : F_MR<0b001, "add.m.vv.f16">;
  def add_m_vv_f32 : F_MR<0b010, "add.m.vv.f32">;
  def mul_m_vs_f32 : F_MR<0b011, "mul.m.vs.f32">;
  def div_m_vs_f32 : F_MR<0b100, "div.m.vs.f32">;

  def set_loadw_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2), "set_loadw.mm", "$rs1, $rs2", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<1> en1;

    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-27} = 0;
    let Inst{26}    = 0;
    let Inst{25}    = 0;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def loadw_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, uimm1:$widx), "loadw.mm", "$rs1, $rs2, $widx", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<1> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-27} = 0;
    let Inst{26}    = 0;
    let Inst{25}    = widx;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def loadz_mm : RVInst<(outs), (ins GPR:$rs1, uimm1:$widx), "loadz.mm", "$rs1, $widx", [], InstFormatOther> {
    bits<5> rs1;
    bits<1> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-27} = 0;
    let Inst{26}    = 0;
    let Inst{25}    = widx;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b010;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def loads_mm : RVInst<(outs), (ins GPR:$rs1, uimm1:$widx), "loads.mm", "$rs1, $widx", [], InstFormatOther> {
    bits<5> rs1;
    bits<1> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-27} = 0;
    let Inst{26}    = 0;
    let Inst{25}    = widx;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b011;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }


  def gemm_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs3, uimm1:$widx, uimm1:$en1, uimm1:$en3), "gemm.mm", "$rs1, $rs3, $widx, $en1, $en3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs3;
    bits<1> en1;
    bits<1> en3;
    bits<1> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;

    let Inst{31-27} = rs3;
    let Inst{26}    = 0;
    let Inst{25}    = widx;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b100;
    let Inst{11}    = en3;
    let Inst{10}    = 0;
    let Inst{9}     = en1;
    let Inst{8-7}   = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def gemm_acc_mm : F_Mat<0b101, "gemm_acc.mm">;
  def gemm_acc_s_mm : F_Mat<0b110, "gemm_acc_s.mm">;
  def gemm_s_mm : F_Mat<0b111, "gemm_s.mm">;

  def exp_m_v_f32  : F_MUR<0b0000000, 0b000, "exp.m.v.f32">;
  def f16tof32_m_v : F_MUR<0b0000000, 0b001, "f16_to_f32.m.v">;
  def f32tof16_m_v : F_MUR<0b0000000, 0b010, "f32_to_f16.m.v">;
  def rsum_m_v_f32 : F_MUR<0b0000000, 0b011, "rsum.m.v.f32">;
  def relu_m_v_f32 : F_MUR<0b0000000, 0b100, "relu.m.v.f32">;
  def mv_m_v_f32   : F_MUR<0b0000000, 0b101, "mv.m.v.f32">;
  def neg_m_v_f32  : F_MUR<0b0000000, 0b110, "neg.m.v.f32">;
  def zero_m_v_f32 : F_MUR<0b0000000, 0b111, "zero.m.v.f32">;

  def load_shared : RVInst<(outs GPR:$rd), (ins GPRMem:$rs1, simm12:$imm12), "ld.shared", "$rd, ${imm12}(${rs1})", [], InstFormatOther> {
    bits<5> rd;
    bits<5> rs1;
    bits<12> imm12;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-20} = imm12;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000;
    let Inst{11-7}  = rd;
    let Inst{6-0}   = 0b1101011;
  }

  def store_shared : RVInst<(outs), (ins GPR:$rs2, GPRMem:$rs1, simm12:$imm12), "st.shared", "$rs2, ${imm12}(${rs1})", [], InstFormatOther> {
    bits<5> rs2;
    bits<5> rs1;
    bits<12> imm12;

    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 1;

    let Inst{31-25} = imm12{11-5};
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000;
    let Inst{11-7}  = imm12{4-0};
    let Inst{6-0}   = 0b1010111;
  }

  def vmask_set : RVInst<(outs), (ins GPRMem:$rs1), "vmask_set", "$rs1", [], InstFormatOther> {
    bits<5> rs1;

    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-25} = 0;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111111;
  }

  def dma_setup_dram  : F_DMA<0b000, "dma_setup_dram">;
  def dma_setup_sram  : F_DMA<0b001, "dma_setup_sram">;
  def dma_load_start  : F_DMA<0b010, "dma_load_start">;
  def dma_store_start : F_DMA<0b011, "dma_store_start">;

  // def dma_wait : RVInst<(outs), (ins uimm2:$id), "dma_wait", "$id", [], InstFormatOther> {
  //   bits<2> id;

  //   let hasSideEffects = 1;
  //   let mayLoad = 0;
  //   let mayStore = 0;

  //   let Inst{31-27} = 0;
  //   let Inst{26-25} = id;
  //   let Inst{24-20} = 0;
  //   let Inst{19-15} = 0;
  //   let Inst{14-12} = 0b100;
  //   let Inst{11-7}  = 0;
  //   let Inst{6-0}   = 0b0010000;
  // }

//   def rpt_start : RVInst<(outs GPR:$rd), (ins GPR:$rs1), "rpt_start", "$rd, $rs1", [], InstFormatOther> {
//     bits<5> rs1;
//     bits<5> rd;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-20} = 0;
//     let Inst{19-15} = rs1;
//     let Inst{14-12} = 0b000;
//     let Inst{11-7}  = rd;
//     let Inst{6-0}   = 0b0010100;
//   }

//   def rpt_end : RVInst<(outs GPR:$rd), (ins simm12:$imm12), "rpt_end", "$rd, $imm12", [], InstFormatOther> {
//     bits<5> rd;
//     bits<12> imm12;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 1;

//     // let isBranch = 1;
//     let isTerminator = 1;

//     let Inst{31-20} = imm12;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = 0;
//     let Inst{14-12} = 0b001;
//     let Inst{11-7}  = rd;
//     let Inst{6-0}   = 0b0011000;
//   }

  def halt : F_CTRL<0b000, "halt">;
  def irq  : F_CTRL<0b001, "irq">;

  def SET_SYNC  : F_SYNC<0b000, "set_sync">;
  def WAIT_SYNC : F_SYNC<0b001, "wait_sync">;
}

// // instructions
// let Predicates = [HasVendorXfpint, IsRV32], DecoderNamespace = "Xfpint" in {
//   def SET_DL_VVV_S : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2, uimm5:$idx3), "set_dl_vvv_s", "$idx1, $idx2, $idx3", [], InstFormatOther> {
//     bits<5> idx1;
//     bits<5> idx2;
//     bits<5> idx3;

//     let Defs = [DL_VVV_RS0, DL_VVV_RS1, DL_VVV_RS2];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = idx1;
//     let Inst{19-15} = idx2;
//     let Inst{14-13} = 0;
//     let Inst{12} = 0;
//     let Inst{11-7} = idx3;
//     let Inst{6-0}  = 0b0001100;
//   }

//   def SET_DL_VVV_V : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2, uimm5:$idx3), "set_dl_vvv_v", "$idx1, $idx2, $idx3", [], InstFormatOther> {
//     bits<5> idx1;
//     bits<5> idx2;
//     bits<5> idx3;

//     let Defs = [DL_VVV_VD0, DL_VVV_VD1, DL_VVV_VD2];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = idx1;
//     let Inst{19-15} = idx2;
//     let Inst{14-13} = 0;
//     let Inst{12} = 1;
//     let Inst{11-7} = idx3;
//     let Inst{6-0}  = 0b0001100;
//   }

//   class DL_VVV<bits<3> funct3, string opcodestr, string argstr>
//       : RVInst<(outs), (ins uimm1:$st_en, uimm1:$ld_en0, uimm1:$ld_en1, GPR:$rs1, GPR:$rs2, GPR:$rs3), opcodestr, argstr, [], InstFormatOther> {
//     bits<1> st_en;
//     bits<1> ld_en0;
//     bits<1> ld_en1;

//     // let Defs = [F32V0, F32V2, F32V4, F32V6];
//     // let Uses = [F32V0, F32V2, F32V4, F32V6];
//     let hasSideEffects = 1;
//     let mayLoad = 1;
//     let mayStore = 1;
//     // let isAsmParserOnly = 1;

//     let Inst{31-28} = 0;
//     let Inst{27} = st_en;
//     let Inst{26} = ld_en1;
//     let Inst{25} = ld_en0;
//     let Inst{24-15} = 0;
//     let Inst{14-12} = funct3;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0011100;
//   }

//   def DL_VVV_F32_MULT : DL_VVV<0b000, "dl.vvv.f32.mult", "$st_en, $ld_en0, $ld_en1">;
//   def DL_VVV_F32_MAC  : DL_VVV<0b001, "dl.vvv.f32.mac", "$st_en, $ld_en0, $ld_en1">;
//   def DL_VVV_F16_ADD  : DL_VVV<0b010, "dl.vvv.f16.add", "$st_en, $ld_en0, $ld_en1">;
//   def DL_VVV_F32_ADD  : DL_VVV<0b011, "dl.vvv.f32.add", "$st_en, $ld_en0, $ld_en1">;

//   def SET_DL_VVS_S : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2, uimm5:$idx3), "set_dl_vvs_s", "$idx1, $idx2, $idx3", [], InstFormatOther> {
//     bits<5> idx1;
//     bits<5> idx2;
//     bits<5> idx3;

//     let Defs = [DL_VVS_RS0, DL_VVS_RS1, DL_VVS_RS2];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = idx1;
//     let Inst{19-15} = idx2;
//     let Inst{14-13} = 0;
//     let Inst{12} = 0;
//     let Inst{11-7} = idx3;
//     let Inst{6-0}  = 0b0010000;
//   }

//   def SET_DL_VVS_V : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2, uimm5:$idx3), "set_dl_vvs_v", "$idx1, $idx2, $idx3", [], InstFormatOther> {
//     bits<5> idx1;
//     bits<5> idx2;
//     bits<5> idx3;

//     let Defs = [DL_VVS_VD0, DL_VVS_VD1, DL_VVS_VD2];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = idx1;
//     let Inst{19-15} = idx2;
//     let Inst{14-13} = 0;
//     let Inst{12} = 1;
//     let Inst{11-7} = idx3;
//     let Inst{6-0}  = 0b0010000;
//   }

//   class DL_VVS<bits<3> funct3, string opcodestr, string argstr>
//       : RVInst<(outs), (ins uimm1:$st_en, uimm1:$ld_en0, uimm1:$ld_en1), opcodestr, argstr, [], InstFormatOther> {
//     bits<1> st_en;
//     bits<1> ld_en0;
//     bits<1> ld_en1;

//     let Defs = [F32V0, F32V2, F32V4, F32V6];
//     let Uses = [F32V0, F32V2, F32V4, F32V6];
//     let hasSideEffects = 1;
//     let mayLoad = 1;
//     let mayStore = 1;
//     // let isAsmParserOnly = 1;

//     let Inst{31-28} = 0;
//     let Inst{27} = st_en;
//     let Inst{26} = ld_en1;
//     let Inst{25} = ld_en0;
//     let Inst{24-15} = 0;
//     let Inst{14-12} = funct3;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0011101;
//   }

//   def DL_VVS_F32_MULT : DL_VVS<0b000, "dl.vvs.f32.mult", "$st_en, $ld_en0, $ld_en1">;
//   def DL_VVS_F32_ADD  : DL_VVS<0b001, "dl.vvs.f32.add", "$st_en, $ld_en0, $ld_en1">;
//   def DL_VVS_F32_DIV  : DL_VVS<0b010, "dl.vvs.f32.div", "$st_en, $ld_en0, $ld_en1">;

//   def SET_SL_VV_S : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2), "set_sl_vv_s", "$idx1, $idx2", [], InstFormatOther> {
//     bits<5> idx1;
//     bits<5> idx2;

//     let Defs = [SL_VV_RS0, SL_VV_RS1];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = idx1;
//     let Inst{19-15} = idx2;
//     let Inst{14-13} = 0;
//     let Inst{12} = 0;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0010100;
//   }

//   def SET_SL_VV_V : RVInst<(outs), (ins uimm5:$idx1, uimm5:$idx2), "set_sl_vv_v", "$idx1, $idx2", [], InstFormatOther> {
//     bits<5> idx1;
//     bits<5> idx2;

//     let Defs = [SL_VV_VD0, SL_VV_VD1];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = idx1;
//     let Inst{19-15} = idx2;
//     let Inst{14-13} = 0;
//     let Inst{12} = 1;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0010100;
//   }

//   class SL_VV<bits<3> funct3, string opcodestr, string argstr>
//       : RVInst<(outs), (ins uimm1:$st_en, uimm1:$ld_en1), opcodestr, argstr, [], InstFormatOther> {
//     bits<1> st_en;
//     bits<1> ld_en1;

//     let Defs = [F32V0, F32V2, F32V4, F32V6];
//     let Uses = [F32V0, F32V2, F32V4, F32V6];
//     let hasSideEffects = 1;
//     let mayLoad = 1;
//     let mayStore = 1;

//     let Inst{31-28} = 0;
//     let Inst{27} = st_en;
//     let Inst{26} = ld_en1;
//     let Inst{25} = 0;
//     let Inst{24-15} = 0;
//     let Inst{14-12} = funct3;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0100100;
//   }

//   def SL_VV_F32_EXP    : SL_VV<0b000, "sl.vv.f32.exp", "$st_en, $ld_en1">;
//   def SL_VV_F16_TO_F32 : SL_VV<0b001, "sl.vv.f16_to_f32", "$st_en, $ld_en1">;
//   def SL_VV_F32_TO_F16 : SL_VV<0b010, "sl.vv.f32_to_f16", "$st_en, $ld_en1">;
//   def SL_VV_REDUCE_SUM : SL_VV<0b011, "sl.vv.reduce_sum", "$st_en, $ld_en1">;
//   def SL_VV_SWISH_GLU  : SL_VV<0b100, "sl.vv.swish_glu", "$st_en, $ld_en1">;
//   def SL_VV_RELU       : SL_VV<0b101, "sl.vv.relu", "$st_en, $ld_en1">;
//   def SL_VV_GELU       : SL_VV<0b110, "sl.vv.gelu", "$st_en, $ld_en1">;

//   def LOAD_MXU : RVInst<(outs), (ins uimm1:$widx, GPR:$rs1), "load_mxu", "$widx, $rs1", [], InstFormatOther> {
//     bits<1> widx;
//     bits<5> rs1;

//     let Defs = [MXUReg0, MXUReg1];
//     // let Uses = [F32V0, F32V2, F32V4, F32V6];
//     let hasSideEffects = 1;
//     let mayLoad = 1;
//     let mayStore = 0;
//     // let isAsmParserOnly = 1;

//     let Inst{31} = 0;
//     let Inst{30} = widx;
//     let Inst{29-25} = 0;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = rs1;
//     let Inst{14-12} = 0;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0100000;
//   }

//   def DL_VVM_GEMV : RVInst<(outs F32GPR:$vd1), (ins uimm1:$widx, GPR:$rs1, GPR:$rs2), "dl.vvm.gemv", "$vd1, $widx, $rs1, $rs2", [], InstFormatOther> {
//     bits<1> widx;
//     bits<5> rs1;
//     bits<5> rs2;
//     bits<5> vd1;

//     let hasSideEffects = 1;
//     let mayLoad = 1;
//     let mayStore = 1;

//     let Inst{31} = 0;
//     let Inst{30} = widx;
//     let Inst{29-25} = vd1;
//     let Inst{24-20} = rs2;
//     let Inst{19-15} = rs1;
//     let Inst{14-12} = 0b001;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0100000;
//   }

//   class SET_ADDR_CFG<string opcodestr, string argstr, int dim, bits<3> module_idx>
//       : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2), opcodestr, argstr, [], InstFormatOther> {
//     bits<1> en1;
//     bits<1> en2;
//     bits<1> en3;
//     bits<5> rs1;
//     bits<5> rs2;

//     // let Defs = [AddrGen#!cast<int>(module_idx)#Dim#dim#Strd, AddrGen#!cast<int>(module_idx)#Dim#dim#Bound];
//     let Defs = [
//       !cast<Register>("AddrGen"#!cast<int>(module_idx)#"Dim"#dim#"Strd"),
//       !cast<Register>("AddrGen"#!cast<int>(module_idx)#"Dim"#dim#"Bound")
//     ];
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let en1 = !cond(
//       !eq(!cast<int>(module_idx), 0) : 1,
//       true : 0
//     );
//     let en2 = !cond(
//       !eq(!cast<int>(module_idx), 1) : 1,
//       true : 0
//     );
//     let en3 = !cond(
//       !eq(!cast<int>(module_idx), 2) : 1,
//       true : 0
//     );

//     let Inst{31-25} = 0;
//     let Inst{24-20} = rs1; // stride
//     let Inst{19-15} = rs2; // bound
//     let Inst{14} = en1;
//     let Inst{13} = en2;
//     let Inst{12} = en3;
//     let Inst{11-10} = 0;
//     let Inst{9-7} = dim;
//     let Inst{6-0}  = 0b0000000;
//   }

//   foreach ModIdx = !range(0, 3, 1) in {
//     foreach DimIdx = !range(0, 3, 1) in {
//       def SET_ADDR_CFG_MOD#ModIdx#_DIM#DimIdx : SET_ADDR_CFG<"set_addr_cfg.mod"#ModIdx#".dim"#DimIdx, "$rs1, $rs2", DimIdx, ModIdx>;
//     }
//   }

//   class SPL<bits<3> funct3, string opcodestr, string argstr>
//       : RVInst<(outs F32GPR:$vd), (ins F32GPR:$vs1), opcodestr, argstr, [], InstFormatOther> {

//     bits<5> vs1;
//     bits<5> vd;

//     let hasSideEffects = 0;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-20} = 0;
//     let Inst{19-15} = vs1;
//     let Inst{14-12} = funct3;
//     let Inst{11-7} = vd;
//     let Inst{6-0}  = 0b0101000;
//   }

//   def SW_GLU : SPL<0b000, "sw_glu", "$vd, $vs1">;
//   def RELU : SPL<0b001, "relu", "$vd, $vs1">;
//   def GELU : SPL<0b010, "gelu", "$vd, $vs1">;

//   def RPT : RVInst<(outs), (ins uimm12:$imm, GPR:$rs1), "rpt", "$rs1, $imm", [], InstFormatOther> {
//     bits<12> imm;
//     bits<5> rs1;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-20} = imm;
//     let Inst{19-15} = rs1;
//     let Inst{14-12} = 0;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0101100;
//   }

//   def DMA_SETUP_DRAM : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3, GPR:$rs4, uimm2:$id), "dma.setup.dram", "$id $rs1, $rs2, $rs3, $rs4", [], InstFormatOther> {
//     bits<5> rs1;
//     bits<5> rs2;
//     bits<5> rs3;
//     bits<5> rs4;
//     bits<2> id;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-30} = id;
//     let Inst{29-25} = rs4;
//     let Inst{24-20} = rs3;
//     let Inst{19-15} = rs2;
//     let Inst{14-12} = 0;
//     let Inst{11-7} = rs1;
//     let Inst{6-0}  = 0b0110000;
//   }

//   def DMA_SETUP_SRAM : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3, GPR:$rs4, uimm2:$id), "dma.setup.sram", "$id $rs1, $rs2, $rs3, $rs4", [], InstFormatOther> {
//     bits<5> rs1;
//     bits<5> rs2;
//     bits<5> rs3;
//     bits<5> rs4;
//     bits<2> id;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-30} = id;
//     let Inst{29-25} = rs4;
//     let Inst{24-20} = rs3;
//     let Inst{19-15} = rs2;
//     let Inst{14-12} = 1;
//     let Inst{11-7} = rs1;
//     let Inst{6-0}  = 0b0110000;
//   }

//   def DMA_LOAD_START : RVInst<(outs), (ins uimm2:$id), "dma.load.start", "$id", [], InstFormatOther> {
//     bits<2> id;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-30} = id;
//     let Inst{29-25} = 0;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = 0;
//     let Inst{14-12} = 2;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0110000;
//   }

//   def DMA_STORE_START : RVInst<(outs), (ins uimm2:$id), "dma.store.start", "$id", [], InstFormatOther> {
//     bits<2> id;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-30} = id;
//     let Inst{29-25} = 0;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = 0;
//     let Inst{14-12} = 3;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0110000;
//   }

//   def DMA_WAIT : RVInst<(outs), (ins uimm2:$id), "dma.wait", "$id", [], InstFormatOther> {
//     bits<2> id;

//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-30} = id;
//     let Inst{29-25} = 0;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = 0;
//     let Inst{14-12} = 4;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0110000;
//   }

//   def HALT : RVInst<(outs), (ins), "halt", "", [], InstFormatOther> {
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = 0;
//     let Inst{14-12} = 0;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0110100;
//   }

//   def IRQ : RVInst<(outs), (ins), "irq", "", [], InstFormatOther> {
//     let hasSideEffects = 1;
//     let mayLoad = 0;
//     let mayStore = 0;

//     let Inst{31-25} = 0;
//     let Inst{24-20} = 0;
//     let Inst{19-15} = 0;
//     let Inst{14-12} = 1;
//     let Inst{11-7} = 0;
//     let Inst{6-0}  = 0b0110100;
//   }
// }

// // def : Pat<(vt (OpNode (vt GPR:$rs1))), (Inst GPR:$rs1)>;
// // def : Pat<
// //   (int_riscv_set_dl_vvv_s (i32 uimm5:$idx1), (i32 uimm5:$idx2), (i32 uimm5:$idx3)),
// //   (SET_DL_VVV_S (i32 uimm5:$idx1), (i32 uimm5:$idx2), (i32 uimm5:$idx3))>;

// let Predicates = [HasVendorXfpint, IsRV32] in {
//   def : Pat<
//     (int_riscv_set_dl_vvv_s fpint_tuimm5:$idx1, fpint_tuimm5:$idx2, fpint_tuimm5:$idx3),
//     (SET_DL_VVV_S fpint_tuimm5:$idx1, fpint_tuimm5:$idx2, fpint_tuimm5:$idx3)>;

//   def : Pat<
//     (int_riscv_set_dl_vvv_v fpint_tuimm5:$idx1, fpint_tuimm5:$idx2, fpint_tuimm5:$idx3),
//     (SET_DL_VVV_V fpint_tuimm5:$idx1, fpint_tuimm5:$idx2, fpint_tuimm5:$idx3)>;
  
//   def : Pat<
//     (int_riscv_dl_vvv_f32_mult GPR:$rs1, GPR:$rs2, GPR:$rs3, fpint_tuimm1:$en1, fpint_tuimm1:$en2, fpint_tuimm1:$en3),
//     (DL_VVV_F32_MULT fpint_tuimm1:$en1, fpint_tuimm1:$en2, fpint_tuimm1:$en3, GPR:$rs1, GPR:$rs2, GPR:$rs3)>;
// }