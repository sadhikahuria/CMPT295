# Name: Sadhika Huria
# Student id: 301599274 
# Date Julu 5th 2025
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

mul: 
	testl %esi, %esi            # check if esi == 0
	je base_case                   # if esi == 0, end function, return result
	
	pushq %rdi 			# save x and y on to the stack 
	pushq %rsi

	subl $1, %esi		# decrement y 
	call mul 			# call the function

	popq %rsi		#restore both original values
	popq %rdi

	addl %edi, %eax		# adding x to result

	ret
	

	base_case:
		movl $0, %eax		# return 0, if y == 0 
		ret

