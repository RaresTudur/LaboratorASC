.data
    x: .long 20
    y: .long 30
    operator: .long 16
    formatstring: .asciz "%s/n"
    sir1: .asciz "PASS"
    sir2: .asciz "FAIL"
.text

.global main
main:
    movl y,%eax

et_mul:
    mull operator

et_div:
    movl $0,%edx
    movl %eax,%ebx
    movl x,%eax
    divl operator

et_suntegale:
    cmp %eax,%ebx
    je et_egale

et_negale:
    push $sir1
    push $formatstring
    call printf
    pop %edx
    pop %edx
    jmp et_exit

et_egale:
    movl $4,%eax
    movl $1,%ebx
    mov sir2,%ecx
    movl $5,%edx
et_exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80
