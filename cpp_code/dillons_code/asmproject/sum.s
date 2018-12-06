    .global _sum
    .text

_sum:
    xorpd %xmm0, %xmm0
    cmp $0, %rsi
    je done
next:
    addsd (%rdi), %xmm0
    add $8, %rdi
    dec %rsi
    jnz next
done:
    ret