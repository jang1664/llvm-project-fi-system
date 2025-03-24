	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_xfpint0p2"
	.file	"test_intrinsics.c"
	.text
	.globl	test_intrinsics                 # -- Begin function test_intrinsics
	.p2align	2
	.type	test_intrinsics,@function
test_intrinsics:                        # @test_intrinsics
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sw	a0, 12(sp)
	sw	a1, 8(sp)
	sw	a2, 4(sp)
	set_dl_vvv_s	1, 2, 3
	set_dl_vvv_v	1, 2, 3
	addi	a1, sp, 4
	addi	a2, sp, 8
	addi	a3, sp, 12
	dl.vvv.f32.mult	1, 0, 1
	addi	a0, a0, 1
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	test_intrinsics, .Lfunc_end0-test_intrinsics
                                        # -- End function
	.ident	"clang version 21.0.0git (git@github.com:jang1664/llvm-project-fi-system.git a6eb01c804c29d7c163acc9b9d4d4f930464cfd6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
