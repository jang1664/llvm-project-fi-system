	.file	"test.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	2
	.type	test,@function
test:                                   # @test
# %bb.0:                                # %entry
  set_dl_vvv_s 1, 2, 3
  set_dl_vvv_v 1, 2, 3
  dl.vvv.f32.mult 1, 1, 1
  dl.vvv.f32.mac 1, 1, 1
  dl.vvv.f16.add 1, 1, 1
  dl.vvv.f32.add 1, 1, 1
  set_dl_vvs_s 1, 2, 3
  set_dl_vvs_v 1, 2, 3
  dl.vvs.f32.mult 1, 1, 1
  dl.vvs.f32.add 1, 1, 1
  dl.vvs.f32.div 1, 1, 1
  set_sl_vv_s 1, 2
  set_sl_vv_v 1, 2
  sl.vv.f32.exp 1, 1
  sl.vv.f16_to_f32 1, 1
  sl.vv.f32_to_f16 1, 1
  sl.vv.reduce_sum 1, 1
  sl.vv.swish_glu 1, 1
  sl.vv.relu 1, 1
  sl.vv.gelu 1, 1
  load_mxu 1, t1
  dl.vvm.gemv f32v0, 1, t1, t2
  set_addr_cfg.mod0.dim0 t1, t2
  set_addr_cfg.mod0.dim1 t1, t2
  set_addr_cfg.mod0.dim2 t1, t2
  set_addr_cfg.mod1.dim0 t1, t2
  set_addr_cfg.mod1.dim1 t1, t2
  set_addr_cfg.mod1.dim2 t1, t2
  set_addr_cfg.mod2.dim0 t1, t2
  set_addr_cfg.mod2.dim1 t1, t2
  set_addr_cfg.mod2.dim2 t1, t2
  sw_glu f32v0, f32v2
  relu f32v0, f32v2
  gelu f32v0, f32v2
  rpt t1, 10
  dma.setup.dram 1, t1, t2, t3, t4
  dma.setup.sram 1, t1, t2, t3, t4
  dma.load.start 1
  dma.store.start 1
  dma.wait 1
  halt
  irq


	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
                                        # -- End function
	.ident	"clang version 21.0.0git (git@github.com:jang1664/llvm-project-fi-system.git cda19e6bdb63f5fdb2f17d880369d0a054ed4f4e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
