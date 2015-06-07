	.file	"hw4main.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %ebx
	movl	68(%esp), %eax
	movl	72(%esp), %edx
	movl	80(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2
	call	recover
	movl	%ebx, %eax
	jmp	.L3
.L2:
	leal	1(%ebx,%ebx), %esi
	leal	(%ebx,%ebx), %edi
	testl	%ebx, %ebx
	cmovns	%edi, %esi
	movswl	%ax, %edi
	addl	%edi, %edi
	testw	%ax, %ax
	jns	.L7
	movswl	%ax, %edi
	leal	1(%edi,%edi), %edi
.L7:
	movsbl	%dl, %ebp
	addl	%ebp, %ebp
	testb	%dl, %dl
	jns	.L9
	movsbl	%dl, %ebp
	leal	1(%ebp,%ebp), %ebp
.L9:
	subl	$1, %ecx
	movl	%ecx, 16(%esp)
	movl	76(%esp), %ecx
	addl	$1, %ecx
	movl	%ecx, 12(%esp)
	movl	%ebp, %ecx
	xorl	%ebx, %ecx
	movsbl	%cl, %ebp
	movl	%ebp, 8(%esp)
	movsbl	%dl, %edx
	xorl	%edx, %edi
	movswl	%di, %edi
	movl	%edi, 4(%esp)
	cwtl
	xorl	%eax, %esi
	movl	%esi, (%esp)
	call	foo
	addl	%ebx, %eax
.L3:
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE40:
	.size	foo, .-foo
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"Usage: program <int> <int> <int> <int>"
	.align 4
.LC1:
	.string	"main called with a = %d, b = %d, c = %d, countDown = %d\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"foo returns %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$32, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %esi
	cmpl	$5, 8(%ebp)
	je	.L12
	movl	$.LC0, (%esp)
	call	puts
	movl	$-1, (%esp)
	call	exit
.L12:
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	4(%esi), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	%eax, 28(%esp)
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%esi), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	%eax, 24(%esp)
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%esi), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	%eax, %ebx
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	16(%esi), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	%eax, %edi
	movsbl	%bl, %esi
	movswl	24(%esp), %ebx
	movl	%eax, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	28(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	%edi, 16(%esp)
	movl	$0, 12(%esp)
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	foo
	movl	%eax, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$0, %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
