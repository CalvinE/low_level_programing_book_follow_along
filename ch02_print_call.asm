section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text
global _start

print_newline: ; prints a newline character to stdout
    mov rax, 1 ;'write' syscall identifier
    mov rdi, 1 ;specify stdout file descriptor for write call
    mov rsi, newline_char ;the place we are writing data from
    mov rdx, 1 ;the number of bytes to write
    syscall ;invoke write call
    ret ;return from function

print_hex: ; prints the hex digits for the value stored in rdi
    mov rax, rdi ;here we take the register value we want to print and store it in rax because we will be using rdi for the sys calls?
    mov rdi, 1 ;specify stdout file descriptor for write call
    mov rdx, 1 ;the number of bytes to write
    mov rcx, 64 ;how far we are shifting the value in rax

iterate:
    push rax ;save rax to stack so we can restore it later
    sub rcx, 4 ;subtract one hex digit with of bits for the shift
    sar rax, cl ;shift to 60, 56, 52, ..., 4, 0. cl is the smallest part of the rcx register
    and rax, 0xf ;clear all but the 4 lowest bits
    lea rsi, [codes + rax] ;take the hex digit character code from the string above

    mov rax, 1 ;'write' syscall identifier
    push rcx ;save rcx value because syscall will alter rcx and we are using it for our shift counter
    syscall ;make write call
    pop rcx ;restore rcx value after syscall
    pop rax ;restore rax value after syscall
    test rcx, rcx ;here we are comparing rcx to its self with a bitwise logical and operation
    jnz iterate ;if the zero flag is set after the test then go back to the iterate label
    ret

_start:
    mov rdi, 0x11223344556677AC ;load register we are going to read with data
    call print_hex
    call print_newline

    mov rax, 60 ;'exit' syscall instruction
    xor rdi, rdi ;setting 0 as the exit code for the exit syscall
    syscall ;call exit syscall
