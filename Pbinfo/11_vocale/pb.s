.data
    sir: .space 22
    formatstringscan: .asciz "%s"
    formatstringprint: .asciz "%s"
.text
.global main
main:
    push $sir
    push $formatstringscan
    call scanf
    pop %ebx
    pop %ebx
    push $0
    call fflush
    pop %ebx
    lea sir, %edi
    movl $0, %ecx
et_loop:
    movb (%edi,%ecx,1),%ah
    cmp $0,%eax
    je et_print
verifi:
    cmp $'a',%ah
    je tran_A
    cmp $'e',%ah
    je tran_E
    cmp $'i',%ah
    je tran_I
    cmp $'o',%ah
    je tran_O
    cmp $'u',%ah
    je tran_U
    incl %ecx
    jmp et_loop
tran_A:
    xor $32,%ah
    mov %ah,sir(,%ecx,1)
    incl %ecx
    jmp et_loop
tran_E:
    xor $32,%ah
    mov %ah,sir(,%ecx,1)
    incl %ecx
    jmp et_loop
tran_I:
    xor $32,%ah
    mov %ah,sir(,%ecx,1)
    incl %ecx
    jmp et_loop
tran_O:
    xor $32,%ah
    mov %ah,sir(,%ecx,1)
    incl %ecx
    jmp et_loop
tran_U:
    xor $32,%ah
    mov %ah,sir(,%ecx,1) 
    incl %ecx
    jmp et_loop
et_print:
    movl $0,%ecx
    push sir
    push $formatstringprint
    call printf
    pop %ebx
    pop %ebx
    push $0
    call fflush
    pop %ebx
et_exit:
    movl $1,%eax
    xor %ebx,%ebx
    int $0x80