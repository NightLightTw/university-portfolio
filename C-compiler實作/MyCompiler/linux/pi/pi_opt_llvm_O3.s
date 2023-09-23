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
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x4010000000000000              # double 4
.LCPI1_2:
	.quad	0x41d502f900000000              # double 1410065408
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	callq	time@PLT
	movl	%eax, %edi
	callq	srand@PLT
	xorl	%ebx, %ebx
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	movl	%r15d, %ebx
	cmpl	$1410065408, %r15d              # imm = 0x540BE400
	je	.LBB1_5
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	callq	randomFloat
	movsd	%xmm0, -32(%rbp)                # 8-byte Spill
	callq	randomFloat
	mulsd	%xmm0, %xmm0
	movsd	-32(%rbp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	sbbl	$-1, %r14d
	leal	1(%rbx), %r15d
	testl	%ebx, %ebx
	je	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	%ebx, %eax
	shrl	$5, %eax
	imulq	$175921861, %rax, %rax          # imm = 0xA7C5AC5
	shrq	$39, %rax
	imull	$100000, %eax, %eax             # imm = 0x186A0
	cmpl	%ebx, %eax
	jne	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI1_1(%rip), %xmm0
	xorps	%xmm1, %xmm1
	cvtsi2sd	%r15d, %xmm1
	divsd	%xmm1, %xmm0
	movl	$.L.str, %edi
	movl	%ebx, %esi
	movb	$1, %al
	callq	printf@PLT
	jmp	.LBB1_4
.LBB1_5:
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r14d, %xmm0
	mulsd	.LCPI1_1(%rip), %xmm0
	divsd	.LCPI1_2(%rip), %xmm0
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
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
