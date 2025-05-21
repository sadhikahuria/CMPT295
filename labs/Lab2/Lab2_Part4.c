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
  // 32 bit = 4 bytes
  short y = 0xCAFE;
  // 16 bit = 2 bytes
  char z = y;
  // 8 bit = 1 byte

  // x = DECA F000 -> negative 
  // y = CAFE -> negative
  // x = FE -> negative

  printf("x = %d\ny = %d\nx = %d\n\n", x, y, z);

  printf("x as unsigned: %u\nx as singed: %d\n", (unsigned int)x, (signed int)x);
  printf("y as unsigned: %u\ny as singed: %d\n", (unsigned int)y, (signed int)y);
  printf("z as unsigned: %u\nz as singed: %d\n\n", (unsigned int)z, (signed int)z);



  if ( (short)x > y ) printf("Cafe\n"); 

  // comparing int and short, short is promoted to an int

  if ( (char)x < z ) printf("Decaf\n");
  // comparing int and char, char is compared as it

  if ( z > (unsigned short)y ) printf("Latte\n");  
  // comparing char and short, char is promoted to int, short is promoted to int

  return 0;
}
