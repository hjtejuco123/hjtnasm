;Take user input and display it 
;output
;   (1)            (2) 
;Enter your name: Hadji
;  (3)   (4)    
;Hello, Hadji

section .bss 
    buffer resb 32  ;Reserve 32 bytes for user input 

section .data 
    prompt db "Enter your name: "
    len_prompt equ $ - prompt      

    greeting db "Hello, "
    len_greeting equ $ - greeting 


section .text 
    global _start 

_start:
    ;print first prompt 
    mov eax, 4              ;sys_write
    mov ebx, 1              ;stdout -> terminal 
    mov ecx, prompt 
    mov edx, len_prompt 
    int 0x80        

    ;2 input  
    mov eax,3               ;sys_read 
    mov ebx,0               ;stdin 
    mov ecx,buffer          ;store input to buffer 
    mov edx,32              ;max bytes to read 
    int 0x80      

    ;print greeting prompt 
    mov eax, 4              ;sys_write
    mov ebx, 1              ;stdout -> terminal 
    mov ecx, greeting 
    mov edx, len_greeting 
    int 0x80 

    ;print the name entered  
    mov eax, 4              ;sys_write
    mov ebx, 1              ;stdout -> terminal 
    mov ecx, buffer 
    mov edx, 32
    int 0x80  
  

    ;5 sys_exit 
    mov eax, 1              ;sys_exit
    xor ebx, ebx            ;status 0 - return 0
    int 0x80
