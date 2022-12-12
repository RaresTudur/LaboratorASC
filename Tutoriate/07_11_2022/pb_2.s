.data
    x: .space 4
    formatScanf: .asciz "%d"
    formatPrintf: .asciz "%d\n"
.text
.global main
main:
    # citire lui x
    pushl $x
    pushl $formatScanf
    call scanf
    popl %ebx
    popl %ebx
    xorl %ebx,%ebx
    movl x,%ecx

for:
    cmp $1,%ecx
    jmp et_exit

    # verific x este par
    movl %ecx,%eax # mut x in eax
    movl $2,%ebx
    xorl %edx,%edx
    divl %ebx

    cmp $0,%edx
    jmp par

    movl $3,%eax
    xorl %edx,%edx
    mull %ecx
    movl %eax,%ecx
    incl %ecx
    jmp printare

    par:
        movl %eax,%ecx

    printare:
        push %ecx
        push $formatPrintf
        call printf
        popl %ebx
        popl %ecx
        pushl $0
        call fflush
        popl %ebx
        jmp for

et_exit:
    movl $1,%eax
    xorl %ebx,%ebx
    int $0x80
