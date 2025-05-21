/* 
 * Filename: Lab2_Part4.c
 *
 * Description: Program for our Lab 2 Part 4.
 *
 * Auhtor: AL, our textbook and  w3Resource 
 * Modification date: May 2025
 */ 

#include <stdio.h>   // printf()

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
  
  for ( int i = len-1; i >= 0; i--)
    printf("%.2x", start[i]);
  
  return;
}

// Adapted from: https://www.w3resource.com/ 
void printBinaryWithPadding(int num) {

    for (int i = sizeof(int) * 8 - 1; i >= 0; i--)
        printf("%d", (num >> i) & 1);

    return;
}

int main(int argc, char *argv[]) {

  int x = 0xDECAF000;  // "0x" means hexadecimal number
  short y = 0xCAFE;
  char z = y;

  if ( x > y ) printf("Cafe\n");

  if ( x < z ) printf("Decaf\n");

  if ( z > y ) printf("Latte\n");  

  return 0;
}
