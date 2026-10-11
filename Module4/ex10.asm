section .data
    p db "Enter text: "
    plen equ $-p
    msg db "Copied text: "
    msglen equ $-msg
section .bss
    src resb 64
    dst resb 64
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
    mov ecx,src
    mov edx,64
    int 0x80
    mov ebp,eax

    cld
    mov esi,src
    mov edi,dst
    mov ecx,ebp
    rep movsb

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,dst
    mov edx,ebp
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
