section .data
    p db "Enter text (max 9 chars): "
    plen equ $-p
    msg db "Length = "
    msglen equ $-msg
    nl db 10
section .bss
    buf resb 16
    out resb 1
section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,p
    mov edx,plen
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,buf
    mov edx,10
    int 0x80
    dec eax
    add al,'0'
    mov [out],al

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,out
    mov edx,1
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
