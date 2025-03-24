	.file	"test.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	2
	.type	test,@function
test:                                   # @test
# %bb.0:                                # %entry
start:
  rpt_start t1, t2

  set_addr_cfg.0 t1, t2, t3
  set_addr_cfg.8 t1, t2, t3
  set_addr_cfg.31 t1, t2, t3

  mul.m.vv.f32 t1, t2, t3, 0, 0, 0 
  add.m.vv.f16 t1, t2, t3, 0, 0, 1 
  add.m.vv.f32 t1, t2, t3, 0, 1, 0 
  mul.m.vs.f32 t1, t2, t3, 0, 1, 1 
  div.m.vs.f32 t1, t2, t3, 1, 1, 1 

  set_loadw.mm t1, t2, 1
  loadw.mm t1, t2, 1, 1
  loadz.mm t1, 1, 1
  loads.mm t1, 1, 1
  gemv.mm t1, t2, 1, 1, 1 
  gemv_acc.mm   t1, t2, t3, 1, 1, 1, 1
  gemv_acc_s.mm t1, t2, t3, 1, 1, 1, 1
  gemv_s.mm     t1, t2, t3, 1, 1, 1, 1

  exp.m.v.f32    t1, t2, 1, 1
  f16_to_f32.m.v t1, t2, 1, 1
  f32_to_f16.m.v t1, t2, 1, 1
  rsum.m.v.f32   t1, t2, 1, 1
  relu.m.v.f32   t1, t2, 1, 1

  ld.shared t1, 2(t2)
  st.shared t1, 2(t2)

  dma_setup_dram  t1, t2, t3, 0
  dma_setup_sram  t1, t2, t3, 1
  dma_load_start  t1, t2, t3, 2
  dma_store_start t1, t2, t3, 3
  dma_wait 2

end:
  rpt_end t1, 100

  halt
  irq
	ret

.Lfunc_end0:
	.size	test, .Lfunc_end0-test
                                        # -- End function
	.ident	"clang version 21.0.0git (git@github.com:jang1664/llvm-project-fi-system.git cda19e6bdb63f5fdb2f17d880369d0a054ed4f4e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
