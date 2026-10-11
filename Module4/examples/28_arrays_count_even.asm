section .data
    p db "Enter 5 digits without spaces: "
    plen equ $-p
    msg db "Even digit count = "
    msglen equ $-msg
    nl db 10
section .bss
    arr resb 6
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
    mov ecx,arr
    mov edx,6
    int 0x80

    mov esi,arr
    mov ecx,5
    xor edi,edi
.loop:
    mov al,[esi]
    sub al,'0'
    test al,1
    jnz .skip
    inc edi
.skip:
    inc esi
    loop .loop

    mov eax,edi
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
