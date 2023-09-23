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
	stp	d9, d8, [sp, #64]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	stur	wzr, [x29, #-36]
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	w8, #34464
	movk	w8, #1, lsl #16
	stp	wzr, w8, [x29, #-44]
	stp	wzr, wzr, [sp, #44]
	fmov	d8, #1.00000000
	fmov	d9, #4.00000000
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
	b	LBB1_2
LBB1_1:                                 ;   in Loop: Header=BB1_2 Depth=1
	ldr	w8, [sp, #44]
	add	w8, w8, #1
	str	w8, [sp, #44]
LBB1_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #44]
	ldur	w9, [x29, #-40]
	mul	w9, w9, w9
	cmp	w8, w9
	b.ge	LBB1_7
; %bb.3:                                ;   in Loop: Header=BB1_2 Depth=1
	bl	_randomFloat
	str	d0, [sp, #32]
	bl	_randomFloat
	str	d0, [sp, #24]
	ldr	d1, [sp, #32]
	fmul	d0, d0, d0
	fmadd	d0, d1, d1, d0
	fcmp	d0, d8
	b.hi	LBB1_5
; %bb.4:                                ;   in Loop: Header=BB1_2 Depth=1
	ldur	w8, [x29, #-44]
	add	w8, w8, #1
	stur	w8, [x29, #-44]
LBB1_5:                                 ;   in Loop: Header=BB1_2 Depth=1
	ldr	w8, [sp, #48]
	add	w8, w8, #1
	str	w8, [sp, #48]
	ldr	w8, [sp, #44]
	ldur	w9, [x29, #-40]
	sdiv	w10, w8, w9
	msub	w9, w10, w9, w8
	cmp	w9, #0
	ccmp	w8, #0, #4, eq
	b.eq	LBB1_1
; %bb.6:                                ;   in Loop: Header=BB1_2 Depth=1
	ldur	s0, [x29, #-44]
	sshll.2d	v0, v0, #0
	scvtf	d0, d0
	fmul	d0, d0, d9
	ldr	s1, [sp, #48]
	sshll.2d	v1, v1, #0
	scvtf	d1, d1
	fdiv	d0, d0, d1
	ldr	w8, [sp, #44]
	str	x8, [sp]
	str	d0, [sp, #8]
	mov	x0, x19
	bl	_printf
	b	LBB1_1
LBB1_7:
	ldur	s0, [x29, #-44]
	sshll.2d	v0, v0, #0
	scvtf	d0, d0
	fmov	d1, #4.00000000
	fmul	d0, d0, d1
	ldr	s1, [sp, #48]
	sshll.2d	v1, v1, #0
	scvtf	d1, d1
	fdiv	d0, d0, d1
	str	d0, [sp, #16]
	str	d0, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #64]               ; 16-byte Folded Reload
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
