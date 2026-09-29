section .data
    p db "Enter one character: "
    plen equ $-p
    msg db "Output (5 times): "
    msglen equ $-msg
    nl db 10

section .bss
    x resb 2

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
    mov ecx,x
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80

    mov esi,5
.loop:
    mov eax,4
    mov ebx,1
    mov ecx,x
    mov edx,1
    int 0x80
    dec esi
    jnz .loop

    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
