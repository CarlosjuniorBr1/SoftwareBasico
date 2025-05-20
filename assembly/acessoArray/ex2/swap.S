.data

    .globl last 
    .align 8 
    last: .quad 0 

    .globl values
    .align 8 
    values: .quad 50, -10, 60, -20, 70

.text



.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp

    # Seu código aqui...

    # i  == %ecx   j == %edx

    # i = 0  e j = 4 
    movl $0, %ecx
    movl %4, %edx

begin_for:
    
    cmpl %ecx, %edx
    jge end_for

    

    movq $last, %rdx
    movslq %ecx, %r8
    imulq $8, %r9
    addq %rdx, %r8
    
    #tmp rcx 

    incl %ecx
    incl %edx 

end_for: 


    leave

    ret