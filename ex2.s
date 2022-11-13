.data
    s: .space 12
.text
.global main
main:
    jmp read
read:
    movl $3,%eax
    movl $0,%ebx
    movl $s,%ecx
    movl 12,%edx
    int $0x80
write:
    movl $4,%eax
    movl $1,%ebx
    movl $s,%ecx
    movl 12,%edx
    int $0x80
exit:
    movl $1,%eax
    movl $0,%ebx
    int $0x80

