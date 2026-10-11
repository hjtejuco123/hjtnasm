section .data
    p db "Enter grade digit (0-9): "
    plen equ $-p
    high db "Output: HIGH (8-9)",10
    highlen equ $-high
    mid db "Output: MIDDLE (5-7)",10
    midlen equ $-mid
    low db "Output: LOW (0-4)",10
    lowlen equ $-low
section .bss
    n resb 2
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

    mov al,[n]
    sub al,'0'
    cmp al,8
    jae .high
    cmp al,5
    jae .middle
    mov ecx,low
    mov edx,lowlen
    jmp .print
.high:
    mov ecx,high
    mov edx,highlen
    jmp .print
.middle:
    mov ecx,mid
    mov edx,midlen
.print:
    mov eax,4
    mov ebx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
