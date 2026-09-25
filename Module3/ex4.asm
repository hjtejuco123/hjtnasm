;input a number and show the increment value

section .data
    promptInput db "Enter a number from 0-8: ",0xA
    promptInput_len equ $ - promptInput

    promptOutput db "The Decrement value is: "
    promptOutput_len equ $ - promptOutput

section .bss
    result resb 2
    input resb 1

section .text
    global _start

_start:
    ;first prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, promptInput
    mov edx, promptInput_len
    int 0x80

    mov eax,3 
    mov ebx,0
    mov ecx,input 
    mov edx,1
    int 0x80

    mov  al,[input]     ;3 = HEX = 33 

    ;subtraction -syntax
    ;sub destination, source
    sub al,'0'          ;'0' = HEX = 30   33-30 = 3 (actual number)
    
    dec al              ;3-1 = 2 

    ;addition syntax
    ;add destination, source 
    add al,'0'          ;'0' = 30 + 2 = 32 (2)

    mov [result],al     ;store the value of 4 to result 

    mov byte[result+1],0xA       ;new line character 

     ;second prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, promptOutput
    mov edx, promptOutput_len
    int 0x80

     ;result prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 0x80

    ;exit
    mov eax,1
    mov ebx,0
    int 0x80