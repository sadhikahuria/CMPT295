	.file	"p1.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The result of proc2(%d,%d) is %d."
	.text
	.p2align 4
	.globl	proc1
	.type	proc1, @function
proc1:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	(%rsi), %r13d
	movl	(%rdx), %esi
	movl	%r13d, %edi
	call	proc2@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	(%rbx), %r9d
	movl	0(%rbp), %r8d
	pushq	%rax
	.cfi_def_cfa_offset 64
	movq	%r12, %rdi
	leaq	.LC0(%rip), %rcx
	movl	$1, %esi
	movq	$-1, %rdx
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movl	(%rbx), %eax
	subl	$2, %eax
	movl	%eax, 0(%rbp)
	movl	%r13d, (%rbx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	proc1, .-proc1
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
