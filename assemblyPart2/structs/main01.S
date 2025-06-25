.section .rodata
fmt: .string "color: %ld, filled: %d\n";
.data

    .globl c1
    .align 8
    c1: 
        .int 0   # +0  x 
        .int 0   # +4  y
        .byte 0  # + 8  filled
        .zero 7  #padding
        .quad 0  # +16  color

    .text

.globl main
main:

        pushq %rbp
        movq %rsp, %rbp

        movq $c1, %r8
        movl $10, (%r8)
        
        #c1.y = 2*c1.x
        movl (%r8), %eax
        imull $2, %eax
        movl %eax, 4(%r8)

        #c1.filled = 1;
        movb $1, 8(%r8) 

        //if ci.y > 15
        cmpl $15, 4(%r8)
        jle else

        movq $2 , 16(%r8)
else:
        movq $1, 16(%r8)

end_if:

    # printf("color: %ld, filled: %d\n", c1.color, (int)c1.filled);
    movq $fmt, %rdi
    movq 16(%r8), %rsi
    movsbl 8(%r8), %edx

    movl $0, %eax
    call printf 

    #return 0   
     movl $0, %eax




    leave
    ret