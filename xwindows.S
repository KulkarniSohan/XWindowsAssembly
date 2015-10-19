.section .rodata
msg_p1:
	.string "Couldn't Open Display\n"
.section .data
	.globl toSir
	.type toSir, @object
	.align 4
	toSir:
		.string "To Piyush Sir From Soham Kulkarni"
	
	.globl respect
	.type respect, @object
	.align 4
	respect:
		.string "Linux is only free if your time has no value :) "
	.globl empty
	.type empty, @object
	.align 4
	empty:
		.string ""

.section .text
.globl ScreenOfDisplay
.type ScreenOfDisplay, @function
.equ my_display, 8
.equ my_screen, 12
ScreenOfDisplay:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	my_display ( %ebp), %eax
	movl	my_screen (%ebp), %edx
	movl	140 (%eax), %eax
	leal	(%eax, %edx, 4), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

.section .text
.globl WhitePixel
.type WhitePixel, @function
.equ my_display, 8
.equ my_screen, 12
.equ sod, -4
WhitePixel :
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	my_display (%ebp), %eax
	movl	my_screen (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4 (%esp)
	call	ScreenOfDisplay
	movl	%eax, sod (%ebp)
	movl	52 (%eax), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

.section .text 
.globl BlackPixel 
.type BlackPixel, @function
.equ my_display, 8
.equ my_screen, 12
.equ sod, -4
BlackPixel :
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	my_display (%ebp), %eax
	movl	my_screen (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4(%esp)
	call	ScreenOfDisplay
	movl	%eax, sod (%ebp)
	movl	56 (%eax), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret


.section .text
.globl RootWindow
.type RootWindow, @function
.equ my_display, 8
.equ my_screen, 12
.equ sod, -4
RootWindow :
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	my_display (%ebp), %eax
	movl	my_screen (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4(%esp)
	call	ScreenOfDisplay
	movl	%eax, sod (%ebp)
	movl	8(%eax), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

.section .text
.globl DefaultScreen
.type DefaultScreen, @function
.equ my_display, 8
.equ my_screen, -4
DefaultScreen :
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	my_display (%ebp), %eax
	movl	132 (%eax), %eax
	movl	%eax, my_screen (%ebp)
	movl	my_screen (%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret


.section .text
.globl main
.type main, @function
.equ my_display, -4
.equ my_window, -8
.equ my_gc, -12
.equ my_event, -108
.equ my_screen, -112
.equ done, -116
.equ foreground, -120
.equ background, -124
.equ root_window, -128
.equ len, -132
.equ len_respect, -136
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$320, %esp
	movl	$0, done (%ebp)
	movl	$0, my_display (%ebp)
	movl	$empty, 0(%esp)
	call	XOpenDisplay 
	movl	%eax, my_display (%ebp)
	cmpl	$0, %eax
	je		mn_exit_f
	movl	my_display (%ebp), %eax
	movl	%eax, 0(%esp)
	call	DefaultScreen
	movl	%eax, my_screen (%ebp)
	
	movl	my_screen (%ebp), %edx
	movl	my_display (%ebp), %eax
	movl	%eax, 0(%esp)
	movl	%edx, 4(%esp)
	call	WhitePixel
	movl	%eax, foreground (%ebp)

	movl	my_screen (%ebp), %edx
	movl	my_display (%ebp), %eax
	movl	%eax, 0(%esp)
	movl	%edx, 4(%esp)
	call	BlackPixel
	movl	%eax, background (%ebp)
	
	
	
	movl	my_display (%ebp), %eax
	movl	my_screen (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4(%esp)
	call	RootWindow
	movl	%eax, root_window (%ebp)
	
	movl	my_display (%ebp), %eax
	movl	%eax, 0(%esp)
	movl	root_window (%ebp), %eax
	movl	%eax, 4 (%esp)
	movl	$200, 8(%esp)
	movl	$300, 12 (%esp)
	movl	$350, 16 (%esp)
	movl	$350, 20 (%esp)
	movl	$5, 24 (%esp)
	movl	background (%ebp), %eax
	movl	%eax, 28 (%esp)
	movl	foreground (%ebp), %eax
	movl	%eax, 32 (%esp)
	call	XCreateSimpleWindow
	movl	%eax, my_window (%ebp)

	movl	my_display (%ebp), %eax
	movl	my_window (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4 (%esp)
	movl	$0, 8(%esp)
	movl	$0, 12 (%esp)
	call	XCreateGC
	movl	%eax, my_gc (%ebp)
	
	movl	my_display (%ebp), %eax
	movl	my_window (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4 (%esp)
	movl	$32773, 8(%esp)
	call	XSelectInput 
	
	movl	my_display (%ebp), %eax
	movl	my_window (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4 (%esp)
	call	XMapWindow

	movl	$respect, 0(%esp)
	call	strlen 
	movl	%eax, len_respect (%ebp)
	
	movl	$toSir, 0(%esp)
	call	strlen 
	movl	%eax, len (%ebp)

	jmp		eventloop_cond
	event_loop:
	leal	my_event (%ebp), %eax
	movl	%eax, 4(%esp)
	movl	my_display (%ebp), %eax
	movl	%eax, 0(%esp)	
	call	XNextEvent
	leal	my_event (%ebp), %eax
	movl	0(%eax), %edx
	cmpl	$12, %edx
	je		handleExpose
	cmpl	$2, %edx
	je		handleKeyPress
	cmpl	$4, %edx
	je		handleButtonPress
	jmp		eventloop_cond
	handleExpose:
	leal	my_event (%ebp), %eax
	movl	12 (%eax), %edx
	movl	%edx, 0(%esp)
	movl	16 (%eax), %edx
	movl	%edx, 4(%esp)
	movl	my_gc (%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$50, 12 (%esp)
	movl	$50, 16 (%esp)
	movl	$toSir, 20 (%esp)
	movl	len (%ebp), %edx
	movl	%edx, 24 (%esp)
	call	XDrawString
	jmp		eventloop_cond
	handleKeyPress:
	movl	$1, done (%ebp)
	jmp		eventloop_cond
	handleButtonPress:
	leal	my_event (%ebp), %eax
	movl	12 (%eax), %edx
	movl	%edx, 0(%esp)
	movl	16 (%eax), %edx
	movl	%edx, 4(%esp)
	movl	my_gc (%ebp), %edx
	movl	%edx, 8(%esp)
	movl	32 (%eax), %edx
	movl	%edx, 12 (%esp)
	movl	36 (%eax), %edx
	movl	%edx, 16 (%esp)
	movl	$respect, 20 (%esp)
	movl	len_respect (%ebp), %edx
	movl	%edx, 24 (%esp)
	call	XDrawString
	jmp		eventloop_cond
	eventloop_cond :
	cmpl	$0, done (%ebp)
	je		event_loop
	
	
	movl	my_display (%ebp), %eax
	movl	my_gc (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4(%esp)
	call	XFreeGC 
	
	movl	my_display (%ebp), %eax
	movl	my_window (%ebp), %edx
	movl	%eax, 0(%esp)
	movl	%edx, 4 (%esp)
	call	XDestroyWindow 
	
	movl	my_display (%ebp), %eax
	movl	%eax, 0(%esp)
	call	XCloseDisplay
	
	
	
	
	
mn_exit_f:
	movl	$msg_p1, 0(%esp)
	call	printf
	movl	$-1, 0(%esp)
	call	exit

