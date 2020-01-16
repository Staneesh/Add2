section .data

	helloMsg db "Sum of two numbers", 0xA
	lenHello equ ($ - helloMsg)

section .bss

section .text
	
global _start
_start:

	push lenHello
	push helloMsg

	call print

	add esp, 4 * 2 		; popping lenHello and helloMsg from the stack


	push 13
	push 213
	
	call add2

	add esp, 4 * 2 		; popping two numbers from the stack
	
	
	mov ebx, eax
	mov eax, 1
	int 0x80

print:
	push ebp
	mov ebp, esp

	push eax
	push ebx
	push ecx
	push edx
	
	mov edx, [ebp + 4 * 3]
	mov ecx, [ebp + 4 * 2]
	mov ebx, 1
	mov eax, 4
	int 0x80

	pop edx
	pop ecx
	pop ebx
	pop eax

	mov esp, ebp
	pop ebp
	ret
	
add2:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 4 * 3]
	add eax, [ebp + 4 * 2]
	
	mov esp, ebp
	pop ebp
	ret
	
