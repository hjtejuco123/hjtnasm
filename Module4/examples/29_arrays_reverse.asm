section .data
    p db "Enter 5 characters: "
    plen equ $-p
    msg db "Reverse = "
    msglen equ $-msg
    nl db 10
section .bss
    arr resb 6
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
    mov ecx,arr
    mov edx,6
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80

    mov esi,4
.loop:
    mov eax,4
    mov ebx,1
    lea ecx,[arr+esi]
    mov edx,1
    int 0x80
    dec esi
    jns .loop

    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
