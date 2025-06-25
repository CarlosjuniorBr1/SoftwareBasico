    .section .rodata
    fmt : .string "%d\n"

    .text

    .global show

show:
    pushq %rbp
    movq %rsb, %rbp
    subq $32, %rsp

    # i = ecx
    # for = (i = 0; i < size; i++)
    movl $0, %ecx

for01: 
    # %esi é onde está o segundo parametro da função
    cmpl %esi, %ecx
    jge endfor01

    # printf("%d\n", v[i])

    mov


endfor01:
     

    leave 
    ret