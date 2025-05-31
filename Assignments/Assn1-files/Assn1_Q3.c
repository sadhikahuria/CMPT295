/* 
 * Filename: Assn1_Q3.c
 *
 * Description:
 *
 * Authors: Our textbook + AL + Sadhika Huria
 * Student number: 301599274
 * Date: May 29, 2025
 */

#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

// Question 3 a.
void show_bytes(byte_pointer start, size_t len) {
  size_t i;
  for (i = 0; i < len; i++)
    printf(" %p %.2x\n", &(start[i]), start[i]); 	
    // the /n was not specified, however it makes the output look much cleaner, if needed, it can be removed. 
    // the output says to print it with 0x, the system doesn't print it with 0x, this can be added to the print statement to change the output.
    
  printf("\n");
  return;	
}

// Question 3 b.
// Put your answer to Question 3 b) here as a comment

// DO LATER ON THE TARGET MACHINE


// Question 3 c.
void show_bytes_2(byte_pointer start, size_t len) {
  size_t i;
  for (i = 0; i < len; i++)
    printf(" %p %.2x\n", (start + i), *(start+i));
    
    // the question says to modify the pointer notation only, however afterwards it says to make sure the values print the same thing. which is why I have added memory address to be printed int the print statement.

  printf("\n");
  return;		
}

// Question 3 d.
void show_bits(int decimal) {
	

  int binary[32] = {0};
  int size = 0;

  if (decimal<0){
    decimal = decimal *(-1);
    decimal = (2147483648) - decimal;
    binary[31] = 1;
  }


  for(int i = 0; decimal > 0; i++){
    binary[i] = decimal % 2;
    decimal = decimal / 2;
    size++;
  }


  for( int i = 31; i >= 0; i--){
    printf("%d", binary[i]);
  }
  printf("\n");
  

  return; 
}	


// Question 3 e.
int mask_LSbits(int n) {
	
  // put your code here!
  int word_size = sizeof(int) * 8;
  if (n <= 0 ){
    return 0;
  }

  if (n >= word_size){
    return -1;
  }

  int masked = 1;
  masked = 1 << n;  
  // show_bits(masked);
  masked = masked -1;
  // show_bits(masked);
  
  // feel free to modify this return statement if needed
  return masked; 
}

void show_int(int x) {
  printf("\nival = %d\n", x); 
  show_bytes((byte_pointer) &x, sizeof(int)); 
  show_bytes_2((byte_pointer) &x, sizeof(int)); 
  return;	
}

void show_float(float x) {
  printf("fval = %f\n", x); 	
  show_bytes((byte_pointer) &x, sizeof(float));
  show_bytes_2((byte_pointer) &x, sizeof(float)); 
  return;	
}

void show_pointer(void *x) {
  printf("pval = %p\n", x); 
  show_bytes((byte_pointer) &x, sizeof(void *));
  show_bytes_2((byte_pointer) &x, sizeof(void *));
  return;	
}
