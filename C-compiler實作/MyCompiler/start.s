# Linux system calls constants
.equ SYSCALL_EXIT, 1
.equ INTERRUPT_LINUX_SYSCALL, 0x80
# Code section
.section .text
.globl _start
_start:                            # Program entry point
    call main                      # Calling main function
# Now calling exit() system call
    movl %eax, %ebx                # Saving return value for exit() argument
    movl $SYSCALL_EXIT, %eax        # System call number
    int $INTERRUPT_LINUX_SYSCALL    # Raising programm interrupt