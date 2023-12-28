section .data
    number:     db '0123456789'

section .text
	global _start

_start:
    
    mov ecx, number
    add ecx, ebp
     
    mov eax, 4            
	mov ebx, 1 
  	mov edx, 1                     
	int 0x80
    
    add ebp, 1
    
    cmp ebp, 5 ; r11 < 10 jmp to tada    
    call exit

exit:
	mov eax,1            
	mov ebx,0            
	int 0x80;