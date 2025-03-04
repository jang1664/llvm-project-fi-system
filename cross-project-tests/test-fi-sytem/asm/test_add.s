	.attribute	4, 16
	.attribute	5, "rv32i2p1_xfpint0p2"
	.file	"test_add.ll"
	.text
	.globl	test                            # -- Begin function test
	.p2align	2
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:
	addi	a0, a0, 1
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
