	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_randomFloat                    ; -- Begin function randomFloat
	.p2align	2
_randomFloat:                           ; @randomFloat
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	_rand
	scvtf	d0, w0
	mov	x8, #281474972516352
	movk	x8, #16863, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	.cfi_offset b10, -88
	.cfi_offset b11, -96
	mov	w20, #34464
	movk	w20, #1, lsl #16
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	w21, #0
	mov	w23, #0
	fmov	d9, #1.00000000
	fmov	d10, #4.00000000
	mov	w22, #58368
	movk	w22, #21515, lsl #16
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
	b	LBB1_2
LBB1_1:                                 ;   in Loop: Header=BB1_2 Depth=1
	mov	x23, x24
	cmp	w24, w22
	b.eq	LBB1_5
LBB1_2:                                 ; =>This Inner Loop Header: Depth=1
	bl	_randomFloat
	fmov	d8, d0
	bl	_randomFloat
	fmul	d0, d0, d0
	fmadd	d0, d8, d8, d0
	fcmp	d0, d9
	cinc	w21, w21, ls
	add	w24, w23, #1
	cbz	w23, LBB1_1
; %bb.3:                                ;   in Loop: Header=BB1_2 Depth=1
	udiv	w8, w23, w20
	mul	w8, w8, w20
	cmp	w8, w23
	b.ne	LBB1_1
; %bb.4:                                ;   in Loop: Header=BB1_2 Depth=1
	scvtf	d0, w21
	fmul	d0, d0, d10
	scvtf	d1, w24
	fdiv	d0, d0, d1
	str	x23, [sp]
	str	d0, [sp, #8]
	mov	x0, x19
	bl	_printf
	b	LBB1_1
LBB1_5:
	scvtf	d0, w21
	fmov	d1, #4.00000000
	fmul	d0, d0, d1
	mov	x8, #3268470112256
	movk	x8, #16853, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	str	d0, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Estimate after %d iterations: %f\n"

l_.str.1:                               ; @.str.1
	.asciz	"Final estimate of Pi = %f\n"

.subsections_via_symbols
