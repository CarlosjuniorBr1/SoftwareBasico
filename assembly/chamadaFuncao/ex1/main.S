.section .rodata

   fmt: .string "Hello" 


.data


   .globl val
   .align 4
   val: .long 432

   .globl age
   .align 2 
   age: .short 4

   .globl r 
   .align 4
   r: .long 0 

   .globl err
   .align 8
   err: .quad 2048


.text



.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   # Seu código aqui...
   
   movq $fmt, %rdi
   movl val, %esi
   movw age, %dx
   movq $r, %rcx

   call sum 

   movl %eax, val

   movl %eax, %ecx


   movq err, %rdi
   movl val, %esi
   movq  r,  %rdx

   call show

   movl $0, %eax


   # Faça o "return"

   leave

   ret