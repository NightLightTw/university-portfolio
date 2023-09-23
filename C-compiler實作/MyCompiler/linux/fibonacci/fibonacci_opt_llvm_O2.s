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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testl	%edi, %edi
	jle	.LBB0_1
# %bb.2:                                # %.lr.ph.preheader
	movl	%edi, %r12d
	leal	-1(%r12), %ebx
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB0_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	testl	%ebx, %ebx
	je	.LBB0_4
# %bb.5:                                # %tailrecurse
                                        #   in Loop: Header=BB0_3 Depth=1
	leal	-1(%r12), %edi
	callq	fib
	leal	-2(%r12), %ecx
	addq	%rax, %r14
	addl	$-2, %ebx
	cmpl	$2, %r12d
	movl	%ecx, %r12d
	ja	.LBB0_3
	jmp	.LBB0_6
.LBB0_1:
	xorl	%r14d, %r14d
	jmp	.LBB0_7
.LBB0_4:
	movl	$1, %r15d
.LBB0_6:                                # %._crit_edge.loopexit
	addq	%r15, %r14
.LBB0_7:                                # %._crit_edge
	movq	%r14, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
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
