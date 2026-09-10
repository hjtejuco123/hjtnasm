SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1
 
section .text
    global _start

_start:
    ; write the greeting to standard output
    mov eax, SYS_WRITE          ; syscall number 4
    mov ebx, STDOUT             ; file descriptor 1 (screen)
    mov ecx, message            ; address of the string
    mov edx, message_len        ; number of bytes to write
    int 0x80                    ; trigger the system call
 
    ; exit cleanly
    mov eax, SYS_EXIT
    xor ebx, ebx                ; exit code 0
    ;mov ebx,0
    int 0x80
 
section .data
    message db 'Welcome to Assembly Lab!', 0xa   ; 0xa = newline
    message_len equ $ - message   ; length of the message bytes
