	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_swap                           ; -- Begin function swap
	.p2align	2
_swap:                                  ; @swap
	.cfi_startproc
; %bb.0:
	ldr	w8, [x0]
	ldr	w9, [x1]
	str	w9, [x0]
	str	w8, [x1]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_partition                      ; -- Begin function partition
	.p2align	2
_partition:                             ; @partition
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
                                        ; kill: def $w2 killed $w2 def $x2
	mov	x20, x0
	add	x19, x0, w2, sxtw #2
	sub	w22, w1, #1
	cmp	w1, w2
	b.ge	LBB1_5
; %bb.1:                                ; %.lr.ph.preheader
	sxtw	x8, w2
	ldr	w23, [x19]
	sub	x24, x8, w1, sxtw
	add	x21, x20, w1, sxtw #2
	b	LBB1_3
LBB1_2:                                 ;   in Loop: Header=BB1_3 Depth=1
	add	x21, x21, #4
	subs	x24, x24, #1
	b.eq	LBB1_5
LBB1_3:                                 ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x21]
	cmp	w8, w23
	b.ge	LBB1_2
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	add	w22, w22, #1
	add	x0, x20, w22, sxtw #2
	mov	x1, x21
	bl	_swap
	b	LBB1_2
LBB1_5:                                 ; %._crit_edge
	add	w21, w22, #1
	add	x0, x20, w21, sxtw #2
	mov	x1, x19
	bl	_swap
	mov	x0, x21
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_quickSort                      ; -- Begin function quickSort
	.p2align	2
_quickSort:                             ; @quickSort
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	cmp	w1, w2
	b.ge	LBB2_3
; %bb.1:                                ; %tailrecurse.preheader
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
LBB2_2:                                 ; %tailrecurse
                                        ; =>This Inner Loop Header: Depth=1
	mov	x0, x20
	mov	x1, x21
	mov	x2, x19
	bl	_partition
	mov	x22, x0
	sub	w2, w0, #1
	mov	x0, x20
	mov	x1, x21
	bl	_quickSort
	add	w21, w22, #1
	cmp	w21, w19
	b.lt	LBB2_2
LBB2_3:                                 ; %tailrecurse._crit_edge
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_printArray                     ; -- Begin function printArray
	.p2align	2
_printArray:                            ; @printArray
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	cmp	w1, #1
	b.lt	LBB3_3
; %bb.1:                                ; %.lr.ph.preheader
	mov	x19, x0
	mov	w21, w1
Lloh0:
	adrp	x20, l_.str@PAGE
Lloh1:
	add	x20, x20, l_.str@PAGEOFF
LBB3_2:                                 ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x19], #4
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	subs	x21, x21, #1
	b.ne	LBB3_2
LBB3_3:                                 ; %._crit_edge
	mov	w0, #10
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	b	_putchar
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function main
lCPI4_0:
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %vector.ph
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	sub	sp, sp, #9, lsl #12             ; =36864
	sub	sp, sp, #3152
Lloh2:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh3:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh4:
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
Lloh5:
	adrp	x8, lCPI4_0@PAGE
Lloh6:
	ldr	q0, [x8, lCPI4_0@PAGEOFF]
	mov	x8, #-40000
	add	x9, sp, #8
	mov	w10, #10000
	dup.4s	v1, w10
	mov	w10, #9996
	dup.4s	v2, w10
	mov	w10, #9992
	dup.4s	v3, w10
	mov	w10, #9988
	dup.4s	v4, w10
	movi.4s	v5, #16
LBB4_1:                                 ; %vector.body
                                        ; =>This Inner Loop Header: Depth=1
	add	x10, x9, x8
	sub.4s	v6, v1, v0
	sub.4s	v7, v2, v0
	sub.4s	v16, v3, v0
	sub.4s	v17, v4, v0
	str	q6, [x10, #40000]
	str	q7, [x10, #40016]
	str	q16, [x10, #40032]
	str	q17, [x10, #40048]
	add.4s	v0, v0, v5
	adds	x8, x8, #64
	b.ne	LBB4_1
; %bb.2:                                ; %middle.block
	add	x0, sp, #8
	mov	w1, #0
	mov	w2, #9999
	bl	_quickSort
Lloh7:
	adrp	x0, l_str@PAGE
Lloh8:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	add	x0, sp, #8
	mov	w1, #10000
	bl	_printArray
	ldur	x8, [x29, #-24]
Lloh9:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh10:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh11:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB4_4
; %bb.3:                                ; %middle.block
	mov	w0, #0
	add	sp, sp, #9, lsl #12             ; =36864
	add	sp, sp, #3152
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB4_4:                                 ; %middle.block
	bl	___stack_chk_fail
	.loh AdrpLdr	Lloh5, Lloh6
	.loh AdrpLdrGotLdr	Lloh2, Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh9, Lloh10, Lloh11
	.loh AdrpAdd	Lloh7, Lloh8
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%d "

l_str:                                  ; @str
	.asciz	"Sorted array: "

.subsections_via_symbols
