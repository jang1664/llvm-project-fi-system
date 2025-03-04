	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl32b1p0_zvl64b1p0"
	.file	"test2.c"
	.text
	.globl	test_wrapper                    # -- Begin function test_wrapper
	.p2align	2
	.type	test_wrapper,@function
test_wrapper:                           # @test_wrapper
# %bb.0:                                # %entry
	tail	test
.Lfunc_end0:
	.size	test_wrapper, .Lfunc_end0-test_wrapper
                                        # -- End function
	.ident	"clang version 21.0.0git (git@github.com:jang1664/llvm-project-fi-system.git cda19e6bdb63f5fdb2f17d880369d0a054ed4f4e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
