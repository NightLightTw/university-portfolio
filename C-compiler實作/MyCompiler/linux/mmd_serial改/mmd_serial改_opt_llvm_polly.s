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
	movl	%edi, -16(%rbp)
	movl	$0, -8(%rbp)
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	addl	$1, -8(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_5 Depth 3
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_9
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -4(%rbp)
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=2
	addl	$1, -4(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	c(%rip), %rax
	movslq	-8(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-4(%rbp), %rcx
	movq	$0, (%rax,%rcx,8)
	movl	$0, -12(%rbp)
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=3
	movq	a(%rip), %rax
	movslq	-8(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-12(%rbp), %rdx
	movsd	(%rax,%rdx,8), %xmm0            # xmm0 = mem[0],zero
	movq	b(%rip), %rax
	movq	(%rax,%rdx,8), %rax
	movslq	-4(%rbp), %rdx
	movq	c(%rip), %rsi
	movq	(%rsi,%rcx,8), %rcx
	mulsd	(%rax,%rdx,8), %xmm0
	addsd	(%rcx,%rdx,8), %xmm0
	movsd	%xmm0, (%rcx,%rdx,8)
	addl	$1, -12(%rbp)
	jmp	.LBB0_5
.LBB0_9:
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
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
	subq	$16, %rsp
	movl	%edi, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addl	$1, -8(%rbp)
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_6
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_5
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	movq	c(%rip), %rax
	movslq	-8(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-4(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf@PLT
	addl	$1, -4(%rbp)
	jmp	.LBB1_3
.LBB1_6:
	addq	$16, %rsp
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
	subq	$16, %rsp
	movl	$0, -16(%rbp)
	movl	$2048, -8(%rbp)                 # imm = 0x800
	movl	$16384, %edi                    # imm = 0x4000
	callq	malloc@PLT
	movq	%rax, a(%rip)
	movslq	-8(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, b(%rip)
	movslq	-8(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, c(%rip)
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB2_3
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movslq	-8(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	a(%rip), %rcx
	movslq	-4(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movslq	-8(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	b(%rip), %rcx
	movslq	-4(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movslq	-8(%rbp), %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	c(%rip), %rcx
	movslq	-4(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	addl	$1, -4(%rbp)
	jmp	.LBB2_1
.LBB2_3:
	movl	$0, -4(%rbp)
	movabsq	$4611686018427387904, %rax      # imm = 0x4000000000000000
	movabsq	$4617315517961601024, %rcx      # imm = 0x4014000000000000
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_8:                                #   in Loop: Header=BB2_4 Depth=1
	addl	$1, -4(%rbp)
.LBB2_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
	movl	-4(%rbp), %edx
	cmpl	-8(%rbp), %edx
	jge	.LBB2_9
# %bb.5:                                #   in Loop: Header=BB2_4 Depth=1
	movl	$0, -12(%rbp)
	.p2align	4, 0x90
.LBB2_6:                                #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-12(%rbp), %edx
	cmpl	-8(%rbp), %edx
	jge	.LBB2_8
# %bb.7:                                #   in Loop: Header=BB2_6 Depth=2
	movq	a(%rip), %rdx
	movslq	-4(%rbp), %rsi
	movq	(%rdx,%rsi,8), %rdx
	movslq	-12(%rbp), %rsi
	movq	%rax, (%rdx,%rsi,8)
	movq	b(%rip), %rdx
	movslq	-4(%rbp), %rsi
	movq	(%rdx,%rsi,8), %rdx
	movslq	-12(%rbp), %rsi
	movq	%rcx, (%rdx,%rsi,8)
	movq	c(%rip), %rdx
	movslq	-4(%rbp), %rsi
	movq	(%rdx,%rsi,8), %rdx
	movslq	-12(%rbp), %rsi
	movq	$0, (%rdx,%rsi,8)
	addl	$1, -12(%rbp)
	jmp	.LBB2_6
.LBB2_9:
	movl	-8(%rbp), %edi
	callq	matrixMult
	movq	c(%rip), %rax
	movslq	-8(%rbp), %rcx
	movq	-8(%rax,%rcx,8), %rax
	movsd	-8(%rax,%rcx,8), %xmm0          # xmm0 = mem[0],zero
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
