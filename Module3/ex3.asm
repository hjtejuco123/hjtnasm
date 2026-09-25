;DEC 
;4 - 1 = 3 (HL = x = x-1, x--)


section .data

section .bss
    result resb 2       ; reserve two bytes
section .text
    global _start

_start:

    mov al,5    ; loads AL registers with a value of 5
    dec al      ; dec the value of AL = 5-1=4 

    add al,'0'  ;'0' = 30 + 4 = 36

    mov [result],al ; store the value of 36 to result 

    ;add newline
    mov byte [result+1],0xA ;new line

    mov eax,4
    mov ebx,1
    mov ecx,result
    mov edx,2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80