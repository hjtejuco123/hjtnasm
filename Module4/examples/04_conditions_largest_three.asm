section .data
    p1 db "Enter first digit: "
    p1len equ $-p1
    p2 db "Enter second digit: "
    p2len equ $-p2
    p3 db "Enter third digit: "
    p3len equ $-p3
    msg db "Largest digit: "
    msglen equ $-msg
    nl db 10
section .bss
    a resb 2
    b resb 2
    c resb 2
    out resb 1
section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,p1
    mov edx,p1len
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,a
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,p2
    mov edx,p2len
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,b
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,p3
    mov edx,p3len
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,c
    mov edx,2
    int 0x80

    mov al,[a]
    cmp al,[b]
    jae .checkc
    mov al,[b]
.checkc:
    cmp al,[c]
    jae .show
    mov al,[c]
.show:
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
