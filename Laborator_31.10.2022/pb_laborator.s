.data 
    v: .long 5,13,27,11,19,32,21
    n: .long 7
    formatstr: .asciz "%d"
.text
.global main
main:
    movl 0,%eax
    movl 0,%ecx
et_for:
    cmp n,%ecx
    je et_printf
    movl $v,%edi
    movl (%edi,%ecx,4),%ebx
    inc %ecx
    cmp %eax,%ebx
    jg et_swap

et_swap:
    movl %ebx,%eax
    jmp et_for

et_printf:
    push %ebx
    push $formatstr
    call printf
    pop %ebx
    pop %ebx

et_exit:
    mov $1,%eax
    mov $0,%ebx
    int $0x80