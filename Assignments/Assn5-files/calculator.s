# Name: Sadhika Huria
# Student id: 301599274 
# Date Julu 5th 2025
# calculator.s, assembly code for a calculator

	.globl	is_less		# Make sure you change the name of this function - see XX function below
	.globl	plus
	.globl	minus
	.globl	mul



mul: 
	testl %esi, %esi
	je finish

	subl $1, %esi
	addl %edi, %edx
	call mul

	finish:
	    movl %edx, %eax
        ret
