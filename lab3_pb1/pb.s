.data
    v: .long 5,13,27,11,19,32,21
    n: .long 7
    formatstr: .asciz "%d\n"
.text
.global main
main:
    movl $0,%eax
    movl $0,%ecx
    movl $0,%edx
et_maxi:
    cmp n,%ecx
    je print_maxi
    movl $v,%edi
    movl (%edi,%ecx,4),%ebx
    incl %ecx
    cmp %edx,%ebx
    jg swap
    jmp et_maxi
swap:
    movl %ebx,%edx
    incl %ecx
    jmp et_maxi
print_maxi:
    push %edx
    push $formatstr
    call printf
    pop %ebx
    pop %ebx
p_number_of_ap:
    movl $0,%ecx
    movl $0,%edx
    movl %ebx,%eax
    jmp for_noa
number_of_ap:
    incl %edx
    incl %ecx
for_noa:
    cmp n,%ecx
    je print_number
    movl $v,%edi
    movl (%edi,%ecx,4),%ebx
    cmp %ebx,%eax
    je number_of_ap
    incl %ecx
    jmp for_noa
print_number:
    push %edx
    push $formatstr
    call printf
    pop %ebx
    pop %ebx
et_exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80

