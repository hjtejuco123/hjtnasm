section .data
    p db "Enter N (1-9): "
    plen equ $-p
    msg db "Sum = "
    msglen equ $-msg
    nl db 10
section .bss
    n resb 2
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
    mov ecx,n
    mov edx,2
    int 0x80

    movzx ecx,byte [n]
    sub ecx,'0'
    xor eax,eax
    mov ebx,1
.sum:
    add eax,ebx
    inc ebx
    loop .sum

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
    jmp .print
.one:
    add al,'0'
    mov [out],al
    mov edx,1
.print:
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
