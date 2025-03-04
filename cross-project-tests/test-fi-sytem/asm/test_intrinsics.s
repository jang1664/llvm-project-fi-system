	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_xfpint0p2"
	.file	"test_intrinsics.c"
	.text
	.globl	test_intrinsics                 # -- Begin function test_intrinsics
	.p2align	2
	.type	test_intrinsics,@function
test_intrinsics:                        # @test_intrinsics
# %bb.0:                                # %entry
	addi	a0, a0, 1
	set_dl_vvv_s	1, 2, 3
	ret
.Lfunc_end0:
	.size	test_intrinsics, .Lfunc_end0-test_intrinsics
                                        # -- End function
	.ident	"clang version 21.0.0git (git@github.com:jang1664/llvm-project-fi-system.git 19998498c3deb4b33e86d166a82296f2a3cad2b0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
