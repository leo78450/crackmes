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

	; scanf
	mov rax, 0 ; read
	mov rdi, 0 ; stdin
	mov rsi, input ; 4 bytes dans input en bss
	mov rdx, 4 
	syscall

	; cmp input with 42 and jump if input is not equal to 42
	mov al, [input] 
	cmp al, "4"
	jne test
	mov al, [input+1]
	cmp al, "2"
	jne test
	mov al, [input+2]
	cmp al, 10 
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
