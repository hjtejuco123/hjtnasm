section .data
    p db "Enter N (1-9): "
    plen equ $-p
    msg db "Output: "
    msglen equ $-msg
    so db " "
    nl db 10
    
section .bss
    n resb 2
    x resb 1

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
    mov ecx,n
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80

    movzx edi,byte [n]
    sub edi,'0'
    mov esi,1

.loop:
    cmp esi,edi
    ja .done
    mov eax,esi
    add al,'0'
    mov [x],al
    mov eax,4
    mov ebx,1
    mov ecx,x
    mov edx,1
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,so
    mov edx,1
    int 0x80

    inc esi
    jmp .loop

.done:
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80
