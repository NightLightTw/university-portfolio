	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_fib                            ; -- Begin function fib
	.p2align	2
_fib:                                   ; @fib
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	w0, [sp, #4]
	cmp	w0, #0
	b.gt	LBB0_2
; %bb.1:
	str	xzr, [sp, #8]
	b	LBB0_6
LBB0_2:
	ldr	w8, [sp, #4]
	cmp	w8, #1
	b.ne	LBB0_4
; %bb.3:
	mov	w8, #1
	b	LBB0_5
LBB0_4:
	ldr	w8, [sp, #4]
	sub	w0, w8, #1
	bl	_fib
	mov	x19, x0
	ldr	w8, [sp, #4]
	sub	w0, w8, #2
	bl	_fib
	add	x8, x19, x0
LBB0_5:
	str	x8, [sp, #8]
LBB0_6:
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
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
	stur	wzr, [x29, #-20]
	mov	w19, #50
	str	w19, [sp, #24]
	mov	w0, #50
	bl	_fib
	stp	x19, x0, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Fibonacci number #%d: %lld\n"

.subsections_via_symbols
