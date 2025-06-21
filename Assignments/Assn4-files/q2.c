#include <stdio.h>

/*

assembly code:

    # long func(long x, int n)
    func:
    movl  %esi, %ecx
    movl  $1,   %edx
    movl  $0,   %eax
    jmp   cond
    loop:
    movq  %rdi, %r8
    andq  %rdx, %r8
    orq   %r8,  %rax
    salq  %cl,  %rdx    # shift left the value stored in %rdx by an amount 
                        # dictated by the value stored in %cl - see Note below
    cond:
    testq %rdx, %rdx
    jne   loop       
    ret

*/

long func(long x, int n) {
    /*
    Registers in use:
        rdi = edi = x
        rsi = esi = n
        rax = eax = result
        
        rdx = edx = mask
        rcx = ecx = cl
        r8 = r8d
    */ 
    
    // movl  %esi, %ecx     # ecx -> esi -> n
    // movl  $0,   %eax     # eax -> result -> 0
    
    long result = 0;
    long mask;
    
    // movl  $1,   %edx     # edx -> mask -> 1
    // testq %rdx, %rdx     # rdx & rdx = rdx = mask, used to set flags 
    // jne   loop           # jump to loop if ne is set. mask is not zero
    for (mask = 1; mask != 0 ; mask = mask << n ){
    // movq  %rdi, %r8      # r8 -> rdi -> x
    // andq  %rdx, %r8      # r8 -> r8 & rdx -> r8 = x & mask
    // orq   %r8,  %rax     # rax -> rax combined with r8 , so result |= r8 
    // salq  %cl,  %rdx     # rdx << cl -> mask << n

        result |= (x & mask);
    }
    return result;
}
