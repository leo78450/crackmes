BITS 64

section .text
    global _start

_start:
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	xor rdi, rdi
	xor rsi, rsi

	mov rax, 60
	mov rdi, 0
	syscall
