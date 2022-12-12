.data
    sir: .asciz "wefme pym dsvvs"
    formatPrintf: .asciz "%s\n"
.text
.global main
main:
    lea sir,%edi
    xorl %ecx,%ecx
for:
    movb (%edi,%ecx,1),%ah
    cmp $0,%ah
    je printare

    # verific daca este litera mica
    cmpb $96,%ah
    jle for_next
    cmpb $123,%ah
    jge for_next

    subb $4,%ah
    cmpb $96,%ah
    jle modificare_alfabet


    modificare_sir:
                movb %ah,(%edi,%ecx,1)
                jmp for_next

    modificare_alfabet:
                movb $96,%bh # 96 de fapt se afla in bl
                subb %ah,%bh
                movb %bh,%ah
                movb $122,%bh
                subb %ah,%bh
                movb %bh,%ah
                jmp modificare_sir
    for_next:
        incl %ecx
        jmp for

printare:
    push $sir
    push $formatPrintf
    call printf
    pop %edx
    pop %edx

    pushl $0
    call fflush
    popl %ebx

et_exit:
    movl $1,%eax
    xorl %ebx,%ebx
    int $0x80
    


