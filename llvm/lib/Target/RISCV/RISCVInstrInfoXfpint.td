def uimm12 : RISCVUImmLeafOp<12>;
def fpint_tuimm1 : TImmLeaf<XLenVT, [{return isUInt<2>(Imm);}]>;
def fpint_tuimm2 : TImmLeaf<XLenVT, [{return isUInt<2>(Imm);}]>;
def fpint_tuimm5 : TImmLeaf<XLenVT, [{return isUInt<5>(Imm);}]>;
def fpint_tuimm12 : TImmLeaf<XLenVT, [{return isUInt<12>(Imm);}]>;

// formats
let Predicates = [HasVendorXfpint, IsRV32], DecoderNamespace = "Xfpint" in {
  class F_MR<bits<2>funct2_b, bits<2>funct2, bits<3> funct3, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3, uimm1:$en1, uimm1:$en2, uimm1:$en3), opcodestr, "$rs1, $rs2, $rs3, $en1, $en2, $en3", [], InstFormatOther> {
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
    let Inst{26-25} = funct2;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = funct3;
    let Inst{11}    = en3;
    let Inst{10}    = en2;
    let Inst{9}     = en1;
    let Inst{8-7}   = funct2_b;
    let Inst{6-0}   = 0b1011011;
  }

  class F_Mat<bits<3> funct3, bits<2> func2, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$rs3, uimm1:$en1, uimm1:$en2, uimm1:$en3), opcodestr, "$rs1, $rs2, $rs3, $en1, $en2, $en3", [], InstFormatOther> {
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
    let Inst{26-25} = func2;
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

  class F_SYNC_REG<bits<3> funct3, string opcodestr> : RVInst<(outs), (ins GPR:$rs1), opcodestr, "$rs1", [], InstFormatOther> {
    bits<5> rs1;
    
    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = funct3;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1110111;
  }
}

class F_gemm_mm<bits<2> funct2, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs3, uimm1:$en1, uimm1:$en3), opcodestr, "$rs1, $rs3, $en1, $en3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs3;
    bits<1> en1;
    bits<1> en3;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;

    let Inst{31-27} = rs3;
    let Inst{26-25} = funct2;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b100;
    let Inst{11}    = en3;
    let Inst{10}    = 0;
    let Inst{9}     = en1;
    let Inst{8-7}   = 0;
    let Inst{6-0}   = 0b1111011;
}

