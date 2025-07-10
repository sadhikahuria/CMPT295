    .globl    copy
# ***** Version 2 *****
copy:
# A in %rdi, C in %rsi, N in %edx

# Using A and C as pointers

# This function is not a "caller", i.e., it does not call functions. 
# It is a leaf function (a callee). 
# Hence it does not have the responsibility of saving "caller-saved" registers 
# such as %rax, %rdi, %rsi, %rdx, %rcx, %r8 and %r9.
# This signifies that it can use these registers without 
# first saving their content if it needs to use registers.

# Set up registers
    xorl %eax, %eax            # set %eax to 0
    xorl %ecx, %ecx            # i = 0 (row index i is in %ecx)

# For each row
rowLoop:
    xorl %r8d, %r8d            # j = 0 (column index j in %r8d)
    cmpl %edx, %ecx            # while i < N (i - N < 0)
    jge doneWithRows

# For each cell of this row
colLoop:
    cmpl %edx, %r8d            # while j < N (j - N < 0)
    jge doneWithCells

# Copy the element A points to (%rdi) to the cell C points to (%rsi)
    movb (%rdi), %r9b          # temp = element A points to
    movb %r9b, (%rsi)          # cell C points to = temp

# Update A and C so they now point to their next element 
    incq %rdi
    incq %rsi

    incl %r8d                  # j++ (column index in %r8d)
    jmp colLoop                # go to next cell

# Go to next row
doneWithCells:
    incl %ecx                  # i++ (row index in %ecx)
    jmp rowLoop                # go to next row

doneWithRows:                  # bye! bye!
    ret






#####################
	.globl	transpose
transpose:
    # void transpose(void *, int );
    # memory address in %rdi, N in %esi

    # Set up registers
    xorl %eax, %eax            # set %eax to 0
    xorl %ecx, %ecx            # i = 0 (row index i is in %ecx)

# For each row
rowLoop:
    movl %ecx, %r8d            # j = i (column index j in %r8d) to avoid double switching
    cmpl %esi, %ecx            # while i < N (i - N < 0)
    jge doneWithRows

# For each cell of this row
colLoop:
    cmpl %esi, %r8d            # while j < N (j - N < 0)
    jge doneWithCells

# Copy the element A[i][j] points to A[j][i]
# A[i][j] = A + L(i*N + j)
    movl %esi, %edx             # edx holds N
    imul %ecx, %edx             # edx holds N * i
    addl %r8d, %edx             # edx holds (N*i) + j
    movb (%rdi, %rdx), %r9b     # temp = A[ + i*N + j], A[i][j]

    pushq %r9b                  # push temp to stack
    pushq %edx                  # push A[i][j] incrementation to stack

    # compute A[j][i] same way but filled

    movl %esi, %edx             # edx holds N
    imul %r8d, %edx             # edx holds N * j
    addl %ecx, %edx             # edx holds (N*j) + i
    movb (%rdi, %rdx), %r9b     # temp = A[j][i]
    movb %r9b, (%rdi, %rsp)     # A[i][j] = temp

    subq $8, %rsp               # decrement stack
    movb %rsp, (%rdi, %edx)     # move temp into A[j][i]  
    subq $8, %rsp               # decrement stack


# increment j
    incl %r8d                  # j++ (column index in %r8d)
    jmp colLoop                # go to next cell

# Go to next row
doneWithCells:
    incl %ecx                  # i++ (row index in %ecx)
    jmp rowLoop                # go to next row

doneWithRows:             
    ret













#####################
	.globl	reverseColumns
reverseColumns:
    # void reverseColumns(void *, int n);
    # memory address in %rdi, N in %esi

	ret
