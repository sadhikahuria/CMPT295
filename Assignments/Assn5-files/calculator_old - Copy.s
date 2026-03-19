# Name: Sadhika Huria
# Student id: 301599274 
# Date Julu 5th 2025
# calculator.s, assembly code for a calculator

	.globl	is_less		# Make sure you change the name of this function - see XX function below
	.globl	plus
	.globl	minus
	.globl	mul



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

