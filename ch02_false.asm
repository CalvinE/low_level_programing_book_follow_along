global _start 

section .text

_start:
    mov rax, 60 ;set to 60 for 'exit' syscall
    mov rdi, 1 ;set rdi to one so that the exit code will be 1
    syscall