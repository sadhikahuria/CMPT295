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

    printf("\nshow_float(fval) test:\n");
    show_float(fval);

    printf("\nshow_pointer(pval) test:\n");
    show_pointer(pval);

/* Add your test cases here in order
   to test the functions you have modified 
   and the functions you have created. */
    
    int bitval1 = 12345;
    int bitval2 = -12345;

    printf("\nshow_bits() test 1:\n");
    show_bits(bitval1);
    
    printf("\nshow_bits() test 2:\n");
    show_bits(bitval2);

    return 0;

}
