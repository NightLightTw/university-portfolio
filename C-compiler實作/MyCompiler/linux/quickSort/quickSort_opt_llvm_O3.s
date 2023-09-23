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
	cmpl	%edx, %esi
	jge	.LBB2_3
# %bb.1:                                # %tailrecurse.preheader
	movl	%edx, %r14d
	movl	%esi, %r12d
	movq	%rdi, %r15
	.p2align	4, 0x90
.LBB2_2:                                # %tailrecurse
                                        # =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movl	%r12d, %esi
	movl	%r14d, %edx
	callq	partition
	movl	%eax, %ebx
	leal	-1(%rbx), %edx
	movq	%r15, %rdi
	movl	%r12d, %esi
	callq	quickSort
	addl	$1, %ebx
	movl	%ebx, %r12d
	cmpl	%r14d, %ebx
	jl	.LBB2_2
.LBB2_3:                                # %tailrecurse._crit_edge
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
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
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end3:
	.size	printArray, .Lfunc_end3-printArray
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI4_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
.LCPI4_1:
	.long	10000                           # 0x2710
	.long	10000                           # 0x2710
	.long	10000                           # 0x2710
	.long	10000                           # 0x2710
.LCPI4_2:
	.long	9996                            # 0x270c
	.long	9996                            # 0x270c
	.long	9996                            # 0x270c
	.long	9996                            # 0x270c
.LCPI4_3:
	.long	9992                            # 0x2708
	.long	9992                            # 0x2708
	.long	9992                            # 0x2708
	.long	9992                            # 0x2708
.LCPI4_4:
	.long	9988                            # 0x2704
	.long	9988                            # 0x2704
	.long	9988                            # 0x2704
	.long	9988                            # 0x2704
.LCPI4_5:
	.long	16                              # 0x10
	.long	16                              # 0x10
	.long	16                              # 0x10
	.long	16                              # 0x10
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %vector.ph
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$40008, %rsp                    # imm = 0x9C48
	.cfi_offset %rbx, -24
	movdqa	.LCPI4_0(%rip), %xmm0           # xmm0 = [0,1,2,3]
	movl	$12, %eax
	movdqa	.LCPI4_1(%rip), %xmm1           # xmm1 = [10000,10000,10000,10000]
	movdqa	.LCPI4_2(%rip), %xmm2           # xmm2 = [9996,9996,9996,9996]
	movdqa	.LCPI4_3(%rip), %xmm3           # xmm3 = [9992,9992,9992,9992]
	movdqa	.LCPI4_4(%rip), %xmm4           # xmm4 = [9988,9988,9988,9988]
	movdqa	.LCPI4_5(%rip), %xmm5           # xmm5 = [16,16,16,16]
	.p2align	4, 0x90
.LBB4_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm1, %xmm6
	psubd	%xmm0, %xmm6
	movdqa	%xmm2, %xmm7
	psubd	%xmm0, %xmm7
	movdqa	%xmm6, -40064(%rbp,%rax,4)
	movdqa	%xmm7, -40048(%rbp,%rax,4)
	movdqa	%xmm3, %xmm6
	psubd	%xmm0, %xmm6
	movdqa	%xmm4, %xmm7
	psubd	%xmm0, %xmm7
	movdqa	%xmm6, -40032(%rbp,%rax,4)
	movdqa	%xmm7, -40016(%rbp,%rax,4)
	paddd	%xmm5, %xmm0
	addq	$16, %rax
	cmpq	$10012, %rax                    # imm = 0x271C
	jne	.LBB4_1
# %bb.2:                                # %middle.block
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
