esection .data
    p db "Enter a lowercase letter: "
    plen equ $-p
    yes db "Output: VOWEL",10
    yeslen equ $-yes
    no db "Output: CONSONANT/OTHER",10
    nolen equ $-no
section .bss
    ch resb 2
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
    mov ecx,ch
    mov edx,2
    int 0x80

    mov al,[ch]
    cmp al,'a'
    je .vowel
    cmp al,'e'
    je .vowel
    cmp al,'i'
    je .vowel
    cmp al,'o'
    je .vowel
    cmp al,'u'
    je .vowel
    mov ecx,no
    mov edx,nolen
    jmp .print
.vowel:
    mov ecx,yes
    mov edx,yeslen
.print:
    mov eax,4
    mov ebx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
