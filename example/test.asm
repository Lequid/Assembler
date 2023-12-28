extern printf


section .data
arg db "Hi!", 0

section .text
main:
	push ebp
	mov ebp, esp
	
	push arg
	call printf
	add esp, 4

	pop ebp
	ret
	
	