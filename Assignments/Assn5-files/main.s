xorq    %rax, %rax
xorl    %eax, %eax
movq    $0, %rax
movl    $0, %eax
subl    %eax, %eax
imull   $0, %eax
andl    $0, %eax


addl    $1, %eax
leal    1(%eax), %eax
incl    %eax
subl    $-1, %eax

addl    $8, %eax
leal    8(%eax), %eax

subq    $8, %rsp
movq    %rdi, (%rsp)
pushq   %rdi

movq    (%rsp), %rsi
addq    $8, %rsp
popq    %rsi

