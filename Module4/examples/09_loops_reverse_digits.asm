section .data
    p db "Enter up to 8 characters: "
    plen equ $-p
    msg db "Reversed: "
    msglen equ $-msg
    nl db 10
section .bss
    buf resb 16
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
    mov edx,9
    int 0x80
    mov esi,eax
    dec esi

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
.rev:
    cmp esi,0
    jle .done
    dec esi
    mov eax,4
    mov ebx,1
    lea ecx,[buf+esi]
    mov edx,1
    int 0x80
    jmp .rev
.done:
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
