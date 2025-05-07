.data



		# char c = -20

		.globl	c

		.align	1

c:	.byte	-20



		# int i = -256

		.globl	i

		.align 	4

i:	.int	-256



		# int j = 512

		.globl	j

		.align	4

j:	.int	512



		# long l = 128

		.globl	l

		.align	8

l:	.quad	128



		# unsigned short us = 111

		.globl	us

		.align	2

us:	.short	111



		# unsigned int ui = 1024

		.globl	ui

		.align	4

ui:	.int	1024



		# unsigned long ul = 2048

		.globl	ul

		.align	8

ul:	.quad	2048



#-------------------------------------------------------------------------------



.text



.globl aux

aux:

	pushq %rbp

	movq  %rsp, %rbp



	# Atribuições simples



	# j = 68000

	movl	$68000, j



	# l = 4096

	movq	$4096, l



	# i = j

	movl	j, %eax

	movl	%eax, i



	# Expressões



	# j = 10 + i - 5

	movl	$10, %ecx				# ecx = 10

	addl	i, %ecx					# ecx = 10 + i

	subl	$5, %ecx				# ecx = 10 + i - 5

	movl	%ecx, j					# j = ecx



	# i = (i * 2) - (j + 5)

	movl	i, %edx					# edx = i

	imull	$2, %edx				# edx = i * 2

	movl	j, %edi					# edi = j

	addl	$5, %edi				# edi = j + 5

	subl	%edi, %edx			# edx = edx - edi

	movl	%edx, i



	# Casts



	# ui = i  (mesmo tamanho, sinais diferentes)

	movl	i, %esi

	movl	%esi, ui



	# j = c (extensão com sinal)

	movsbl	c, %eax

	movl	%eax, j



	# ul = ui (extensão sem sinal)

	movl	ui, %edx

	movq	%rdx, ul



	# us = ul (trucamento)

	movl	ul, %eax

	movw	%ax, us



	# c = i + j (trucamento)

	movl	i, %ecx

	addl	j, %ecx					# ecx = i + j

	movb	%cl, c





	// Ponteiros



	# long *ptr

	# ptr -> r10



	# ptr = &l

	movq	$l, %r10



	# *ptr = 128

	movq	$128, (%r10)



	# int *iptr

	# iptr -> %rdx



	# iptr = &i

	movq	$i, %rdx



	# j = j + *iptr

	movl	j, %eax						# eax = j

	addl	(%rdx), %eax				# eax = j + *iptr

	movl	%eax, j



	leave

	ret