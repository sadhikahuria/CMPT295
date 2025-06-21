# Name: Sadhika Huria
# Student id: 301599274 
# Date June 20th 2025
# calculator.s, assembly code for a calculator

	.globl	is_less		# Make sure you change the name of this function - see XX function below
	.globl	plus
	.globl	minus
	.globl	mul


is_less: # Description: 
    # Change the name of this function to something more descriptive and add a description above

	# edi -> x, esi -> y
	xorl	%eax, %eax	# return value set to 0
	cmpl	%esi, %edi	# x - y < 0 s.t. x < y, then setl is executed. 
	setl	%al         # if x < y, return value is set to 1
						# See Section 3.6.2 of our textbook for a  
	ret                 # returns 1, if x < y, otherwise 0
						# description of the set* instruction family

plus: # Description: Performs integer addition
# Requirement:
# - you cannot use add* instruction
# - you cannot use a loop

# Put your code here
# edi -> x, esi -> y

    movl    %edi, %eax      # set return value to x
    negl    %esi            # change y to -y 
    subl    %esi, %eax      # set return val to x-(-y) (so, equivalent to x+y)
	ret

minus: # Description: Performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
# - you cannot use a loop

# Put your code here
# edi -> x, esi -> y

    movl    %edi, %eax      # set return value to x
    negl    %esi            # change y to -y 
    addl    %esi, %eax      # set return val to x+(-y) (so, equivalent to x-y)
	ret

mul: # Description: Performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop


# algorithm:
# result = 0
# while (y != 0){
#	if( y is odd ){
#		result += x;
#	}
#	x = x * 2;
#	y = y / 2;	
# }
#
#

# Put your code here
# edi -> x, esi -> y
	xorl	%eax , %eax		# set result to 0

	loop:
	testl  	%rsi, %rsi 		# if rsi, y is 0, end loop
	je endloop

	testl $1, %esi 			#check if esi is even or odd, comparing checking LSb

	jz dont_add 			# if even, dont add x to result
	addl %edi, %eax			

	
	dont_add:
		shll $1, edi
		shrl $1, esi
		jmp loop


	endloop:

	ret
