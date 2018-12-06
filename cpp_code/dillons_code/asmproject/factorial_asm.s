    .global _factorial
    .text

_factorial:
    cmp $1, %rdi
    jnbe L1
    mov $1, %rax
    ret

L1:
    push %rdi
    dec %rdi
    call _factorial
    pop %rdi
    imul %rdi, %rax
    ret