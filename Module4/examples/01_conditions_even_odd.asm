section .data
    p db "Enter one digit (0-9): ",0
    plen equ $-p
    evenmsg db "Output: EVEN",10
    evenlen equ $-evenmsg
    oddmsg db "Output: ODD",10
    oddlen equ $-oddmsg
section .bss
    ch resb 2
section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,p
    mov edx,plen-1
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,ch
    mov edx,2
    int 0x80

    mov al,[ch]
    sub al,'0'
    test al,1
    jnz .odd

    mov eax,4
    mov ebx,1
    mov ecx,evenmsg
    mov edx,evenlen
    int 0x80
    jmp .exit
.odd:
    mov eax,4
    mov ebx,1
    mov ecx,oddmsg
    mov edx,oddlen
    int 0x80
.exit:
    mov eax,1
    xor ebx,ebx
    int 0x80
