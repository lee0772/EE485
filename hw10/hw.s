	.section ".rodata"
cGreeting:
	.asciz "hello,world! My name is yunheon Lee\n"
cScanfFormat:
	.asciz "%d %d"
##----------------------------------------------------
	.section ".data"
##---------------------------------------------------
	.section ".bss"

	.section ".text"
		.equ IMIN, -4
		.equ IMAX, -8
		.equ ISUM, -12

		.globl main
		.type main, @function


main:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	subl $4, %esp
	subl $4, %esp

	leal IMAX(%ebp), %eax
	pushl %eax
	leal IMIN(%ebp), %eax
	pushl %eax
	pushl $cScanfFormat

	call scanf
	
	mov %eax dword [ebp-4]
	mov %ebx dword [ebp-8]
	cmp eax, ebx
	cmovl eax, ebx
	mov %ebx dword [ebp-8]
	mov IMAX(%ebp), %eax
	mov %eax dword [ebp-4]
	cmp %ebx, %eax
	cmovl %eax, %ebx
	mov IMIN(%ebp), %eax


	mov IMIN(%ebp)



	cmp IMAX(%ebp), IMIN(%ebp)
	JGE maxismax
	J

maxismax:


	leal
	pushl $cGreeting
	call printf
	addl $4, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
	



sum:
	
