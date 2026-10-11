section .data
    p db "Enter 5 digits without spaces: "
    plen equ $-p
    msg db "Sum = "
    msglen equ $-msg
    nl db 10
section .bss
    arr resb 6
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
    mov ecx,arr
    mov edx,6
    int 0x80

    mov esi,arr
    mov ecx,5
    xor edi,edi
.sum:
    movzx eax,byte [esi]
    sub eax,'0'
    add edi,eax
    inc esi
    loop .sum

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
