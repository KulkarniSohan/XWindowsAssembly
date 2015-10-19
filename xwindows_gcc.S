	.file	"xwindows.c"
	.globl	hello
	.data
	.type	hello, @object
	.size	hello, 12
hello:
	.string	"Hello World"
	.globl	hi
	.type	hi, @object
	.size	hi, 27
hi:
	.string	"Bilated Happy Birthday Sir"
	.section	.rodata
.LC0:
	.string	""
.LC1:
	.string	"\n\t Couldn't Open display"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
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
	subl	$192, %esp
	movl	12(%ebp), %eax
	movl	%eax, 60(%esp)
	movl	%gs:20, %eax
	movl	%eax, 188(%esp)
	xorl	%eax, %eax
	movl	$0, 68(%esp)
	movl	$0, 64(%esp)
	movl	$.LC0, (%esp)
	.cfi_offset 3, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	call	XOpenDisplay
	movl	%eax, 68(%esp)
	cmpl	$0, 68(%esp)
	jne	.L2
	movl	$.LC1, (%esp)
	call	puts
	movl	$-1, (%esp)
	call	exit
.L2:
	movl	68(%esp), %eax
	movl	132(%eax), %eax
	movl	%eax, 72(%esp)
	movl	68(%esp), %eax
	movl	140(%eax), %ecx
	movl	72(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	addl	%ecx, %eax
	movl	52(%eax), %eax
	movl	%eax, 76(%esp)
	movl	68(%esp), %eax
	movl	140(%eax), %ecx
	movl	72(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	addl	%ecx, %eax
	movl	56(%eax), %eax
	movl	%eax, 80(%esp)
	movl	68(%esp), %eax
	movl	140(%eax), %ecx
	movl	72(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	addl	%ecx, %eax
	movl	8(%eax), %eax
	movl	76(%esp), %edx
	movl	%edx, 32(%esp)
	movl	80(%esp), %edx
	movl	%edx, 28(%esp)
	movl	$5, 24(%esp)
	movl	$350, 20(%esp)
	movl	$350, 16(%esp)
	movl	$300, 12(%esp)
	movl	$200, 8(%esp)
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XCreateSimpleWindow
	movl	%eax, 84(%esp)
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XCreateGC
	movl	%eax, 88(%esp)
	movl	$32773, 8(%esp)
	movl	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XSelectInput
	movl	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XMapWindow
	jmp	.L3
.L9:
	leal	92(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XNextEvent
	movl	92(%esp), %eax
	cmpl	$4, %eax
	je	.L5
	cmpl	$4, %eax
	jg	.L8
	cmpl	$2, %eax
	je	.L4
	jmp	.L3
.L8:
	cmpl	$12, %eax
	je	.L6
	cmpl	$34, %eax
	je	.L7
	jmp	.L3
.L6:
	movl	$hello, %eax
	movl	$-1, 56(%esp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	56(%esp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	movl	%eax, %ecx
	movl	108(%esp), %edx
	movl	104(%esp), %eax
	movl	%ecx, 24(%esp)
	movl	$hello, 20(%esp)
	movl	$50, 16(%esp)
	movl	$50, 12(%esp)
	movl	88(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	XDrawString
	jmp	.L3
.L5:
	movl	$hi, %eax
	movl	$-1, 56(%esp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	56(%esp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	movl	%eax, %esi
	movl	128(%esp), %ebx
	movl	124(%esp), %ecx
	movl	108(%esp), %edx
	movl	104(%esp), %eax
	movl	%esi, 24(%esp)
	movl	$hi, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	88(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	XDrawString
	jmp	.L3
.L4:
	movl	$1, 64(%esp)
	jmp	.L3
.L7:
	leal	92(%esp), %eax
	movl	%eax, (%esp)
	call	XRefreshKeyboardMapping
	nop
.L3:
	cmpl	$0, 64(%esp)
	je	.L9
	movl	88(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XFreeGC
	movl	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XDestroyWindow
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	XCloseDisplay
	movl	188(%esp), %edx
	xorl	%gs:20, %edx
	je	.L10
	call	__stack_chk_fail
.L10:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
