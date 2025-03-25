
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
      4c: 6e650067     	jalr	zero, 0x6e6(a0)
      50: 64240064     	<unknown>
      54: 73657400     	<unknown>
      58: 00632e74     	<unknown>
      5c: 7274732e     	<unknown>
      60: 00626174     	<unknown>
      64: 6d79732e     	<unknown>
      68: 00626174     	<unknown>

Disassembly of section .text:

00000000 <test>:
       0: 00038314     	rpt_start	t1, t2
       4: e0730000     	set_addr_cfg.0	t1, t2, t3
       8: e0730400     	set_addr_cfg.8	t1, t2, t3
       c: e0730f80     	set_addr_cfg.31	t1, t2, t3
      10: e0730004     	mul.m.vv.f32	t1, t2, t3, 0x0, 0x0, 0x0
      14: e0731804     	add.m.vv.f16	t1, t2, t3, 0x0, 0x0, 0x1
      18: e0732404     	add.m.vv.f32	t1, t2, t3, 0x0, 0x1, 0x0
      1c: e0733c04     	mul.m.vs.f32	t1, t2, t3, 0x0, 0x1, 0x1
      20: e0734e04     	div.m.vs.f32	t1, t2, t3, 0x1, 0x1, 0x1
      24: 00730208     	set_loadw.mm	t1, t2, 0x1
      28: 02731208     	loadw.mm	t1, t2, 0x1, 0x1
      2c: 02032208     	loadz.mm	t1, 0x1, 0x1
      30: 02033208     	loads.mm	t1, 0x1, 0x1
      34: 3a034a08     	gemv.mm	t1, t2, 0x1, 0x1, 0x1
      38: e2735e08     	gemv_acc.mm	t1, t2, t3, 0x1, 0x1, 0x1, 0x1
      3c: e2736e08     	gemv_acc_s.mm	t1, t2, t3, 0x1, 0x1, 0x1, 0x1
      40: e2737e08     	gemv_s.mm	t1, t2, t3, 0x1, 0x1, 0x1, 0x1
      44: 0073060c     	exp.m.v.f32	t1, t2, 0x1, 0x1
      48: 0073160c     	f16_to_f32.m.v	t1, t2, 0x1, 0x1
      4c: 0073260c     	f32_to_f16.m.v	t1, t2, 0x1, 0x1
      50: 0073360c     	rsum.m.v.f32	t1, t2, 0x1, 0x1
      54: 0073460c     	relu.m.v.f32	t1, t2, 0x1, 0x1
      58: 00238322     	ld.shared	t1, 0x2(t2)
      5c: 00639124     	st.shared	t1, 0x2(t2)
      60: 00031020     	vmask_set	t1
      64: e0730014     	dma_setup_dram	t1, t2, t3, 0x0
      68: e2731014     	dma_setup_sram	t1, t2, t3, 0x1
      6c: e4732014     	dma_load_start	t1, t2, t3, 0x2
      70: e6733014     	dma_store_start	t1, t2, t3, 0x3
      74: 04004010     	dma_wait	0x2

00000078 <end>:
      78: 06001318     	rpt_end	t1, 0x60
      7c: 0000001c     	halt
      80: 0000101c     	irq
      84: 00008067     	jalr	zero, 0x0(ra)

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
      10: 00000055     	<unknown>
		...
      1c: fff10004     	<unknown>
      20: 0000000f     	fence	0, 0
		...
      2c: 00020000     	set_addr_cfg.0	tp, zero, zero
      30: 00000001     	<unknown>
		...
      3c: 00020000     	set_addr_cfg.0	tp, zero, zero
      40: 0000004e     	<unknown>
      44: 00000078     	<unknown>
      48: 00000000     	set_addr_cfg.0	zero, zero, zero
      4c: 00020000     	set_addr_cfg.0	tp, zero, zero
      50: 00000052     	<unknown>
		...
      5c: 00030000     	set_addr_cfg.0	t1, zero, zero
      60: 00000052     	<unknown>
		...
      6c: 00050000     	set_addr_cfg.0	a0, zero, zero
      70: 0000000a     	<unknown>
      74: 00000000     	set_addr_cfg.0	zero, zero, zero
      78: 00000088     	<unknown>
      7c: 00020012     	<unknown>
