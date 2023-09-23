	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0
	.globl	_swap                           ; -- Begin function swap
	.p2align	2
_swap:                                  ; @swap
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x1, x0, [sp, #16]
	ldr	w8, [x0]
	str	w8, [sp, #12]
	ldr	w9, [x1]
	str	w9, [x0]
	str	w8, [x1]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_partition                      ; -- Begin function partition
	.p2align	2
_partition:                             ; @partition
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	ldr	w8, [x0, w2, sxtw #2]
	stp	w8, w2, [sp, #12]
	sub	w8, w1, #1
	stp	w1, w8, [sp, #4]
	b	LBB1_2
LBB1_1:                                 ;   in Loop: Header=BB1_2 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
LBB1_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w9, [sp, #4]
	ldr	w8, [sp, #16]
	sub	w10, w8, #1
	ldur	x8, [x29, #-8]
	cmp	w9, w10
	b.gt	LBB1_5
; %bb.3:                                ;   in Loop: Header=BB1_2 Depth=1
	ldrsw	x9, [sp, #4]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #12]
	cmp	w8, w9
	b.ge	LBB1_1
; %bb.4:                                ;   in Loop: Header=BB1_2 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	ldur	x9, [x29, #-8]
	add	x0, x9, w8, sxtw #2
	ldrsw	x8, [sp, #4]
	add	x1, x9, x8, lsl #2
	bl	_swap
	b	LBB1_1
LBB1_5:
	ldrsw	x9, [sp, #8]
	add	x8, x8, x9, lsl #2
	add	x0, x8, #4
	ldur	x8, [x29, #-8]
	ldrsw	x9, [sp, #16]
	add	x1, x8, x9, lsl #2
	bl	_swap
	ldr	w8, [sp, #8]
	add	w0, w8, #1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_quickSort                      ; -- Begin function quickSort
	.p2align	2
_quickSort:                             ; @quickSort
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	str	w2, [sp, #16]
	cmp	w1, w2
	b.ge	LBB2_2
; %bb.1:
	ldur	x0, [x29, #-8]
	ldur	w1, [x29, #-12]
	ldr	w2, [sp, #16]
	bl	_partition
	str	w0, [sp, #12]
	ldur	x8, [x29, #-8]
	ldur	w1, [x29, #-12]
	sub	w2, w0, #1
	mov	x0, x8
	bl	_quickSort
	ldur	x0, [x29, #-8]
	ldp	w8, w2, [sp, #12]
	add	w1, w8, #1
	bl	_quickSort
LBB2_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	stp	wzr, w1, [sp, #16]
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w8, w9, [sp, #16]
	cmp	w8, w9
	b.ge	LBB3_3
; %bb.2:                                ;   in Loop: Header=BB3_1 Depth=1
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #16]
	ldr	w8, [x8, x9, lsl #2]
	str	x8, [sp]
	mov	x0, x19
	bl	_printf
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB3_1
LBB3_3:
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
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
	sub	sp, sp, #3168
Lloh4:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh5:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh6:
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	xzr, [sp, #16]
	mov	w8, #9999
	mov	w9, #10000
	add	x10, sp, #24
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [sp, #16]
	cmp	w11, w8
	b.gt	LBB4_3
; %bb.2:                                ;   in Loop: Header=BB4_1 Depth=1
	ldrsw	x11, [sp, #16]
	sub	w12, w9, w11
	str	w12, [x10, x11, lsl #2]
	add	w11, w11, #1
	str	w11, [sp, #16]
	b	LBB4_1
LBB4_3:
	mov	w8, #10000
	str	w8, [sp, #12]
	add	x0, sp, #24
	mov	w1, #0
	mov	w2, #9999
	bl	_quickSort
Lloh7:
	adrp	x0, l_.str.2@PAGE
Lloh8:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldr	w1, [sp, #12]
	add	x0, sp, #24
	bl	_printArray
	ldur	x8, [x29, #-24]
Lloh9:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh10:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh11:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB4_5
; %bb.4:
	mov	w0, #0
	add	sp, sp, #9, lsl #12             ; =36864
	add	sp, sp, #3168
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB4_5:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh4, Lloh5, Lloh6
	.loh AdrpLdrGotLdr	Lloh9, Lloh10, Lloh11
	.loh AdrpAdd	Lloh7, Lloh8
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%d "

l_.str.1:                               ; @.str.1
	.asciz	"\n"

l_.str.2:                               ; @.str.2
	.asciz	"Sorted array: \n"

.subsections_via_symbols
