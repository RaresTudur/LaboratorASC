.data
    a: .long 3
    b: .long 7
    c: .long 4
    min: .space 4
    formatstr: .asciz "%d\n"
.text
.global main
main:
    movl a,%eax
    movl b,%ebx
    movl c,%edx
    cmpl %eax,%ebx
    jl l_b
l_a:
    cmpl %eax,%edx
    jl min_c
min_a:
    movl %eax,min
    jmp eprint
l_b:
    cmpl %ebx,%edx
    jl min_c
min_b:
    movl %ebx,min
    jmp eprint
min_c:
    movl %edx,min
eprint:
    push min
    push $formatstr
    call printf
    pop %eax
    pop %eax
et_exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80