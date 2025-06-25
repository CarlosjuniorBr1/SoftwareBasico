.data

    .globl vet
    .align 2
    vet: .word 50, 10, 67, 42


    .globl max
    .align 2 
    max: .word 0 

.text



.globl ex01

ex01:

    pushq %rbp

    movq  %rsp, %rbp



    # Seu código aqui...
    # i -> %ecx
    movb $0, %cl

initw: 
        cmpb  $4, %cl
        jge  endw

        movq $vet,  %rdi
        movsbq %cl, %r8
        imulq $2, %r8
        addq  %rdi, %r8

        movw (%r8), %dx


        cmpw max, %dx
        jle  endif

        movw %dx, max

    endif: 

        incb %cl
        jmp initw
        
endw:


    leave

    ret