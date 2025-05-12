.section .rodata



.data

    .globl a
    .align 4
    a: .long 30

    .globl b
    .align 4 
    b: .long 45

    .globl c
    .align 4
    c: .long -60

    .globl d 
    .align 4
    d: .long 25 

.text

.globl ex01

ex01:

   pushq %rbp

   movq  %rsp, %rbp



   # Seu código aqui...

    movl a, %eax
    cmpl b, %eax
    jle endif


    movl c, %eax
    negl %eax
    movl %eax, c

    movl c, %eax
    cltd
    movl $3, %ecx
    idivl %ecx 
    movl %eax, d  

endif:

    movl b, %eax
    cmpl a, %eax
    jl enfi2

    movl a, %eax
    addl b, %eax
    imull c, %eax
    movl %eax, c
    
    movl $1024, d


enfi2:
   leave

   ret