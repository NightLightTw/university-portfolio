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
	testl	%edi, %edi
	jle	.LBB0_7
# %bb.1:                                # %.preheader.lr.ph
	movl	%edi, %r8d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_2:                                # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_4 Depth 3
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_3:                                # %.lr.ph.preheader
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_4 Depth 3
	movq	c(%rip), %rsi
	movq	(%rsi,%rcx,8), %rsi
	movq	$0, (%rsi,%rdx,8)
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_4:                                # %.lr.ph
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	a(%rip), %rdi
	movq	(%rdi,%rcx,8), %rdi
	movsd	(%rdi,%rsi,8), %xmm0            # xmm0 = mem[0],zero
	movq	b(%rip), %rdi
	movq	(%rdi,%rsi,8), %rdi
	movq	c(%rip), %rax
	movq	(%rax,%rcx,8), %rax
	mulsd	(%rdi,%rdx,8), %xmm0
	addsd	(%rax,%rdx,8), %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	addq	$1, %rsi
	cmpq	%rsi, %r8
	jne	.LBB0_4
# %bb.5:                                # %._crit_edge
                                        #   in Loop: Header=BB0_3 Depth=2
	addq	$1, %rdx
	cmpq	%r8, %rdx
	jne	.LBB0_3
# %bb.6:                                # %._crit_edge23
                                        #   in Loop: Header=BB0_2 Depth=1
	addq	$1, %rcx
	cmpq	%r8, %rcx
	jne	.LBB0_2
.LBB0_7:                                # %._crit_edge26
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
	testl	%edi, %edi
	jle	.LBB1_5
# %bb.1:                                # %.preheader.lr.ph
	movl	%edi, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB1_2:                                # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_3:                                #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	c(%rip), %rax
	movq	(%rax,%r15,8), %rax
	movsd	(%rax,%rbx,8), %xmm0            # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf@PLT
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.LBB1_3
# %bb.4:                                # %._crit_edge
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	$10, %edi
	callq	putchar@PLT
	addq	$1, %r15
	cmpq	%r14, %r15
	jne	.LBB1_2
.LBB1_5:                                # %._crit_edge13
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
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
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
	cmpq	$2048, %rbx                     # imm = 0x800
	jne	.LBB2_1
# %bb.2:                                # %.preheader.preheader
	xorl	%eax, %eax
	movabsq	$4611686018427387904, %rcx      # imm = 0x4000000000000000
	movabsq	$4617315517961601024, %rdx      # imm = 0x4014000000000000
	.p2align	4, 0x90
.LBB2_3:                                # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB2_4:                                #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	a(%rip), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	%rcx, (%rdi,%rsi)
	movq	b(%rip), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	%rdx, (%rdi,%rsi)
	movq	c(%rip), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	$0, (%rdi,%rsi)
	movq	a(%rip), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	%rcx, 8(%rdi,%rsi)
	movq	b(%rip), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	%rdx, 8(%rdi,%rsi)
	movq	c(%rip), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	$0, 8(%rdi,%rsi)
	addq	$16, %rsi
	cmpq	$16384, %rsi                    # imm = 0x4000
	jne	.LBB2_4
# %bb.5:                                #   in Loop: Header=BB2_3 Depth=1
	addq	$1, %rax
	cmpq	$2048, %rax                     # imm = 0x800
	jne	.LBB2_3
# %bb.6:
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
