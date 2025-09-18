
./obj/test_fpint.o:	file format elf32-littleriscv

Disassembly of section .strtab:

00000000 <.strtab>:
       0: 00782400     	<unknown>
       4: 7865742e     	<unknown>
       8: 65740074     	<unknown>
       c: 73007473     	csrrci	s0, mhpmevent16h, 0x0
      10: 74726174     	<unknown>
      14: 6f632e00     	<unknown>
      18: 6e656d6d     	<unknown>
      1c: 722e0074     	<unknown>
      20: 76637369     	<unknown>
      24: 7474612e     	<unknown>
      28: 75626972     	<unknown>
      2c: 00736574     	<unknown>
      30: 746f6e2e     	<unknown>
      34: 4e472e65     	<unknown>
      38: 74732d55     	<unknown>
      3c: 006b6361     	<unknown>
      40: 766c6c2e     	<unknown>
      44: 64615f6d     	<unknown>
      48: 69737264     	<unknown>
      4c: 64240067     	jalr	zero, 0x642(s0)
      50: 73657400     	<unknown>
      54: 00632e74     	<unknown>
      58: 7274732e     	<unknown>
      5c: 00626174     	<unknown>
      60: 6d79732e     	<unknown>
      64: 00626174     	<unknown>

Disassembly of section .text:

00000000 <test>:
       0: e073000b     	set_addr_cfg.0	t1, t2, t3
       4: e073008b     	set_addr_cfg.1	t1, t2, t3
       8: e073010b     	set_addr_cfg.2	t1, t2, t3
       c: e073002b     	set_cood_cfg.0	t1, t2, t3
      10: e07300ab     	set_cood_cfg.1	t1, t2, t3
      14: e073012b     	set_cood_cfg.2	t1, t2, t3
      18: e473085b     	add.m.vv.f16	t1, t2, t3, 0x0, 0x0, 0x1
      1c: e073045b     	add.m.vv.f32	t1, t2, t3, 0x0, 0x1, 0x0
      20: e073055b     	add.m.vv.i8	t1, t2, t3, 0x0, 0x1, 0x0
      24: e273055b     	add.m.vs.i8	t1, t2, t3, 0x0, 0x1, 0x0
      28: e0731c5b     	sub.m.vv.f32	t1, t2, t3, 0x0, 0x1, 0x1
      2c: e2731c5b     	sub.m.vs.f32	t1, t2, t3, 0x0, 0x1, 0x1
      30: e073205b     	mul.m.vv.f32	t1, t2, t3, 0x0, 0x0, 0x0
      34: e073205b     	mul.m.vv.f32	t1, t2, t3, 0x0, 0x0, 0x0
      38: e273225b     	mul.m.vs.f32	t1, t2, t3, 0x1, 0x0, 0x0
      3c: e0733a5b     	div.m.vv.f32	t1, t2, t3, 0x1, 0x0, 0x1
      40: e273365b     	div.m.vs.f32	t1, t2, t3, 0x1, 0x1, 0x0
      44: e0734f5b     	max.m.vv.i8	t1, t2, t3, 0x1, 0x1, 0x1
      48: e0734e5b     	max.m.vv.f32	t1, t2, t3, 0x1, 0x1, 0x1
      4c: e2734e5b     	max.m.vs.f32	t1, t2, t3, 0x1, 0x1, 0x1
      50: e2735e5b     	rsum.m.vs.f32	t1, t2, t3, 0x1, 0x1, 0x1
      54: e0736f5b     	min.m.vv.i8	t1, t2, t3, 0x1, 0x1, 0x1
      58: e2736e5b     	min.m.vs.f32	t1, t2, t3, 0x1, 0x1, 0x1
      5c: e073007b     	set_loadw.mm	t1, t2, t3
      60: e073107b     	loadw.mm	t1, t2, t3
      64: 3803207b     	loadz.mm	t1, t2
      68: 3803307b     	loads.mm	t1, t2
      6c: 3200307b     	set_op_idx.mm	t1
      70: 38034a7b     	gemm.mm.32x128	t1, t2, 0x1, 0x1
      74: 3a034a7b     	gemm.mm.64x64	t1, t2, 0x1, 0x1
      78: 3c034a7b     	gemm.mm.128x32	t1, t2, 0x1, 0x1
      7c: e0735e7b     	gemm_acc.mm.32x128	t1, t2, t3, 0x1, 0x1, 0x1
      80: e2735e7b     	gemm_acc.mm.64x64	t1, t2, t3, 0x1, 0x1, 0x1
      84: e4735e7b     	gemm_acc.mm.128x32	t1, t2, t3, 0x1, 0x1, 0x1
      88: e0736e7b     	gemm_acc_s.mm.32x128	t1, t2, t3, 0x1, 0x1, 0x1
      8c: e2736e7b     	gemm_acc_s.mm.64x64	t1, t2, t3, 0x1, 0x1, 0x1
      90: e4736e7b     	gemm_acc_s.mm.128x32	t1, t2, t3, 0x1, 0x1, 0x1
      94: 38037a7b     	gemm_s.mm.32x128	t1, t2, 0x1, 0x1
      98: 3a037a7b     	gemm_s.mm.64x64	t1, t2, 0x1, 0x1
      9c: 3c037a7b     	gemm_s.mm.128x32	t1, t2, 0x1, 0x1
      a0: 0073061f     	exp.m.v.f32	t1, t2, 0x1, 0x1
      a4: 0073161f     	f16_to_f32.m.v	t1, t2, 0x1, 0x1
      a8: 0073261f     	f32_to_f16.m.v	t1, t2, 0x1, 0x1
      ac: 0073361f     	rsum.m.v.f32	t1, t2, 0x1, 0x1
      b0: 0073461f     	max.m.v.f32	t1, t2, 0x1, 0x1
      b4: 0473561f     	mv.m.v.f16	t1, t2, 0x1, 0x1
      b8: 0073561f     	mv.m.v.f32	t1, t2, 0x1, 0x1
      bc: 0473661f     	neg.m.v.f16	t1, t2, 0x1, 0x1
      c0: 0073661f     	neg.m.v.f32	t1, t2, 0x1, 0x1
      c4: 0073761f     	zero.m.v.f32	t1, t2, 0x1, 0x1
      c8: 0273061f     	f32_to_i8.m.v	t1, t2, 0x1, 0x1
      cc: 0023836b     	ld.shared	t1, 0x2(t2)
      d0: 00638157     	st.shared	t1, 0x2(t2)
      d4: 0003007f     	vmask_set	t1
      d8: e073003f     	dma_setup_dram	t1, t2, t3
      dc: e073103f     	dma_setup_sram	t1, t2, t3
      e0: e073203f     	dma_load_start	t1, t2, t3
      e4: e073303f     	dma_store_start	t1, t2, t3
      e8: 0000005f     	halt
      ec: 0000105f     	irq
      f0: 00008067     	jalr	zero, 0x0(ra)
      f4: 00000177     	set_sync	0x2
      f8: 000011f7     	wait_sync	0x3
      fc: 00032077     	set_sync.reg	t1
     100: 00033077     	wait_sync.reg	t1
     104: 00004077     	core_sync
     108: 0000235f     	hid	t1
     10c: 000033df     	wid	t2

