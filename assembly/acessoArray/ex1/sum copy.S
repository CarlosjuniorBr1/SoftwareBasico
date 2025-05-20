.data

    .globl s
    .align 4
    s: .long 0 


    .globl nums
    .align 4 
    nums: .long 65, -105, 111, 34

.text



.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp

    # Seu código aqui...
    
    # i = 0
    movl $0, %eax

comeco_while:

    cmpl $4, %eax
    jge end_while

    movq $nums, %rdx
    movslq %eax, %rcx
    imulq  $4, %rcx
    addq   %rdx, %rcx
    movl   (%rcx), %ecx

    addl %ecx, s 

    incl %eax 

    jmp comeco_while 


end_while:


    leave

    ret