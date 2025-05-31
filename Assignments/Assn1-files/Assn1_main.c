/* 
 * Filename: Assn1_main.c
 *
 * Description: Test driver for Assn1_Q3.c
 *
 * Authors: AL + <your name>
 * Student number: <your student number>
 * Date: May 2025
 */
 
#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer, size_t);
void show_bytes_2(byte_pointer, size_t);
void show_bits(int);
void show_int(int);
void show_float(float);
void show_pointer(void *);
int  mask_LSbits(int);

int main() {
    int ival = 12345;
    float fval = (float) ival;
    int *pval = &ival;

    printf("\nshow_int(inval) test:\n");
    show_int(ival);

    printf("\n\nshow_float(fval) test:\n");
    show_float(fval);

    printf("\n\nshow_pointer(pval) test:\n");
    show_pointer(pval);

/* Add your test cases here in order
   to test the functions you have modified 
   and the functions you have created. */
    
    int bitval1 = 12345;
    int bitval2 = -12345;

    printf("\n\n\nshow_bits() test 1:\n");
    show_bits(bitval1);
    
    printf("\nshow_bits() test 2:\n");
    show_bits(bitval2);
    
    printf("\n\n\nmask_LSbits( sizeof(int) *8 ) invalid test wordsize:\n");
    int mask = sizeof(int) *8;
    show_bits(mask_LSbits(mask));

    printf("\nnmask_LSbits(( sizeof(int) *8 ) + 4) invalid test wordsize:\n");
    mask = (sizeof(int) *8)+4;
    show_bits(mask_LSbits(mask));
    
    printf("\nmask_LSbits(-1000) invalid test :\n");
    mask = -1000;
    show_bits(mask_LSbits(mask));
    
    printf("\nmask_LSbits(0) invalid test :\n");
    mask = 0;
    show_bits(mask_LSbits(mask));


    printf("\nmask_LSbits(1) test :\n");
    mask = 1;
    show_bits(mask_LSbits(mask));
    
    printf("\nmask_LSbits(1000) test :\n");
    mask = 1000;
    show_bits(mask_LSbits(mask));

    return 0;

}
