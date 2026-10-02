section .data
    p1 db "Enter first digit: "
    p1len equ $-p1
    p2 db "Enter second digit: "
    p2len equ $-p2
    msg db "Sum = "
    msglen equ $-msg
    nl db 10
section .bss
    a resb 2
    b resb 2
    out resb 2
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

    movzx eax,byte [a]
    sub eax,'0'
    movzx ebx,byte [b]
    sub ebx,'0'
    add eax,ebx
    mov edi,eax

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80

    mov eax,edi
    cmp eax,10
    jb .one
    xor edx,edx
    mov ebx,10
    div ebx
    add al,'0'
    add dl,'0'
    mov [out],al
    mov [out+1],dl
    mov edx,2
    jmp .show
.one:
    add al,'0'
    mov [out],al
    mov edx,1
.show:
    mov eax,4
    mov ebx,1
    mov ecx,out
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
