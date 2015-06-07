	.file	"hw4.c"
	.text
	.globl	convertToHex
	.type	convertToHex, @function
convertToHex:
.LFB40:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$52, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %edx
	movl	%gs:20, %eax
	movl	%eax, 44(%esp)
	xorl	%eax, %eax
	movl	$1, %ebx
.L5:
	movl	%edx, %eax
	andl	$15, %eax
	leal	48(%eax), %ecx
	leal	55(%eax), %esi
	cmpl	$9, %eax
	movl	%ecx, %eax
	cmovg	%esi, %eax
	movb	%al, 24(%esp,%ebx)
	movl	%edx, %eax
	shrl	$4, %eax
	movl	%eax, %edx
	leal	1(%ebx), %ecx
	testl	%eax, %eax
	je	.L4
	movl	%ecx, %ebx
	jmp	.L5
.L4:
	testl	%ebx, %ebx
	jle	.L6
	leal	24(%esp), %esi
	addl	%esi, %ebx
.L7:
	movl	stdout, %eax
	movl	%eax, 4(%esp)
	movsbl	(%ebx), %eax
	movl	%eax, (%esp)
	call	_IO_putc
	subl	$1, %ebx
	cmpl	%esi, %ebx
	jne	.L7
.L6:
	movl	$10, (%esp)
	call	putchar
	movl	44(%esp), %eax
	xorl	%gs:20, %eax
	je	.L8
	call	__stack_chk_fail
.L8:
	addl	$52, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.p2align 4,,1
	ret
	.cfi_endproc
.LFE40:
	.size	convertToHex, .-convertToHex
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"CountDown is: %d\n"
.LC1:
	.string	"foo called with args: "
.LC2:
	.string	"a: "
.LC3:
	.string	"b: "
.LC4:
	.string	"c: "
	.text
	.globl	recover
	.type	recover, @function
recover:
.LFB39:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	leal	124(%esp), %eax
	movl	%eax, 28(%esp)
	movl	124(%esp), %esi
	movl	%esi, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	%esi, %eax
	sall	$6, %eax
	addl	%eax, 28(%esp)
	addl	$1, %esi
	testl	%esi, %esi
	jle	.L10
	movl	$0, %ebx
.L12:
	movl	$.LC1, (%esp)
	call	puts
	subl	$12, 28(%esp)
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	convertToHex
	addl	$4, 28(%esp)
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	convertToHex
	addl	$4, 28(%esp)
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	convertToHex
	subl	$60, 28(%esp)
	movl	$10, (%esp)
	call	putchar
	addl	$1, %ebx
	cmpl	%esi, %ebx
	jne	.L12
.L10:
	addl	$36, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE39:
	.size	recover, .-recover
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
