;Constant defintion
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data 

   msg1 db "Enter a digit ", 0xA,0xD 
   len1 equ $- msg1 

   msg2 db "Please enter a second digit", 0xA,0xD 
   len2 equ $- msg2 

   msg3 db "The difference is: "
   len3 equ $- msg3

;uninitialized data - use during runtime 
section .bss

   num1 resb 2 
   num2 resb 2 
   res resb 2    

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   ; moving the first number to eax register and second number to ebx
   ; and subtracting ascii '0' to convert it into a decimal number
	
   mov eax, [num1]      ;5
   sub eax, '0'         ;35-30 = 5
	
   mov ebx, [num2]      ;2
   sub ebx, '0'         ;32-30 = 2

   ; add eax and ebx
   sub eax, ebx         ;5-2
   ; add '0' to to convert the sum from decimal to ASCII
   add eax, '0'           

   mov [res], eax
     ; storing the sum in memory location res
   mov byte [res+1],0xA ;new line

   ; print the diff 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 2        
   int 0x80   
   
   mov eax, SYS_EXIT   
   xor ebx, ebx         ;mov ebx,0
   int 0x80