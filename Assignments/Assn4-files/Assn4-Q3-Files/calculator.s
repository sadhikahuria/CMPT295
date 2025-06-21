# add a header comment block

	.globl	XX # Make sure you change the name of this function - see XX function below
	.globl	plus
	.globl	minus
	.globl	mul


XX: # Description: 
    # Change the name of this function to something more descriptive and add a description above
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setl	%al         # See Section 3.6.2 of our textbook for a  
	ret                 # description of the set* instruction family

plus: # Description: Performs integer addition
# Requirement:
# - you cannot use add* instruction
# - you cannot use a loop

# Put your code here


minus: # Description: Performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
# - you cannot use a loop

# Put your code here


mul: # Description: Performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop

# algorithm:
#
#
#
#

# Put your code here