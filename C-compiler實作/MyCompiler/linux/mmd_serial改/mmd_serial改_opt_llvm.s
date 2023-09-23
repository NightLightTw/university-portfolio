	.text
	.file	"mmd_serial\346\224\271.c"
	.globl	matrixMult                      # -- Begin function matrixMult
	.p2align	4, 0x90
	.type	matrixMult,@function
matrixMult:                             # @matrixMult
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%r8d, %r8d
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	addl	$1, %r8d
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_6 Depth 3
	cmpl	%edi, %r8d
	jge	.LBB0_9
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	xorl	%r9d, %r9d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	addl	$1, %r9d
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_6 Depth 3
	cmpl	%edi, %r9d
	jge	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	c(%rip), %rax
	movslq	%r8d, %r10
	movq	(%rax,%r10,8), %rax
	movslq	%r9d, %rsi
	movq	$0, (%rax,%rsi,8)
	xorl	%eax, %eax
	cmpl	%edi, %eax
	jge	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	a(%rip), %rcx
	movq	(%rcx,%r10,8), %rcx
	movsd	(%rcx,%rax,8), %xmm0            # xmm0 = mem[0],zero
	movq	b(%rip), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	c(%rip), %rdx
	movq	(%rdx,%r10,8), %rdx
	mulsd	(%rcx,%rsi,8), %xmm0
	addsd	(%rdx,%rsi,8), %xmm0
	movsd	%xmm0, (%rdx,%rsi,8)
	addq	$1, %rax
	cmpl	%edi, %eax
	jl	.LBB0_6
	jmp	.LBB0_7
.LBB0_9:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	matrixMult, .Lfunc_end0-matrixMult
	.cfi_endproc
                                        # -- End function
	.globl	print                           # -- Begin function print
	.p2align	4, 0x90
	.type	print,@function
print:                                  # @print
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
	movl	%edi, %r14d
	xorl	%r15d, %r15d
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addl	$1, %r15d
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
	cmpl	%r14d, %r15d
	jge	.LBB1_6
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	xorl	%ebx, %ebx
	cmpl	%r14d, %ebx
	jge	.LBB1_5
	.p2align	4, 0x90
.LBB1_4:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	c(%rip), %rax
	movslq	%r15d, %rcx
	movq	(%rax,%rcx,8), %rax
	movsd	(%rax,%rbx,8), %xmm0            # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf@PLT
	addq	$1, %rbx
	cmpl	%r14d, %ebx
	jl	.LBB1_4
	jmp	.LBB1_5
.LBB1_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	print, .Lfunc_end1-print
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
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	%rax, a(%rip)
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	%rax, b(%rip)
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	%rax, c(%rip)
	xorl	%ebx, %ebx
	cmpl	$2047, %ebx                     # imm = 0x7FF
	jg	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # =>This Inner Loop Header: Depth=1
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	a(%rip), %rcx
	movq	%rax, (%rcx,%rbx,8)
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	b(%rip), %rcx
	movq	%rax, (%rcx,%rbx,8)
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	c(%rip), %rcx
	movq	%rax, (%rcx,%rbx,8)
	addq	$1, %rbx
	cmpl	$2047, %ebx                     # imm = 0x7FF
	jle	.LBB2_2
.LBB2_3:
	xorl	%eax, %eax
	movabsq	$4611686018427387904, %rcx      # imm = 0x4000000000000000
	movabsq	$4617315517961601024, %rdx      # imm = 0x4014000000000000
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_8:                                #   in Loop: Header=BB2_4 Depth=1
	addl	$1, %eax
.LBB2_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_7 Depth 2
	cmpl	$2047, %eax                     # imm = 0x7FF
	jg	.LBB2_9
# %bb.5:                                #   in Loop: Header=BB2_4 Depth=1
	xorl	%esi, %esi
	cmpl	$2047, %esi                     # imm = 0x7FF
	jg	.LBB2_8
	.p2align	4, 0x90
.LBB2_7:                                #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	a(%rip), %rdi
	movslq	%eax, %rbx
	movq	(%rdi,%rbx,8), %rdi
	movq	%rcx, (%rdi,%rsi,8)
	movq	b(%rip), %rdi
	movq	(%rdi,%rbx,8), %rdi
	movq	%rdx, (%rdi,%rsi,8)
	movq	c(%rip), %rdi
	movq	(%rdi,%rbx,8), %rdi
	movq	$0, (%rdi,%rsi,8)
	addq	$1, %rsi
	cmpl	$2047, %esi                     # imm = 0x7FF
	jle	.LBB2_7
	jmp	.LBB2_8
.LBB2_9:
	movl	$2048, %edi                     # imm = 0x800
	callq	matrixMult
	movq	c(%rip), %rax
	movq	16376(%rax), %rax
	movsd	16376(%rax), %xmm0              # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf@PLT
	movq	a(%rip), %rdi
	callq	free@PLT
	movq	b(%rip), %rdi
	callq	free@PLT
	movq	c(%rip), %rdi
	callq	free@PLT
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	c,@object                       # @c
	.bss
	.globl	c
	.p2align	3
c:
	.quad	0
	.size	c, 8

	.type	a,@object                       # @a
	.globl	a
	.p2align	3
a:
	.quad	0
	.size	a, 8

	.type	b,@object                       # @b
	.globl	b
	.p2align	3
b:
	.quad	0
	.size	b, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%f "
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%f\n"
	.size	.L.str.1, 4

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
