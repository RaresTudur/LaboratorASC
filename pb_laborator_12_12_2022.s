# adresa email = bogdan_macovei.fmi@gmail.com
# Sa se scrie o procedura care sa  determine cate elem dintr un array sunt egale cu maximul
# Se va face un call din aceasta proc la o  alta proc care determina maximul dintr-un array
.data
    v: .space 400
    n: .space 4
    formatPrintf: .asciz "%d\n"
    formatScanf: .asciz "%d"
.text
.global main

maxim_array:
    push %ebp
    movl %esp,%ebp
    xorl %edx,%edx
    pushl %edi
    pushl %ebx
    movl 8(%ebp),%edi
    movl 12(%ebp),%ebx # ebx = n
    xorl %ecx,%ecx
    for_maxim_array:
        cmp %ebx,%ecx
        je for_maxim_exit
        movl (%edi,%ecx,4),%eax
        cmp %edx,%eax
        jg schimbare_maxim
        jmp for_next_maxim
    schimbare_maxim:
        movl %eax,%edx
    for_next_maxim:
        incl %ecx
        jmp for_maxim_array
    for_maxim_exit:
        # restaurarea registrilor
        pop %ebx
        pop %edi
        pop %ebp


egal_maxim:
    push %ebp
    movl %esp,%ebp
    push %ebx
    push %edi
    subl $4,%esp # variabila pt numarul de numere egale cu maximul
    movl 8(%ebp),%edi
    movl 12(%ebp),%ebx # ebx = n
    aflare_maxim:
        pushl %edi
        pushl %ebx
        call maxim_array # edx = maxim
        addl $8,%esp
    xorl %ecx,%ecx
    for:
        cmp %ebx,%ecx
        je for_exit
        movl (%edi,%ecx,4),%eax
        cmp %edx,%eax
        je adunare
        jmp for_next
    adunare:
        incl -4(%esp)
    for_next:
        incl %ecx
        jmp for
    for_exit:
        movl -4(%esp),%eax
        addl $4,%esp
        pop %edi
        pop %ebx
        pop %ebp
main:
    et_scan_n:
        pushl $n
        push $formatScanf
        call scanf
        addl $8,%esp
    lea v,%edi
    xorl %ecx,%ecx
    et_scan_array:
        cmp n,%ecx
        je scan_exit
        movl (%edi,%ecx,4),%eax
        pushl %ecx
        pushl %eax
        push $formatScanf
        call scanf
        pop %ecx
        addl $8,%esp
        incl %ecx
        jmp et_scan_array
    scan_exit:
        pushl n
        push $v
        call egal_maxim
        addl $8,%esp
    afisare:
        pushl %edx
        push $formatPrintf
        call printf
        addl $8,%esp
    et_exit:
        movl $1,%eax
        xorl %ebx,%ebx
        int $0x80
