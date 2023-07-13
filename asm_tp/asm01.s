BITS 64

global _start

section .data
	num db "1337", 0

section .text

_start:
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	xor rdi, rdi
	xor rsi, rsi

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
