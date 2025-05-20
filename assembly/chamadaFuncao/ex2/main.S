.section .rodata



.data

    .globl i 
    .align 4 
    i: .long 0

    .globl bias
    .align 8
    bias: .quad 256

    .globl vet
    .align 1
    vet: .byte 12, 3, 20, 8

.text



.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp



   # Seu código aqui...

    
    movl $0, i

init_while:

    cmpl $4, i
    jge  end_while

    movq $vet, %r8
    movslq i, %r9
    imulq $1, %r9
    addq  %r9 ,%r8 

    movb (%r8), %dil

    movw $10, %si
    movq bias, %rdx 
    
    call filtro
    movq %rax, bias


    incl i
    jmp init_while

end_while:


   # Faça o "return"
    movl $0, %eax


   leave

   ret