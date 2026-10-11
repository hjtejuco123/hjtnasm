section .data
    p db "Enter text: "
    plen equ $-p
    msg db "You entered: "
    msglen equ $-msg
section .bss
    buf resb 64
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
    mov edx,64
    int 0x80
    mov esi,eax

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,buf
    mov edx,esi
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
