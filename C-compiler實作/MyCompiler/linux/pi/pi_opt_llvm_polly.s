	.text
	.file	"pi.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function randomFloat
.LCPI0_0:
	.quad	0x41dfffffffc00000              # double 2147483647
	.text
	.globl	randomFloat
	.p2align	4, 0x90
	.type	randomFloat,@function
randomFloat:                            # @randomFloat
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	rand@PLT
	cvtsi2sd	%eax, %xmm0
	divsd	.LCPI0_0(%rip), %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	randomFloat, .Lfunc_end0-randomFloat
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI1_0:
	.quad	0x4010000000000000              # double 4
.LCPI1_1:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -28(%rbp)
	xorl	%edi, %edi
	callq	time@PLT
	movl	%eax, %edi
	callq	srand@PLT
	movl	$100000, -16(%rbp)              # imm = 0x186A0
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, -8(%rbp)
	movl	-4(%rbp), %eax
	cltd
	idivl	-16(%rbp)
	testl	%edx, %edx
	je	.LBB1_5
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	imull	%eax, %eax
	cmpl	%eax, -4(%rbp)
	jge	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	callq	randomFloat
	movsd	%xmm0, -24(%rbp)
	callq	randomFloat
	movsd	%xmm0, -48(%rbp)
	movsd	-24(%rbp), %xmm1                # xmm1 = mem[0],zero
	mulsd	%xmm0, %xmm0
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LCPI1_1(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	jb	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, -12(%rbp)
	jmp	.LBB1_4
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	cmpl	$0, -4(%rbp)
	je	.LBB1_7
# %bb.6:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %esi
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-12(%rbp), %xmm0
	mulsd	.LCPI1_0(%rip), %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sdl	-8(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf@PLT
	jmp	.LBB1_7
.LBB1_8:
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-12(%rbp), %xmm0
	mulsd	.LCPI1_0(%rip), %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sdl	-8(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Estimate after %d iterations: %f\n"
	.size	.L.str, 34

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Final estimate of Pi = %f\n"
	.size	.L.str.1, 27

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
