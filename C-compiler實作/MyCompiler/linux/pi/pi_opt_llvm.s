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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	callq	time@PLT
	movl	%eax, %edi
	callq	srand@PLT
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)                # 8-byte Spill
	xorl	%ebx, %ebx
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movl	%r12d, %ebx
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$-727379969, %ebx               # imm = 0xD4A50FFF
	jg	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	%ebx, %eax
	imulq	$1125899907, %rax, %rax         # imm = 0x431BDE83
	shrq	$50, %rax
	imull	$1000000, %eax, %r15d           # imm = 0xF4240
	callq	randomFloat
	movsd	%xmm0, -48(%rbp)                # 8-byte Spill
	callq	randomFloat
	mulsd	%xmm0, %xmm0
	movsd	-48(%rbp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LCPI1_1(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	jb	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, %r14d
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	movsd	-40(%rbp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	.LCPI1_1(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)                # 8-byte Spill
	leal	1(%rbx), %r12d
	cmpl	%ebx, %r15d
	jne	.LBB1_7
# %bb.5:                                #   in Loop: Header=BB1_1 Depth=1
	testl	%ebx, %ebx
	je	.LBB1_7
# %bb.6:                                #   in Loop: Header=BB1_1 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI1_0(%rip), %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r12d, %xmm1
	divsd	%xmm1, %xmm0
	movl	$.L.str, %edi
	movl	%ebx, %esi
	movb	$1, %al
	callq	printf@PLT
	jmp	.LBB1_7
.LBB1_8:
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI1_0(%rip), %xmm0
	divsd	-40(%rbp), %xmm0                # 8-byte Folded Reload
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
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
