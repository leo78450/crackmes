BITS 64

global _start

section .data
	num db "1337", 0
	;other_num db "42", 0

section .bss
	input resb 4 ; input = ref à la base mémoire
				 ; resb = réserve bytes
				 ; 4 = nb de bytes

section .text

_start:
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	xor rdi, rdi
	xor rsi, rsi

	; read argv
	pop rax
	pop rax
	pop rax
	
	; cmp input with 42 and jump if input is not equal to 42 
	cmp byte[rax], "4"
	jne test
	cmp byte[rax+1], "2"
	jne test
	cmp byte[rax+2], 10 
	jne test

	; print 1337
	mov rax, 1
	mov rdi, 1
	mov rsi, num
	mov rdx, 4
	syscall	
	
	; return 0
	mov rax, 60
	mov rdi, 0
	syscall

	test:
		; return 1
		mov rax, 60
		mov rdi, 1
		syscall
