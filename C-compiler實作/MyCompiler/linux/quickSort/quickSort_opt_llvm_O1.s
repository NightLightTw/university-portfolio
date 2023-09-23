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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
                                        # kill: def $esi killed $esi def $rsi
	movq	%rdi, %r15
	movslq	%edx, %r13
	leaq	(%rdi,%r13,4), %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	leal	-1(%rsi), %r12d
	cmpl	%r13d, %esi
	jge	.LBB1_5
# %bb.1:                                # %.lr.ph.preheader
	movl	(%r15,%r13,4), %r14d
	movslq	%esi, %rax
	subq	%rax, %r13
	leaq	(%r15,%rax,4), %rbx
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_4:                                #   in Loop: Header=BB1_2 Depth=1
	addq	$4, %rbx
	addq	$-1, %r13
	je	.LBB1_5
.LBB1_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%r14d, (%rbx)
	jge	.LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	movslq	%r12d, %rax
	addl	$1, %r12d
	leaq	(%r15,%rax,4), %rdi
	addq	$4, %rdi
	movq	%rbx, %rsi
	callq	swap
	jmp	.LBB1_4
.LBB1_5:                                # %._crit_edge
	movslq	%r12d, %rax
	addl	$1, %r12d
	leaq	(%r15,%rax,4), %rdi
	addq	$4, %rdi
	movq	-48(%rbp), %rsi                 # 8-byte Reload
	callq	swap
	movl	%r12d, %eax
	addq	$8, %rsp
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
	testl	%esi, %esi
	jle	.LBB3_3
# %bb.1:                                # %.lr.ph.preheader
	movq	%rdi, %r14
	movl	%esi, %r15d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r14,%rbx,4), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$1, %rbx
	cmpq	%rbx, %r15
	jne	.LBB3_2
.LBB3_3:                                # %._crit_edge
	movl	$10, %edi
	callq	putchar@PLT
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
	leaq	-40000(%rbp), %rax
	movl	$10000, %ecx                    # imm = 0x2710
	.p2align	4, 0x90
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	%ecx, -16(%rax)
	leal	-1(%rcx), %edx
	movl	%edx, -12(%rax)
	leal	-2(%rcx), %edx
	movl	%edx, -8(%rax)
	leal	-3(%rcx), %edx
	movl	%edx, -4(%rax)
	leal	-4(%rcx), %edx
	movl	%edx, (%rax)
	addq	$20, %rax
	addq	$-5, %rcx
	jne	.LBB4_1
# %bb.2:
	leaq	-40016(%rbp), %rbx
	movq	%rbx, %rdi
	xorl	%esi, %esi
	movl	$9999, %edx                     # imm = 0x270F
	callq	quickSort
	movl	$.Lstr, %edi
	callq	puts@PLT
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

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"Sorted array: "
	.size	.Lstr, 15

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
