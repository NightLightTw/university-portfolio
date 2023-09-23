	.text
	.file	"fibonacci.c"
	.globl	fib                             # -- Begin function fib
	.p2align	4, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
	movl	%edi, -12(%rbp)
	testl	%edi, %edi
	jg	.LBB0_2
# %bb.1:
	movq	$0, -24(%rbp)
	jmp	.LBB0_5
.LBB0_2:
	cmpl	$1, -12(%rbp)
	jne	.LBB0_4
# %bb.3:
	movq	$1, -24(%rbp)
	jmp	.LBB0_5
.LBB0_4:
	movl	-12(%rbp), %edi
	addl	$-1, %edi
	callq	fib
	movq	%rax, %rbx
	movl	-12(%rbp), %edi
	addl	$-2, %edi
	callq	fib
	addq	%rbx, %rax
	movq	%rax, -24(%rbp)
.LBB0_5:
	movq	-24(%rbp), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	fib, .Lfunc_end0-fib
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
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
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movl	$50, -4(%rbp)
	movl	$50, %edi
	callq	fib
	movl	$.L.str, %edi
	movl	$50, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
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
	.asciz	"Fibonacci number #%d: %lld\n"
	.size	.L.str, 28

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
