	.file	"main.c"
	.text
	.globl	arith
	.type	arith, @function
arith:
.LFB1:
	.cfi_startproc
	endbr64
	leaq	(%rdi,%rsi), %rax
	addq	%rdx, %rax
	leaq	(%rsi,%rsi,2), %rdx
	salq	$4, %rdx
	leaq	4(%rdi,%rdx), %rdx
	imulq	%rdx, %rax
	ret
	.cfi_endproc
.LFE1:
	.size	arith, .-arith
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"x = %ld, y = %ld, z = %ld and result of arith is %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$4, %edx
	movl	$3, %esi
	movl	$2, %edi
	call	arith
	movq	%rax, %rbx
	movq	%rax, %r8
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	leaq	.LC0(%rip), %rbp
	movq	%rbp, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	%rbx, globalA(%rip)
	movl	$1, %edx
	movl	$4, %esi
	movq	$-3, %rdi
	call	arith
	movq	%rax, %r8
	movl	$1, %ecx
	movl	$4, %edx
	movq	$-3, %rsi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	globalA
	.bss
	.align 8
	.type	globalA, @object
	.size	globalA, 8
globalA:
	.zero	8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
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
