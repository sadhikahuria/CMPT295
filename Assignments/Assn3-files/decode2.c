#include  <stdio.h>

// for the function prototype
long decode2(long x, long y, long z){

// gcc generates the following assembly code:

// decode2:
    // subq %rdx %rsi
    // imulq %rsi $rdi
    // movq %rsi, %rax
    // salq $63, %rax
    // sarq #63 %rax
    // xorq %rdi, %rax
    //ret

// Parameters x, y, and z are passed in registers %rdi, %rsi, and %rdx. 
// The code stores the return value in register %rax.

// Write C code for decode2 that will have an effect equivakent to the assembly code shown.

// rdi = x
// rsi = y
// rdx = z

    y = y - z;
    x = x * y;
    long ret = y;
    
    ret = ret << 63; 
    ret = ret >> 63;

    ret = ret ^ x;

    return ret;
}

