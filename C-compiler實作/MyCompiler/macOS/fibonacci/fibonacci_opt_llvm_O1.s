	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_fib                            ; -- Begin function fib
	.p2align	2
_fib:                                   ; @fib
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
	mov	x19, x0
	mov	x20, #0
	mov	w21, #1
	subs	w0, w19, #1
	b.lt	LBB0_3
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	b.eq	LBB0_4
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	bl	_fib
	add	x20, x20, x0
	sub	w19, w19, #2
	subs	w0, w19, #1
	b.ge	LBB0_1
LBB0_3:
	mov	x21, #0
LBB0_4:
	add	x0, x20, x21
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
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
	mov	w19, #50
	mov	w0, #50
	bl	_fib
	stp	x19, x0, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Fibonacci number #%d: %lld\n"

.subsections_via_symbols
