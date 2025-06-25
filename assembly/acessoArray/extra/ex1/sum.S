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
    movl $0, %ecx


init_while: 

    cmpl $4, %ecx
    jge endwhile

    movq $nums, %rdx
    movslq %ecx, %r8
    imulq $4, %r8
    addq %rdx, %r8

    movl (%r8), %eax, 
    addl  %eax, s 

    
    incl %ecx
    jmp init_while

endwhile


    leave

    ret