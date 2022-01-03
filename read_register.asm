global _start

section .data
codes: db '0123456789ABCDEF' ;this is a consecutive list of characters in memory. we will use address arithmetic to save the proper character into the register for the write syscall.

section .text
_start:
    
    mov rax, 0x112233445566EEFF ;storing data into a register that we will print the value of.

    mov rdi, 1 ;initialize variable. this is used for the write sys calls for the stdout file descriptor.
    mov rdx, 1 ;initialize variable. this is used for the write sys call for the number of bytes to write which for this program will always be 1.
    mov rcx, 64 ;initialize variable. this is the length of the register we will be reading. rax is 64 bits.

.loop: ;this label is where we will loop until rcx is zero.
    push rax ;save current value of rax into stack.
    sub rcx, 4 ;subtract 4 from rcx (our register length variable) and store the result in rcx. 4 bits would be one hexidecimal digit.

    sar rax, cl ;shift right. we shift right to set the right most 4 bits to the value to print in this loop iteration.
    ; cl is a register, smallest part of rcx 
    ; rax -- eax -- ax -- ah + al 
    ; rcx -- ecx -- cx -- ch + cl
    and rax, 0xf ;and rax value with 0xf or 0b1111 so that the next heidecimal digit is isolated.

    lea rsi, [codes + rax] ;load the heidecimal digit to print into rsi.
    ;this is done by adding the codes address to the isolated hex digit. this gives us the single char that is the text representation of the hex digit.
    mov rax, 1 ;moving 1 into rax to do a write sys call.

    push rcx ;pushing rcx to stack to save value.
    syscall ; write call to print current hex digit to given file descriptor.
    pop rcx ;restore value of rcx from stack.

    pop rax ;restore value of rax from the stack.

    test rcx, rcx ;check if rcx is zero. if it is then we have read the whole register and we are done.
    jnz .loop ;if rcx was not zero then we loop back up to the label above.

    mov rax, 60 ;loading 60 into rax for the exit sys call.
    xor rdi, rdi ; should always store 0 in rdi for our exit code.
    syscall ; exit call to end program.