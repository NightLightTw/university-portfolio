	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_matrixMult                     ; -- Begin function matrixMult
	.p2align	2
_matrixMult:                            ; @matrixMult
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w0 killed $w0 def $x0
	cmp	w0, #1
	b.lt	LBB0_7
; %bb.1:                                ; %.preheader.lr.ph
	mov	x8, #0
	ubfiz	x9, x0, #3, #32
	adrp	x10, _c@PAGE
	adrp	x11, _a@PAGE
	adrp	x12, _b@PAGE
	mov	w13, w0
LBB0_2:                                 ; %.lr.ph22
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
                                        ;       Child Loop BB0_4 Depth 3
	mov	x14, #0
LBB0_3:                                 ; %.lr.ph.preheader
                                        ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_4 Depth 3
	mov	x15, #0
	ldr	x16, [x10, _c@PAGEOFF]
	ldr	x16, [x16, x8, lsl #3]
	str	xzr, [x16, x14, lsl #3]
LBB0_4:                                 ; %.lr.ph
                                        ;   Parent Loop BB0_2 Depth=1
                                        ;     Parent Loop BB0_3 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x16, [x11, _a@PAGEOFF]
	lsl	x17, x8, #3
	ldr	x16, [x16, x17]
	ldr	d0, [x16, x15]
	ldr	x16, [x12, _b@PAGEOFF]
	ldr	x16, [x16, x15]
	lsl	x0, x14, #3
	ldr	d1, [x16, x0]
	ldr	x16, [x10, _c@PAGEOFF]
	ldr	x16, [x16, x17]
	ldr	d2, [x16, x0]
	fmadd	d0, d0, d1, d2
	str	d0, [x16, x0]
	add	x15, x15, #8
	cmp	x9, x15
	b.ne	LBB0_4
; %bb.5:                                ; %._crit_edge
                                        ;   in Loop: Header=BB0_3 Depth=2
	add	x14, x14, #1
	cmp	x14, x13
	b.ne	LBB0_3
; %bb.6:                                ; %._crit_edge23
                                        ;   in Loop: Header=BB0_2 Depth=1
	add	x8, x8, #1
	cmp	x8, x13
	b.ne	LBB0_2
LBB0_7:                                 ; %._crit_edge25
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print                          ; -- Begin function print
	.p2align	2
_print:                                 ; @print
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
                                        ; kill: def $w0 killed $w0 def $x0
	cmp	w0, #1
	b.lt	LBB1_5
; %bb.1:                                ; %.preheader.lr.ph
	mov	x20, #0
	ubfiz	x21, x0, #3, #32
	adrp	x22, _c@PAGE
	mov	w23, w0
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
LBB1_2:                                 ; %.lr.ph
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
	mov	x24, #0
LBB1_3:                                 ;   Parent Loop BB1_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [x22, _c@PAGEOFF]
	ldr	x8, [x8, x20, lsl #3]
	ldr	d0, [x8, x24]
	str	d0, [sp]
	mov	x0, x19
	bl	_printf
	add	x24, x24, #8
	cmp	x21, x24
	b.ne	LBB1_3
; %bb.4:                                ; %._crit_edge
                                        ;   in Loop: Header=BB1_2 Depth=1
	mov	w0, #10
	bl	_putchar
	add	x20, x20, #1
	cmp	x20, x23
	b.ne	LBB1_2
LBB1_5:                                 ; %._crit_edge12
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
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
	mov	w0, #16384
	bl	_malloc
	adrp	x19, _a@PAGE
	str	x0, [x19, _a@PAGEOFF]
	mov	w0, #16384
	bl	_malloc
	adrp	x20, _b@PAGE
	str	x0, [x20, _b@PAGEOFF]
	mov	w0, #16384
	bl	_malloc
	mov	x22, #0
	adrp	x21, _c@PAGE
	str	x0, [x21, _c@PAGEOFF]
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	mov	w0, #16384
	bl	_malloc
	ldr	x8, [x19, _a@PAGEOFF]
	str	x0, [x8, x22]
	mov	w0, #16384
	bl	_malloc
	ldr	x8, [x20, _b@PAGEOFF]
	str	x0, [x8, x22]
	mov	w0, #16384
	bl	_malloc
	ldr	x8, [x21, _c@PAGEOFF]
	str	x0, [x8, x22]
	add	x22, x22, #8
	cmp	x22, #4, lsl #12                ; =16384
	b.ne	LBB2_1
; %bb.2:                                ; %.preheader.preheader
	mov	x8, #0
	mov	x9, #4611686018427387904
	mov	x10, #4617315517961601024
LBB2_3:                                 ; %.preheader
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_4 Depth 2
	mov	x11, #0
LBB2_4:                                 ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x12, [x19, _a@PAGEOFF]
	lsl	x13, x8, #3
	ldr	x12, [x12, x13]
	str	x9, [x12, x11]
	ldr	x12, [x20, _b@PAGEOFF]
	ldr	x12, [x12, x13]
	str	x10, [x12, x11]
	ldr	x12, [x21, _c@PAGEOFF]
	ldr	x12, [x12, x13]
	str	xzr, [x12, x11]
	add	x11, x11, #8
	cmp	x11, #4, lsl #12                ; =16384
	b.ne	LBB2_4
; %bb.5:                                ;   in Loop: Header=BB2_3 Depth=1
	add	x8, x8, #1
	cmp	x8, #2048
	b.ne	LBB2_3
; %bb.6:
	mov	w0, #2048
	bl	_matrixMult
	ldr	x8, [x21, _c@PAGEOFF]
	ldr	x8, [x8, #16376]
	ldr	d0, [x8, #16376]
	str	d0, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldr	x0, [x19, _a@PAGEOFF]
	bl	_free
	ldr	x0, [x20, _b@PAGEOFF]
	bl	_free
	ldr	x0, [x21, _c@PAGEOFF]
	bl	_free
	mov	w0, #0
	bl	_exit
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_c                              ; @c
.zerofill __DATA,__common,_c,8,3
	.globl	_a                              ; @a
.zerofill __DATA,__common,_a,8,3
	.globl	_b                              ; @b
.zerofill __DATA,__common,_b,8,3
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%f "

l_.str.1:                               ; @.str.1
	.asciz	"%f\n"

.subsections_via_symbols