class F_gemm_s_mm<bits<2> funct2, string opcodestr> : RVInst<(outs), (ins GPR:$rs1, GPR:$rs3, uimm1:$en1, uimm1:$en3), opcodestr, "$rs1, $rs3, $en1, $en3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs3;
    bits<1> en1;
    bits<1> en3;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;

    let Inst{31-27} = rs3;
    let Inst{26-25} = funct2;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111;
    let Inst{11}    = en3;
    let Inst{10}    = 0;
    let Inst{9}     = en1;
    let Inst{8-7}   = 0;
    let Inst{6-0}   = 0b1111011;
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

  def add_m_vv_f16  : F_MR<0b00, 0b10, 0b000, "add.m.vv.f16">;
  def add_m_vv_f32  : F_MR<0b00, 0b00, 0b000, "add.m.vv.f32">;
  def add_m_vv_i8   : F_MR<0b10, 0b00, 0b000, "add.m.vv.i8">;
  def add_m_vs_i8   : F_MR<0b10, 0b01, 0b000, "add.m.vs.i8">;
  def sub_m_vv_f32  : F_MR<0b00, 0b00, 0b001, "sub.m.vv.f32">;
  def sub_m_vs_f32  : F_MR<0b00, 0b01, 0b001, "sub.m.vs.f32">;
  def mul_m_vv_f16  : F_MR<0b00, 0b10, 0b010, "mul.m.vv.f16">;
  def mul_m_vv_f32  : F_MR<0b00, 0b00, 0b010, "mul.m.vv.f32">;
  def mul_m_vs_f32  : F_MR<0b00, 0b01, 0b010, "mul.m.vs.f32">;
  def div_m_vv_f32  : F_MR<0b00, 0b00, 0b011, "div.m.vv.f32">;
  def div_m_vs_f32  : F_MR<0b00, 0b01, 0b011, "div.m.vs.f32">;
  def max_m_vv_i8   : F_MR<0b10, 0b00, 0b100, "max.m.vv.i8">;
  def max_m_vs_f32  : F_MR<0b00, 0b01, 0b100, "max.m.vs.f32">;
  def max_m_vv_f32  : F_MR<0b00, 0b00, 0b100, "max.m.vv.f32">;
  def rsum_m_vs_f32 : F_MR<0b00, 0b01, 0b101, "rsum.m.vs.f32">;
  def min_m_vv_i8   : F_MR<0b10, 0b00, 0b110, "min.m.vv.i8">;
  def min_m_vs_f32  : F_MR<0b00, 0b01, 0b110, "min.m.vs.f32">;

  def set_loadw_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2,  GPR:$rs3), "set_loadw.mm", "$rs1, $rs2, $rs3", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<5> rs3;

    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-27} = rs3;
    let Inst{26}    = 0;
    let Inst{25}    = 0;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def loadw_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs2, GPR:$widx), "loadw.mm", "$rs1, $rs2, $widx", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> rs2;
    bits<5> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-27} = widx;
    let Inst{26-25} = 0;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def loadz_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$widx), "loadz.mm", "$rs1, $widx", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-27} = widx;
    let Inst{26-25} = 0;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b010;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def loads_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$widx), "loads.mm", "$rs1, $widx", [], InstFormatOther> {
    bits<5> rs1;
    bits<5> widx;

    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 0;

    let Inst{31-27} = widx;
    let Inst{26-25} = 0;
    let Inst{24-20} = 0;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b011;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def set_op_idx_mm : RVInst<(outs), (ins GPR:$rs3), "set_op_idx.mm", "$rs3", [], InstFormatOther> {
    bits<5> rs3;

    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;

    let Inst{31-27} = rs3;
    let Inst{26-25} = 0b01;
    let Inst{24-20} = 0;
    let Inst{19-15} = 0;
    let Inst{14-12} = 0b011;
    let Inst{11-7}  = 0;
    let Inst{6-0}   = 0b1111011;
  }

  def gemm_mm_32x128 : F_gemm_mm<0b00, "gemm.mm.32x128">;
  def gemm_mm_64x64  : F_gemm_mm<0b01, "gemm.mm.64x64">;
  def gemm_mm_128x32 : F_gemm_mm<0b10, "gemm.mm.128x32">;
  // def gemm_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs3, uimm1:$en1, uimm1:$en3), "gemm.mm", "$rs1, $rs3, $en1, $en3", [], InstFormatOther> {
  //   bits<5> rs1;
  //   bits<5> rs3;
  //   bits<1> en1;
  //   bits<1> en3;

  //   let hasSideEffects = 1;
  //   let mayLoad = 1;
  //   let mayStore = 1;

  //   let Inst{31-27} = rs3;
  //   let Inst{26-25} = 0;
  //   let Inst{24-20} = 0;
  //   let Inst{19-15} = rs1;
  //   let Inst{14-12} = 0b100;
  //   let Inst{11}    = en3;
  //   let Inst{10}    = 0;
  //   let Inst{9}     = en1;
  //   let Inst{8-7}   = 0;
  //   let Inst{6-0}   = 0b1111011;
  // }

  // def gemm_s_mm : RVInst<(outs), (ins GPR:$rs1, GPR:$rs3, uimm1:$en1, uimm1:$en3), "gemm_s.mm", "$rs1, $rs3, $en1, $en3", [], InstFormatOther> {
  //   bits<5> rs1;
  //   bits<5> rs3;
  //   bits<1> en1;
  //   bits<1> en3;

  //   let hasSideEffects = 1;
  //   let mayLoad = 1;
  //   let mayStore = 1;

  //   let Inst{31-27} = rs3;
  //   let Inst{26}    = 0;
  //   let Inst{25}    = 0;
  //   let Inst{24-20} = 0;
  //   let Inst{19-15} = rs1;
  //   let Inst{14-12} = 0b111;
  //   let Inst{11}    = en3;
  //   let Inst{10}    = 0;
  //   let Inst{9}     = en1;
  //   let Inst{8-7}   = 0;
  //   let Inst{6-0}   = 0b1111011;
  // }
  def gemm_s_mm_32x128 : F_gemm_s_mm<0b00, "gemm_s.mm.32x128">;
  def gemm_s_mm_64x64  : F_gemm_s_mm<0b01, "gemm_s.mm.64x64">;
  def gemm_s_mm_128x32 : F_gemm_s_mm<0b10, "gemm_s.mm.128x32">;

  def gemm_acc_mm_32x128   : F_Mat<0b101, 0b00, "gemm_acc.mm.32x128">;
  def gemm_acc_mm_64x64    : F_Mat<0b101, 0b01, "gemm_acc.mm.64x64">;
  def gemm_acc_mm_128x32   : F_Mat<0b101, 0b10, "gemm_acc.mm.128x32">;

  def gemm_acc_s_mm_32x128 : F_Mat<0b110, 0b00, "gemm_acc_s.mm.32x128">;
  def gemm_acc_s_mm_64x64  : F_Mat<0b110, 0b01, "gemm_acc_s.mm.64x64">;
  def gemm_acc_s_mm_128x32 : F_Mat<0b110, 0b10, "gemm_acc_s.mm.128x32">;

  def exp_m_v_f32   : F_MUR<0b0000000, 0b000, "exp.m.v.f32">;
  def f16tof32_m_v  : F_MUR<0b0000000, 0b001, "f16_to_f32.m.v">;
  def f32tof16_m_v  : F_MUR<0b0000000, 0b010, "f32_to_f16.m.v">;
  def rsum_m_v_f32  : F_MUR<0b0000000, 0b011, "rsum.m.v.f32">;
  def max_m_v_f32   : F_MUR<0b0000000, 0b100, "max.m.v.f32">;
  def mv_m_v_f16    : F_MUR<0b0000010, 0b101, "mv.m.v.f16">;
  def mv_m_v_f32    : F_MUR<0b0000000, 0b101, "mv.m.v.f32">;
  def neg_m_v_f16   : F_MUR<0b0000010, 0b110, "neg.m.v.f16">;
  def neg_m_v_f32   : F_MUR<0b0000000, 0b110, "neg.m.v.f32">;
  def zero_m_v_f32  : F_MUR<0b0000000, 0b111, "zero.m.v.f32">;
  def f32toi8_m_v   : F_MUR<0b0000001, 0b000, "f32_to_i8.m.v">;
  def f32toi4_m_v   : F_MUR<0b0000010, 0b000, "f32_to_i4.m.v">;
  def i8toi4_m_v    : F_MUR<0b0000011, 0b000, "i8_to_i4.m.v">;

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

  def halt : F_CTRL<0b000, "halt">;
  def irq  : F_CTRL<0b001, "irq">;

  def SET_SYNC  : F_SYNC<0b000, "set_sync">;
  def WAIT_SYNC : F_SYNC<0b001, "wait_sync">;
  def SET_SYNC_REG  : F_SYNC_REG<0b010, "set_sync.reg">;
  def WAIT_SYNC_REG : F_SYNC_REG<0b011, "wait_sync.reg">;
}
