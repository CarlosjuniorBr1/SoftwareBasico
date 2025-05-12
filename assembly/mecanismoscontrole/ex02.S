.section .rodata



.data

    .globl a 
    .align 4 
    a: .long 0 

    .globl b 
    .align 8 
    b: .quad 2 

.text

.globl ex01

ex02:

  pushq %rbp

	movq %rsp, %rbp



	# _if (a)

	cmpl $0, a					# if (a == 0) -> end_if1

	je end_if1



	# _if (b < 5)

	cmpl $5, b					# if (b >= 5) -> else_if2

	jge else_if2



	movl a, %eax					# eax = a

	shll $1, %eax				# eax = eax << 1



	movslq a, %rcx				# rcx = (long)a

	imulq b, %rcx				# rcx = rcx * b



	movslq %eax, %rax		# rax = (long)eax

	addq %rcx, %rax			# rax = rax + rcx

	movq %rax, b					# b = rax



	jmp end_if2

else_if:

	movq b, %rax					# rax = b

	xorq $0x1F, %rax			# rax = rax ^ 0x1F



	movl %eax, a					# a = (int)rax (move apenas a parte baixa)

end_if2:



end_if1:

	leave

	ret