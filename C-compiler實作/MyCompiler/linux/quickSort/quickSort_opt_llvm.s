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
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r12d
	movslq	%edx, %rcx
	movl	(%rdi,%rcx,4), %r13d
	leal	-1(%r12), %r15d
	movslq	%esi, %rax
	movq	%rdi, -48(%rbp)                 # 8-byte Spill
	leaq	(%rdi,%rax,4), %rbx
	movq	%rcx, -56(%rbp)                 # 8-byte Spill
	leal	-1(%rcx), %r14d
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, %r12d
	addq	$4, %rbx
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	%r14d, %r12d
	jg	.LBB1_5
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	cmpl	%r13d, (%rbx)
	jge	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movslq	%r15d, %rax
	addl	$1, %r15d
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rdi
	addq	$4, %rdi
	movq	%rbx, %rsi
	callq	swap
	jmp	.LBB1_4
.LBB1_5:
	movslq	%r15d, %rax
	addl	$1, %r15d
	movq	-48(%rbp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rdi
	addq	$4, %rdi
	movq	-56(%rbp), %rax                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rsi
	callq	swap
	movl	%r15d, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	cmpl	%edx, %esi
	jge	.LBB2_2
# %bb.1:
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
	movl	%edx, %r15d
	movl	%esi, %ebx
	movq	%rdi, %r14
	callq	partition
	movl	%eax, %r12d
	leal	-1(%r12), %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	quickSort
	addl	$1, %r12d
	movq	%r14, %rdi
	movl	%r12d, %esi
	movl	%r15d, %edx
	callq	quickSort
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	.cfi_restore %rbx
	.cfi_restore %r12
	.cfi_restore %r14
	.cfi_restore %r15
	.cfi_restore %rbp
.LBB2_2:
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r15d
	movq	%rdi, %r14
	xorl	%ebx, %ebx
	cmpl	%r15d, %ebx
	jge	.LBB3_3
	.p2align	4, 0x90
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	movl	(%r14,%rbx,4), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$1, %rbx
	cmpl	%r15d, %ebx
	jl	.LBB3_2
.LBB3_3:
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
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
	subq	$40008, %rsp                    # imm = 0x9C48
	.cfi_offset %rbx, -24
	movl	$10000, %eax                    # imm = 0x2710
	xorl	%ecx, %ecx
	cmpl	$9999, %ecx                     # imm = 0x270F
	jg	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, -40016(%rbp,%rcx,4)
	addq	$1, %rcx
	addl	$-1, %eax
	cmpl	$9999, %ecx                     # imm = 0x270F
	jle	.LBB4_2
.LBB4_3:
	leaq	-40016(%rbp), %rbx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$9999, %edx                     # imm = 0x270F
	callq	quickSort
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	%rbx, %rdi
	movl	$10000, %esi                    # imm = 0x2710
	callq	printArray
	xorl	%eax, %eax
	addq	$40008, %rsp                    # imm = 0x9C48
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
