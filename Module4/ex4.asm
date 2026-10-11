section	.bss
    num resb 1

section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   mov ecx,10
   mov eax, '1'         ;loading ASCII char 1 = 49
	
l1:
   mov [num], eax       ;save character var num 
   mov eax, 4
   mov ebx, 1
   push ecx             ;insert
	
   mov ecx, num        
   mov edx, 1        
   int 0x80
	
   mov eax, [num]
   sub eax, '0'
   inc eax
   add eax, '0'
   pop ecx
   loop l1
	
   mov eax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel
