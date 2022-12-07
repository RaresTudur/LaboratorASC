#procedura max3, care sa calculeze maximul a 3 numere

.data
    x: .long 3
    y: .long 4
    z: .long 5
    max: .long 0
    format_printf: .asciiz "%d\n"

.text
.global main

main:
    push x
    push y
    push z
    call max3
    pop %ebx
    pop %ebx
    pop %ebx
    movl %eax,max

max3:
    push %ebp
    mov %esp, %ebp
    push %ebx

    mov 8(%ebp),%eax #x
    mov 12(%ebp),%ebx #y
    mov 16(%ebp),%edx #z

    cmp %eax,%ebx
    jg et_yz
    jmp et_xz

    et_xz:
        cmp %edx,%eax
        jl max_z

    et_yz:
        cmp %edx,%ebx
        jl max_z
    max_z:
        movl %edx,%eax
        jmp et_exit_max3

    max_y:
        movl %ebx,%eax
        jmp et_exit_max3
    
    et_exit_max3:
        pop %ebx
        pop %ebp
        ret

et_printf:
    push max
    push $format_printf
    call printf
    pop %ebx
    pop %ebx

et_exit:
    movl $1,%edx
    xor %ebx,%ebx
    int 0x80

