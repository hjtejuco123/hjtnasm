section .data
    p db "Enter a two-digit number: "
    plen equ $-p
    msg db "Number + 1 = "
    msglen equ $-msg
    nl db 10
section .bss
    buf resb 4
    out resb 3
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

    movzx eax,byte [buf]
    sub eax,'0'
    imul eax,eax,10
    movzx ebx,byte [buf+1]
    sub ebx,'0'
    add eax,ebx
    inc eax
    mov edi,eax

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80

    mov eax,edi
    xor edx,edx
    mov ebx,10
    div ebx
    add al,'0'
    add dl,'0'
    mov [out],al
    mov [out+1],dl
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
