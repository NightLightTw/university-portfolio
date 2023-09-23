	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_matrixMult                     ; -- Begin function matrixMult
	.p2align	2
_matrixMult:                            ; @matrixMult
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	wzr, w0, [sp, #16]
	adrp	x8, _c@PAGE
	adrp	x9, _a@PAGE
	adrp	x10, _b@PAGE
	b	LBB0_2
LBB0_1:                                 ;   in Loop: Header=BB0_2 Depth=1
	ldr	w11, [sp, #16]
	add	w11, w11, #1
	str	w11, [sp, #16]
LBB0_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
                                        ;       Child Loop BB0_7 Depth 3
	ldp	w11, w12, [sp, #16]
	cmp	w11, w12
	b.ge	LBB0_9
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	str	wzr, [sp, #12]
	b	LBB0_5
LBB0_4:                                 ;   in Loop: Header=BB0_5 Depth=2
	ldr	w11, [sp, #12]
	add	w11, w11, #1
	str	w11, [sp, #12]
LBB0_5:                                 ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_7 Depth 3
	ldr	w11, [sp, #12]
	ldr	w12, [sp, #20]
	cmp	w11, w12
	b.ge	LBB0_1
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	ldr	x11, [x8, _c@PAGEOFF]
	ldrsw	x12, [sp, #16]
	ldr	x11, [x11, x12, lsl #3]
	ldrsw	x12, [sp, #12]
	str	xzr, [x11, x12, lsl #3]
	str	wzr, [sp, #8]
LBB0_7:                                 ;   Parent Loop BB0_2 Depth=1
                                        ;     Parent Loop BB0_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w11, [sp, #8]
	ldr	w12, [sp, #20]
	cmp	w11, w12
	b.ge	LBB0_4
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=3
	ldr	x11, [x9, _a@PAGEOFF]
	ldrsw	x12, [sp, #16]
	lsl	x12, x12, #3
	ldr	x11, [x11, x12]
	ldrsw	x13, [sp, #8]
	lsl	x14, x13, #3
	ldr	d0, [x11, x14]
	ldr	x11, [x10, _b@PAGEOFF]
	ldr	x11, [x11, x14]
	ldrsw	x14, [sp, #12]
	lsl	x14, x14, #3
	ldr	d1, [x11, x14]
	ldr	x11, [x8, _c@PAGEOFF]
	ldr	x11, [x11, x12]
	ldr	d2, [x11, x14]
	fmadd	d0, d0, d1, d2
	str	d0, [x11, x14]
	add	w11, w13, #1
	str	w11, [sp, #8]
	b	LBB0_7
LBB0_9:
	ldr	d0, [sp, #24]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print                          ; -- Begin function print
	.p2align	2
_print:                                 ; @print
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	w0, [x29, #-20]
	str	wzr, [sp, #24]
	adrp	x20, _c@PAGE
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
	b	LBB1_2
LBB1_1:                                 ;   in Loop: Header=BB1_2 Depth=1
	mov	w0, #10
	bl	_putchar
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
LBB1_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_4 Depth 2
	ldr	w8, [sp, #24]
	ldur	w9, [x29, #-20]
	cmp	w8, w9
	b.ge	LBB1_6
; %bb.3:                                ;   in Loop: Header=BB1_2 Depth=1
	str	wzr, [sp, #20]
LBB1_4:                                 ;   Parent Loop BB1_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #20]
	ldur	w9, [x29, #-20]
	cmp	w8, w9
	b.ge	LBB1_1
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=2
	ldr	x8, [x20, _c@PAGEOFF]
	ldrsw	x9, [sp, #24]
	ldr	x8, [x8, x9, lsl #3]
	ldrsw	x9, [sp, #20]
	ldr	d0, [x8, x9, lsl #3]
	str	d0, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB1_4
LBB1_6:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
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
	mov	w8, #2048
	stp	w8, wzr, [sp, #24]
	mov	w0, #16384
	bl	_malloc
	adrp	x19, _a@PAGE
	str	x0, [x19, _a@PAGEOFF]
	ldrsw	x8, [sp, #24]
	lsl	x0, x8, #3
	bl	_malloc
	adrp	x20, _b@PAGE
	str	x0, [x20, _b@PAGEOFF]
	ldrsw	x8, [sp, #24]
	lsl	x0, x8, #3
	bl	_malloc
	adrp	x21, _c@PAGE
	str	x0, [x21, _c@PAGEOFF]
	str	wzr, [sp, #20]
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w8, w9, [sp, #20]
	cmp	w8, w9
	b.ge	LBB2_3
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	ldrsw	x8, [sp, #24]
	lsl	x0, x8, #3
	bl	_malloc
	ldr	x8, [x19, _a@PAGEOFF]
	ldrsw	x9, [sp, #20]
	str	x0, [x8, x9, lsl #3]
	ldrsw	x8, [sp, #24]
	lsl	x0, x8, #3
	bl	_malloc
	ldr	x8, [x20, _b@PAGEOFF]
	ldrsw	x9, [sp, #20]
	str	x0, [x8, x9, lsl #3]
	ldrsw	x8, [sp, #24]
	lsl	x0, x8, #3
	bl	_malloc
	ldr	x8, [x21, _c@PAGEOFF]
	ldrsw	x9, [sp, #20]
	ldr	w10, [sp, #20]
	str	x0, [x8, x9, lsl #3]
	add	w8, w10, #1
	str	w8, [sp, #20]
	b	LBB2_1
LBB2_3:
	str	wzr, [sp, #20]
	mov	x8, #4611686018427387904
	mov	x9, #4617315517961601024
	b	LBB2_5
LBB2_4:                                 ;   in Loop: Header=BB2_5 Depth=1
	ldr	w10, [sp, #20]
	add	w10, w10, #1
	str	w10, [sp, #20]
LBB2_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_7 Depth 2
	ldp	w10, w11, [sp, #20]
	cmp	w10, w11
	b.ge	LBB2_9
; %bb.6:                                ;   in Loop: Header=BB2_5 Depth=1
	str	wzr, [sp, #16]
LBB2_7:                                 ;   Parent Loop BB2_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w10, [sp, #16]
	ldr	w11, [sp, #24]
	cmp	w10, w11
	b.ge	LBB2_4
; %bb.8:                                ;   in Loop: Header=BB2_7 Depth=2
	ldr	x10, [x19, _a@PAGEOFF]
	ldpsw	x12, x11, [sp, #16]
	lsl	x11, x11, #3
	ldr	x10, [x10, x11]
	lsl	x13, x12, #3
	str	x8, [x10, x13]
	ldr	x10, [x20, _b@PAGEOFF]
	ldr	x10, [x10, x11]
	str	x9, [x10, x13]
	ldr	x10, [x21, _c@PAGEOFF]
	ldr	x10, [x10, x11]
	str	xzr, [x10, x13]
	add	w10, w12, #1
	str	w10, [sp, #16]
	b	LBB2_7
LBB2_9:
	ldr	w0, [sp, #24]
	bl	_matrixMult
	ldr	x8, [x21, _c@PAGEOFF]
	ldrsw	x9, [sp, #24]
	lsl	x9, x9, #3
	sub	x9, x9, #8
	ldr	x8, [x8, x9]
	ldr	d0, [x8, x9]
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
