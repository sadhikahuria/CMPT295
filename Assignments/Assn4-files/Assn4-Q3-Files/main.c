/*
 * Filename: main.c
 *
 * Purpose: Test driver for our calculator 
 *          in Assignment 4 Question 3
 * 
 * Date: June 2025
 *
 */

#include <stdlib.h>  // atoi()
#include <stdio.h>   // printf()

int is_less(int x, int y);  // Make sure you change the name of this function - see calculator.s
// returns 1 if x is less than y, else 0
int plus(int x, int y);
int minus(int x, int y);
int mul(int x, int y);


int main(int argc, char *argv[]) {
  int x = 0;
  int y = 0;
  int result = 0;

  if (argc == 3) {
    x = atoi(argv[1]);
    y = atoi(argv[2]);

    result = is_less(x, y); // Make sure you change the name of this function - see calculator.s
    printf("%d ??? %d -> %d\n", x, y, result); // Make sure you change ??? to the appropriate symbol

    result = plus(x, y);
    printf("%d + %d = %d\n", x, y, result);

    result = minus(x, y);
    printf("%d - %d = %d\n", x, y, result);

    result = mul(x, y);
     printf("%d * %d = %d\n", x, y, result);

  } else {
      printf("Must supply 2 integers arguments.\n");
      return 1;
  }

  return 0;
}
