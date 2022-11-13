.data
    formatstr: .asciz "%d"
    v: .long 7,4,9,6,2
    n: .long 5
    ultimelem: .long 0
.text
.global main
main:
    movl $v,%edi
    movl n,%ecx
    decl %ecx
    movl (%edi,%ecx,4),%ebx
    movl %ebx,ultimelem
    movl $0,%ecx

parcurgere_vector:
    cmp n,%ecx
    je et_exit
    movl $0,%edx
    movl $v,%edi
    movl (%edi,%ecx,4),%eax
    movl %eax,%ebx
    incl %ecx
    divl ultimelem
    test %edx,%edx
    jz eprint
    jmp parcurgere_vector

eprint:
    push %ebx
    push $formatstr
    call printf
    pop %ebx
    pop %ebx
    jmp parcurgere_vector

et_exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80
