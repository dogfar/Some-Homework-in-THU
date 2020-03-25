# Created By @dogfar
# 8/26/2019

.section .data
.equ LF, 0x0A
.equ NULL, 0
.equ TRUE, 1
.equ FALSE, 0
.equ EXIT_SUCCESS, 0  
.equ FAIL_TO_CALL, -1 
.equ STDIN, 0        
.equ STDOUT, 1      
.equ STDERR, 2        
.equ SYS_read, 0      
.equ SYS_write, 1     
.equ SYS_open, 2      
.equ SYS_close, 3    
.equ SYS_fork, 57     
.equ SYS_exit, 60     
.equ SYS_creat, 85    
.equ SYS_time, 201    
.equ O_CREAT, 0x40
.equ O_TRUNC, 0x200
.equ O_APPEND, 0x400
.equ O_RDONLY, 000000 
.equ O_WRONLY, 000001 
.equ O_RDWR, 000002   
.equ S_IRUSR, 0x100
.equ S_IWUSR, 0x80
.equ S_IXUSR, 0x40

err_msg1:
	.ascii "Cannot Open the file.\n\0"
err_msg1_len = . - err_msg1 - 1

err_msg2:
	.ascii "Stack Overflow or Cannot Read Character.\n\0"
err_msg2_len = . - err_msg2 - 1


.section .bss
.equ BUF_SIZE, 30
.lcomm BUF_ADD, 30


.text
.globl getline
.type getline, @function

getline:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %r10
	subq $0x1, %rsi
read:
	addq $0x1, %rsi
	movq $SYS_read, %rax
	movq $1, %rdx
	syscall
	cmpq $0, %rax
	je getline_success
	jl getline_error
	cmpb $LF, (%rsi)
	jne deal
	je getline_success

deal:
	cmpq $BUF_SIZE, %r10
	je getline_error
	incq %r10
	jmp read

getline_error:
	movq $-1, %rax
	popq %rbp
	retq

getline_success:
	movq %r10, %rax
	popq %rbp
	retq



.text
.globl _start
_start:
	movq %rsp, %rbp
	subq $64, %rsp

input_open:
	movq $SYS_open, %rax
	movq 16(%rbp), %rdi
	movq $O_RDONLY, %rsi
	syscall
	cmpq $0, %rax
	jl fail_open
	movq %rax, -8(%rbp)

output_open:
	movq $SYS_open, %rax
	movq 24(%rbp), %rdi
	movq $O_WRONLY, %rsi
	syscall
	cmpq $0, %rax
	jl fail_open
	movq %rax, -16(%rbp)
	movq $0, %r9

read_input:
	movq -8(%rbp), %rdi
	movq $BUF_ADD, %rsi
	movq $BUF_SIZE, %rdx
	call getline
	incq %r9
	cmpq $0, %rax
	jl fail_exit
	jg read_input

stack_init:
	decq %r9
	movq %r9, %rax
	movq $0, %rcx
	movq $0, %rdx
	movq $10, %rbx

answer_push:
	cmpq $10, %rax
	jb solve_last
	div %rbx
	addq $48, %rdx
	pushq %rdx
	movq $0, %rdx
	incq %rcx
	jmp answer_push

solve_last:
	addq $48, %rax
	pushq %rax
	incq %rcx

write_answer_to_output_file:
	movq -16(%rbp), %rdi
	movq $SYS_write, %rax
	movq %rsp, %rsi
	salq $3, %rcx
	movq %rcx, %rdx
	syscall

close_file:
	movq $SYS_close, %rax
	movq -16(%rbp), %rdi
	syscall
	movq $SYS_close, %rax
	movq -8(%rbp), %rdi
	syscall

exit:
	movq $SYS_exit, %rax
	movq $EXIT_SUCCESS, %rdi
	syscall

fail_open:
	movq $SYS_write, %rax
	movq $STDERR, %rdi
	movq $err_msg1_len, %rdx
	movq $err_msg1, %rsi
	syscall
	movq $SYS_exit, %rax
	movq $FAIL_TO_CALL, %rdi
	syscall

fail_exit:
	movq $SYS_write, %rax
	movq $STDERR, %rdi
	movq $err_msg2_len, %rdx
	movq $err_msg2, %rsi
	syscall
	movq $SYS_exit, %rax
	movq $FAIL_TO_CALL, %rdi
	syscall


