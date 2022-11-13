.data
    x: .long 10
    y: .long 3
    rez: .space 4
.text
.global main
main:
    movl x,%eax
    movl y,%ebx
    movl $16,%ecx
et_div:
    movl $0,%edx
    divl %ecx #in %eax avem acum x/16
et_mul:
    movl %eax,%edx
    movl %ebx,%eax
    mul %ecx
et_adunare:
    add %ebx,%eax
    movl %eax, rez
et_exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80