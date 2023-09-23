	.text
	.file	"quickSort.c"
	.globl	swap                            # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -16(%rbp)
	movl	(%rdi), %eax
	movl	%eax, -4(%rbp)
	movl	(%rsi), %eax
	movl	%eax, (%rdi)
	movl	-4(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, (%rcx)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	swap, .Lfunc_end0-swap
	.cfi_endproc
                                        # -- End function
	.globl	partition                       # -- Begin function partition
	.p2align	4, 0x90
	.type	partition,@function
partition:                              # @partition
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
                                        # kill: def $esi killed $esi def $rsi
	movq	%rdi, -24(%rbp)
	movl	%esi, -32(%rbp)
	movl	%edx, -12(%rbp)
	movslq	%edx, %rax
	movl	(%rdi,%rax,4), %eax
	movl	%eax, -28(%rbp)
	leal	-1(%rsi), %eax
	movl	%eax, -8(%rbp)
	movl	%esi, -4(%rbp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	cmpl	%eax, -4(%rbp)
	jg	.LBB1_5
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movslq	-8(%rbp), %rax
	leal	1(%rax), %ecx
	movl	%ecx, -8(%rbp)
	movq	-24(%rbp), %rcx
	leaq	(%rcx,%rax,4), %rdi
	addq	$4, %rdi
	movslq	-4(%rbp), %rax
	leaq	(%rcx,%rax,4), %rsi
	callq	swap
	jmp	.LBB1_4
.LBB1_5:
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	leaq	(%rax,%rcx,4), %rdi
	addq	$4, %rdi
	movslq	-12(%rbp), %rcx
	leaq	(%rax,%rcx,4), %rsi
	callq	swap
	movl	-8(%rbp), %eax
	addl	$1, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	partition, .Lfunc_end1-partition
	.cfi_endproc
                                        # -- End function
	.globl	quickSort                       # -- Begin function quickSort
	.p2align	4, 0x90
	.type	quickSort,@function
quickSort:                              # @quickSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -4(%rbp)
	cmpl	%edx, %esi
	jge	.LBB2_2
# %bb.1:
	movq	-16(%rbp), %rdi
	movl	-8(%rbp), %esi
	movl	-4(%rbp), %edx
	callq	partition
                                        # kill: def $eax killed $eax def $rax
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rdi
	movl	-8(%rbp), %esi
	leal	-1(%rax), %edx
	callq	quickSort
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %esi
	addl	$1, %esi
	movl	-4(%rbp), %edx
	callq	quickSort
.LBB2_2:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	quickSort, .Lfunc_end2-quickSort
	.cfi_endproc
                                        # -- End function
	.globl	printArray                      # -- Begin function printArray
	.p2align	4, 0x90
	.type	printArray,@function
printArray:                             # @printArray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB3_3
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.LBB3_1
.LBB3_3:
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	printArray, .Lfunc_end3-printArray
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
	pushq	%rbx
	subq	$40024, %rsp                    # imm = 0x9C58
	.cfi_offset %rbx, -24
	movl	$0, -20(%rbp)
	movl	$0, -12(%rbp)
	cmpl	$9999, -12(%rbp)                # imm = 0x270F
	jg	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # =>This Inner Loop Header: Depth=1
	movslq	-12(%rbp), %rax
	movl	$10000, %ecx                    # imm = 0x2710
	subl	%eax, %ecx
	movl	%ecx, -40032(%rbp,%rax,4)
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	cmpl	$9999, -12(%rbp)                # imm = 0x270F
	jle	.LBB4_2
.LBB4_3:
	movl	$10000, -16(%rbp)               # imm = 0x2710
	leaq	-40032(%rbp), %rbx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$9999, %edx                     # imm = 0x270F
	callq	quickSort
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	-16(%rbp), %esi
	movq	%rbx, %rdi
	callq	printArray
	xorl	%eax, %eax
	addq	$40024, %rsp                    # imm = 0x9C58
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\n"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Sorted array: \n"
	.size	.L.str.2, 16

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
