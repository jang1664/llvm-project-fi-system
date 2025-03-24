	.attribute	4, 16
	.attribute	5, "rv32i2p1_xfpint0p2"
	.file	"test.ll"
	.text
	.globl	test                            # -- Begin function test
	.p2align	2
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:
	set_dl_vvv_s	1, 2, 3
	set_dl_vvv_v	1, 2, 3
	dl.vvv.f32.mult	1, 2, 3
	li	a0, 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
