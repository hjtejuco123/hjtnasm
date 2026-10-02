section .data
    p db "Enter two decimal digits (e.g. 47): "
    plen equ $-p
    msg db "Packed BCD byte displayed as original digits: "
    msglen equ $-msg
    nl db 10
section .bss
    buf resb 3
    packed resb 1
    out resb 2
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
    mov edx,3
    int 0x80

    mov al,[buf]
    sub al,'0'
    shl al,4
    mov bl,[buf+1]
    sub bl,'0'
    or al,bl
    mov [packed],al

    mov al,[packed]
    mov ah,al
    shr al,4
    and ah,0x0F
    add al,'0'
    add ah,'0'
    mov [out],al
    mov [out+1],ah

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,out
    mov edx,2
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
