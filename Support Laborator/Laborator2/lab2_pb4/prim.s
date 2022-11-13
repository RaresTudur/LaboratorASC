.data
    x: .long 11
    prim1: .asciz "Numarul este prim\n"
    prim2: .asciz "Numarul nu este prim\n"
.text
.global main
main:
    movl x,%eax
    movl $2,%ecx
    movl $0,%ebx
prim:
    cmp %ecx,%eax
    je eprim
    movl %ebx,%edx
    divl %ecx
    cmp %edx,%ebx 
    je nprim 
    incl %ecx
    movl x,%eax
    jmp prim
eprim:
    movl $4,%eax
    movl $1,%ebx
    movl prim1,%ecx
    movl $22,%edx
    jmp et_exit
nprim:
    movl $4,%eax
    movl $1,%ebx
    movl prim2,%ecx
    movl $19,%edx
et_exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80
