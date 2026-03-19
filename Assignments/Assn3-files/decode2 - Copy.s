	.file	"decode2.c"
	.text
	.globl	decode2
	.type	decode2, @function
decode2:
.LFB0:
	.cfi_startproc
	endbr64 
	# x -> rdi, y -> rsi, z -> rdx
	subq	%rdx, %rsi 	 	# rsi -> y-z
	imulq	%rsi, %rdi		# rdi -> x * ( y-z)
	salq	$63, %rsi			
	sarq	$63, %rsi		# rsi -> mask of LSb of (y-z), all 1 or all 0
	movq	%rdi, %rax		# rax -> rdi
	xorq	%rsi, %rax		# rax -> rsi ^ rax, x(y-z) ^ (mask of LSb of (y-z))
	ret 					# return rax val
	.cfi_endproc
.LFE0:
	.size	decode2, .-decode2
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"result: %ld\n"
.LC1:
	.string	"result2: %ld\n"
.LC2:
	.string	"result3: %ld\n"
.LC3:
	.string	"result4: %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$5, %edx
	movl	$4, %esi
	movl	$2, %edi
	call	decode2
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$5, %edx
	movl	$3, %esi
	movl	$3, %edi
	call	decode2
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$2, %edx
	movl	$6, %esi
	movl	$4, %edi
	call	decode2
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$2, %edx
	movl	$5, %esi
	movl	$2, %edi
	call	decode2
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
