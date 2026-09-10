SYS_EXIT equ 1
 
section .text
    global _start
_start:
    mov eax, SYS_EXIT         ; syscall number 1
    mov ebx, 12                ; exit with status 12
    int 0x80
