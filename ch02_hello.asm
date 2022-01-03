global _start

section .data
message: db'hello, world!', 10 ; the 10 at the end is the ASCII code for a new line. db means byte data.

section .text
_start:
    mov	rax, 1	;system call number should be stored in rax
    mov	rdi, 1	;argument #1 in rdi: where to write (file descriptor / stdout)
    mov	rsi, message	;argument #2 in rsi: where the string to write starts
    mov	rdx, 14	;argument #3 in rds: how many bytes to write
    syscall	;this instruction invokes a system call

    mov	rax, 60	;'exit' syscall number
    xor rdi, rdi	; sets the exit code to 0
;    mov	rdi, 1	;an experiment to return a non zero result code
    syscall
