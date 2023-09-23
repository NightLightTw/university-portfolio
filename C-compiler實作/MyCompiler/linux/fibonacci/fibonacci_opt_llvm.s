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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	testl	%edi, %edi
	jg	.LBB0_2
# %bb.1:
	xorl	%eax, %eax
	jmp	.LBB0_4
.LBB0_2:
	movl	%edi, %ebx
	movl	$1, %eax
	cmpl	$1, %edi
	je	.LBB0_4
# %bb.3:
	leal	-1(%rbx), %edi
	callq	fib
	movq	%rax, %r14
	addl	$-2, %ebx
	movl	%ebx, %edi
	callq	fib
	addq	%r14, %rax
.LBB0_4:
	popq	%rbx
	popq	%r14
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
	movl	$50, %edi
	callq	fib
	movl	$.L.str, %edi
	movl	$50, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
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