Disassembly of section .comment:

00000000 <.comment>:
       0: 616c6300     	<unknown>
       4: 7620676e     	<unknown>
       8: 69737265     	<unknown>
       c: 32206e6f     	jal	t3, 0x632e <.comment+0x632e>
      10: 2e302e31     	<unknown>
      14: 74696730     	<unknown>
      18: 69672820     	<unknown>
      1c: 69674074     	<unknown>
      20: 62756874     	<unknown>
      24: 6d6f632e     	<unknown>
      28: 6e616a3a     	<unknown>
      2c: 36363167     	<unknown>
      30: 6c6c2f34     	<unknown>
      34: 702d6d76     	<unknown>
      38: 656a6f72     	<unknown>
      3c: 662d7463     	bgeu	s10, sp, 0x6a4 <.comment+0x6a4>
      40: 79732d69     	<unknown>
      44: 6d657473     	csrrci	s0, 0x6d6, 0xa
      48: 7469672e     	<unknown>
      4c: 61646320     	<unknown>
      50: 36653931     	<unknown>
      54: 36626462     	<unknown>
      58: 66356633     	<unknown>
      5c: 66326264     	<unknown>
      60: 38643731     	<unknown>
      64: 36333038     	<unknown>
      68: 61306439     	<unknown>
      6c: 65343530     	<unknown>
      70: 34663464     	<unknown>
      74: 65           	<unknown>
      75: 29           	<unknown>
      76: 00           	<unknown>

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
       0: 00006841     	<unknown>
       4: 73697200     	<unknown>
       8: 01007663     	bgeu	zero, a6, 0x14 <.riscv.attributes+0x14>
       c: 0000005e     	<unknown>
      10: 33767205     	<unknown>
      14: 70326932     	<unknown>
      18: 326d5f31     	<unknown>
      1c: 615f3070     	<unknown>
      20: 5f317032     	<unknown>
      24: 32703266     	<unknown>
      28: 7032645f     	<unknown>
      2c: 697a5f32     	<unknown>
      30: 32727363     	bgeu	tp, t2, 0x356 <.riscv.attributes+0x356>
      34: 7a5f3070     	<unknown>
      38: 6e656669     	<unknown>
      3c: 32696563     	bltu	s2, t1, 0x366 <.riscv.attributes+0x366>
      40: 7a5f3070     	<unknown>
      44: 6c756d6d     	<unknown>
      48: 5f307031     	<unknown>
      4c: 6d61617a     	<unknown>
      50: 3070316f     	jal	sp, 0x3b56 <.riscv.attributes+0x3b56>
      54: 6c617a5f     	<unknown>
      58: 31637372     	<unknown>
      5c: 785f3070     	<unknown>
      60: 6e697066     	<unknown>
      64: 32703074     	<unknown>
      68: 00           	<unknown>

Disassembly of section .symtab:

00000000 <.symtab>:
		...
      10: 00000051     	<unknown>
		...
      1c: fff10004     	<unknown>
      20: 0000000f     	fence	0, 0
		...
      2c: 00020000     	<unknown>
      30: 00000001     	<unknown>
		...
      3c: 00020000     	<unknown>
      40: 0000004e     	<unknown>
		...
      4c: 00030000     	<unknown>
      50: 0000004e     	<unknown>
		...
      5c: 00050000     	<unknown>
      60: 0000000a     	<unknown>
      64: 00000000     	<unknown>
      68: 00000110     	<unknown>
      6c: 00020012     	<unknown>
