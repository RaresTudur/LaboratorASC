.data
    v: .long 21,31,42,50,60
    n: .long 5
    medie_aritmetica: .long 0
    cat: .long 0
    numar: .long 0
    format_printf: .asciiz "Media aritmetica este %d si %d elemente sunt egale cu media\n"
.text
.global main
main:
    lea v,%edi
    xorl %ecx,%ecx
    cmp n,%ecx
    je et_0
    xor %eax,%eax

et_suma_elementelor:
    cmp n,%ecx
    je et_medie_aritmetica
    movl (%edi,%ecx,4),%ebx
    add %ebx
    incl %ecx
    jmp et_suma_elementelor

et_medie_aritmetica:
    xorl %edx,%edx
    divl n
    xorl %ecx,%ecx #resetat contor
    movl %eax,medie_aritmetica
    xor %eax,%eax

et_cat:
    cmp n, %ecx
    je et_printf
    movl (%edi,%ecx,4),%eax
    cmp medie_aritmetica,%eax
    je et_egale
    incl %ecx
    jmp et_cat

et_egale:
    incl numar
    jmp et_cat

et_printf:
    push numar
    push medie_aritmetica
    push $format_printf
    call printf
    pop %ebx
    pop %ebx
    pop %ebx
    jmp et_exit

et_0:
    push numar
    push medie_aritmetica
    push $format_printf
    call printf
    pop %ebx
    pop %ebx
    pop %ebx

et_exit:
    movl $1,%eax
    xor %ebx,%ebx
    int $0x80