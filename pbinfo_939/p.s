.data
    x: .long 12
    y: .long 20
.text
.global main
main:
    movl x,%eax
    movl y,%ebx
    add %eax,%ebx
et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80 