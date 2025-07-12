# Name: Sadhika Huria
# transpose: transpose Matrix
# reverse columns, reverse
# Student id: 301599274
# Date: July 11, 2025


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
rowLoop1:
    movl %ecx, %r8d            # j = i (column index j in %r8d) to avoid double switching
    cmpl %esi, %ecx            # while i < N (i - N < 0)
    jge doneWithRows1

# For each cell of this row
colLoop1:
    cmpl %esi, %r8d            # while j < N (j - N < 0)
    jge doneWithCells1

# Copy the element A[i][j] points to A[j][i]
# A[i][j] = A + L(i*N + j)
    xorq %rdx, %rdx             # zero rdx
    movl %esi, %edx             # edx holds N
    imul %ecx, %edx             # edx holds N * i
    addl %r8d, %edx             # edx holds (N*i) + j
    leaq (%rdi, %rdx), %r9     # temp = A[ + i*N + j], &A[i][j]

    # compute &A[j][i] same way but filled

    xorq %rdx, %rdx             # zero rdx
    movl %esi, %edx             # edx holds N
    imul %r8d, %edx             # edx holds N * j
    addl %ecx, %edx             # edx holds (N*j) + i
    leaq (%rdi, %rdx), %r10    # r10 = temp = &A[j][i]


    movb (%r9), %r11b             # r11 temp = A[i][j] 
    movb (%r10), %al           # ax holds A[j][i]
    movb %al, (%r9)            #set A[i][j] to A[j][i]
    movb %r11b, (%r10)         # set A[j][i] to temp


# increment j
    incl %r8d                  # j++ (column index in %r8d)
    jmp colLoop1                # go to next cell

# Go to next row
doneWithCells1:
    incl %ecx                  # i++ (row index in %ecx)
    jmp rowLoop1                # go to next row

doneWithRows1:             
    ret





#####################
	.globl	reverseColumns
reverseColumns:
    # void reverseColumns(void *, int n);
    # memory address in %rdi, N in %esi

    movl %esi, %eax                 # set eax to N
    shrl $1, %eax                   # eax >> 1, N divided by two, and floored
    xorl %edx, %edx                 # set i = 0, i -> rdx


row_loop:
    cmpl %esi, %edx                 # while i < N, jump if N>=if
    jge done_with_row
    xorl %ecx, %ecx                 # set ecx, j to 0

col_loop:
    cmpl %eax, %ecx                 # while j < (N>>2), otherwise jump
    jge done_with_col


    # get address of A[i][j] = A + L(i*N + j)

    xorq %r8, %r8                   # zero r8
    movl %esi, %r8d                 # set r8 to n
    imul %edx, %r8d                 # i * N 
    addl %ecx, %r8d                 # i*N + j 
    leaq (%rdi, %r8), %r9           # r9 hold address of A[i][j]


    # let z = (N-1) - j, it would be the mirrored column in the matrix

    # compute z
    xorq %r8, %r8                   # zero r8
    movl %esi, %r8d                 # r8 -> z = N
    subl $1, %r8d                   # r8 -> z = N - 1
    subl %ecx, %r8d                 # r8 -> z = N - 1 - j


    # get address of A[i][z], with same process as before,

    xorq %r10, %r10          
    movl %esi, %r10d        
    imul %edx, %r10d
    addl %r8d, %r10d
    leaq (%rdi, %r10), %r10         # r10 holds A[i][z]


    # switch A[i][j] and A[i][z]

    movb (%r9), %r11b               # r11 -> temp = A[i][j]
    movb (%r10), %r8b               # r8 -> temp2 = A[i][z]
    movb %r8b, (%r9)                # set A[i][j] = temp2 = A[i][z]
    movb %r11b, (%r10)              # set A[i][z] = temp = A[i][j]


    incl %ecx                       # j++
    jmp col_loop                    # next iteration of the colLoop



done_with_col:
    incl %edx                       # i++
    jmp row_loop                    # jump to next row

done_with_row:
    xorl %eax, %eax                 # set ret val to 0
	ret
