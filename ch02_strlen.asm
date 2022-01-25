global _start

section .data

test_string: db "abcdefghijklmnopqrstuvwxyz",0

section .text

strlen: ; adhearing to convention rdi is our first and only parameter
    xor rax, rax ;make sure rax is zeroed out because its the index we are using to loop over the string
.loop:
    cmp byte[rdi+rax], 0 ;check if the current index of the string is the null terminator
                         ;the byte modifier is very important because it tells
                         ;cmp that we are comparing 0 (null) to the next byte of the string only.
                         ;we need to specify this because we dont know how long the string is, 
                         ;and we need to evaluate one
                         ;byte at a time to check for the null terminator.
    je .end ;Jump to the end if we found the null terminator
    inc rax ; otherwise increment rax and jump to loop again
    jmp .loop
.end:
    ret

_start:
    mov rdi, test_string ;using rdi per convention to store the parameter to our strlen function.
                         ;rdi will contain the address of the start of test_string
    call strlen
    mov rdi, rax ;here we are setting the exit code to the length of the string.
                 ;on a bash terminal we can run $? to see the previous exit code.

    mov rax, 60 ;setting rax 60 'exit' code for sys call
    syscall