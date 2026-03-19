/* 
 * Filename: Lab2_Part3.c
 *
 * Description: Program for our Lab 2 Part 3.
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

  int signedInt = 0b10001000100010001000100010001000; // "0b" means binary number

  // Instruction: Replace the underscore characters __ with the proper format specifier
  // in the following C statement then uncomment it. Compile and execute.
  printf("\nBinary representation of %d is '0b", signedInt);
  printBinaryWithPadding(signedInt);
  printf("'\n\n");

  // Instruction: Replace the underscore characters __ with the proper format specifier
  // in the following C statement then uncomment it. Compile and execute.
  printf("Hexadecimal representation of %d is ", signedInt);
  printf("'0x");
  show_bytes((byte_pointer) &signedInt, sizeof(int)); 
  printf("'\n\n");

  // Instruction: Replace the underscore characters __ with the proper format specifier
  // in the following two C statements then uncomment them. Compile and execute.
  printf("Signed integral representation of %d is '%i'\n\n", signedInt, signedInt);
  printf("Unsigned integral representation of %d is '%u'\n\n", signedInt, signedInt);

  return 0;
}
