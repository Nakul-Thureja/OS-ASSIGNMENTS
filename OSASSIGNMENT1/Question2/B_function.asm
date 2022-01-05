extern C_function
section .data
	text db "Executing Function B", 10

section .bss
	number resb 8

section .text
	global B_function

B_function:
	mov [number], rdi

	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 21
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, number
	mov rdx, 8
	syscall
	
	push rbp
	mov rbp, rsp
	lea r9, [C_function]
	mov [rbp+8], r9
	pop rbp
	ret