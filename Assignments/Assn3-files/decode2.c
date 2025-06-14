/*
Name: Sadhika Huria
Student Number: 301599274
Date: June 13. 2025
CMPT 295 
*/

// for the function prototype
// long decode2(long x, long y, long z);


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

#include  <stdio.h>

long decode2(long x, long y, long z){

    y = y - z; // subtract rdx val from rsi, store it in rsi
    x = x * y; // multiply rsi val by rdi, store it in rdi
    long ret = y; // copy y into ret (rax)
    
    ret = ret << 63; // shift ret left 63 bits
    ret = ret >> 63; // shift ret right 63 bits

    ret = ret ^ x; // xor comparsion with ret and original x*(y-z).

    return ret; // return val
}


int main(){
    long x = 2, y = 4, z = 5;
    // x*(y-z) = -2, y-z = -1;
    long result = decode2(x, y, z);
    printf("result: %ld\n", result);

    long x2 = 3, y2 = 3, z2 = 5;
    // x*(y-z) = -6, y-z = -2;
    long result2 = decode2(x2, y2, z2);
    printf("result2: %ld\n", result2);

    long x3 = 4, y3 = 6, z3 = 2;
    // x*(y-z) = 16, y-z = 4;
    long result3 = decode2(x3, y3, z3);
    printf("result3: %ld\n", result3);
        
    long x4 = 2, y4 = 5, z4 = 2;
    // x*(y-z) = 6, y-z = 3;
    long result4 = decode2(x4, y4, z4);
    printf("result4: %ld\n", result4);

    // if abs(y-z) is even or 0, ret is x*(y-z)
    // if abs(y-z) is odd, ret is one's complement of x*(y-z) or ~(x*(y-z))
    return 0;

}