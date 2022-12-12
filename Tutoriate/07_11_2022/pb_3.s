.data
    sir: .space 100
    formatScanf: .asciz "%s"
    formatPrintf: .asciz "%s\n"
.text
.global main
main:
    # citirea sirului
    push $sir
    push $formatScanf
    call scanf
    pop %ebx
    pop %ebx
    xorl %ecx,%ecx
    lea sir,%edi
for:
    movb (%edi,%ecx,1),%ah
    cmp $0,%ah
    je printare
    cmpb $96,%ah
    jg transformare
    for_next:
        incl %ecx
        jmp for
    
transformare:
    cmpb $122,%ah
    jg for_next
    subl $32,(%edi,%ecx,1)
    jmp for_next

printare:
    push $sir
    push $formatPrintf
    call printf
    pop %ebx
    pop %ebx

et_exit:
    movl $1,%eax
    xorl %ebx,%ebx
    int $0x80
