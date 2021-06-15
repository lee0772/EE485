	.section ".rodata"
cBase:
	.asciz "Base: "
cPower:
	.asciz "Power: "
cPrint:
	.asciz "%d to the %d power is %d.\n"
cScanformat: 
	.asciz "%d"

#-------------------------------------
	.section ".data"
	.section ".bss"
#--------------------------------------
	.section ".text"
		.equ IBASE, -4
		.equ IEXP, -8
		.equ IPOWER, -12
		.globl main
		.type main, @function

main:
	## Initialize
	pushl %ebp
	movl %esp, %ebp

	
	## Add space fot iBase, iExp, iPower
	subl $4, %esp
	subl $4, %esp
	subl $4, %esp

	## Call printf for Base
	pushl $cBase
	call printf
	addl $4, %esp

	## Call scanf for Base
	leal IBASE(%ebp), %eax
	pushl %eax
	pushl $cScanformat
	call scanf
	addl $8, %esp
	
	## Call printf for Power
	pushl $cPower
	call printf
	addl $4, %esp

	## Call scanf for Power
	leal IEXP(%ebp), %eax
	pushl %eax
	pushl $cScanformat
	call scanf
	addl $8, %esp

	## Call Power function
	pushl IEXP(%ebp)
	pushl IBASE(%ebp)
	call power
	addl $8, %esp
	movl %eax, IPOWER(%ebp)

	## Call printf for output
	pushl IPOWER(%ebp)
	pushl IEXP(%ebp)
	pushl IBASE(%ebp)
	pushl $cPrint
	call printf

	## finish main
	movl %ebp, %esp
	pop %ebp
	ret
	
power:
	pushl %ebp
	movl %esp, %ebp

	pushl $1            # power
	subl $4, %esp 
	movl $1, -8(%ebp)   # index
	

loop1:
	# finish loop if index > exp
	movl -8(%ebp), %eax
	cmpl 12(%ebp), %eax
	jg loopend1

	# mutipli base, store to the -4(ebp) power
	movl -4(%ebp), %eax
	imull 8(%ebp), %eax
	movl %eax, -4(%ebp)
	
	incl -8(%ebp)
	jmp loop1

loopend1:
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
	

