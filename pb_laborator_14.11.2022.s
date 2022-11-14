.data
    sir: .space 52
    nr_vocale .long 0
    formatstrscan .asciiz "%s"
    formatstrprint .asciiz "%d\n"
.text
.global main
main:
    push $sir
    push $formatstrscan
    call scanf
    pop %ebx
    pop %ebx
    movl $sir,%edi
    movl $0,%ecx
et_loop:
    movb(%edi,%ecx,1),%ah
    cmp $0,%ah
    je et_print
    incl %ecx
et_vocala:
    cmp $'a',%ah
    je incrementare_nrVocale
    cmp $'e',%ah
    je incrementare_nrVocale
    cmp $'i',%ah
    je incrementare_nrVocale
    cmp $'o',%ah
    je incrementare_nrVocale
    cmp $'u',%ah
    je incrementare_nrVocale
    cmp $'A',%ah
    je incrementare_nrVocale
    cmp $'E',%ah
    je incrementare_nrVocale
    cmp $'I',%ah
    je incrementare_nrVocale
    cmp $'O',%ah
    je incrementare_nrVocale
    cmp $'U',%ah
    je incrementare_nrVocale
    jmp et_loop
incrementare_nrVocale:
    incl nr_vocale
    jmp et_loop
et_print:
    push nr_vocale
    push $formatstrprint
    call printf
    pop %ebx
    pop %ebx
et_exit:
    movl $1,%eax
    movl $0,%eax
    int $0x80