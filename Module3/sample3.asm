;inc with user input 

section .data
    prompt db "Enter a digit: ",0xA
    len_prompt equ $ - prompt ;length

    msg_res db "Incremented value: ",0xA
    len_msg equ $ - msg_res

section .bss 
    input resb 2    ;buffer 1 digit + newline 
    result resb 2   ;store inc value + newline


section .text 
    global _start

_start:
    ;display the prompt 
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt 
    mov edx, len_prompt
    int 0x80

    ;input
    mov eax,3       ;sys_read 
    mov ebx,0       ;keyboard
    mov ecx, input
    mov edx, 2
    int 0x80 

    ; load input into AL and convert ASCII integer
    mov al, [input]         ;3
    sub al, '0'             ;
                            ;'0' = 33-30 = 3
    ;Increment value of 1
    inc al                  ;3+1 = 4

    ;convert back to ASCII
    add al,'0'              ;4+30 = 34
    mov [result],al         ;34
                            ;add a new line

    ;add
    mov byte [result+1],0xA ;added a new line 

    mov eax,4
    mov ebx,1
    mov ecx, msg_res
    mov edx, len_msg
    int 0x80 

    mov eax,4
    mov ebx,1
    mov ecx,result
    mov edx,2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80