# AULA PRATICA Nº2

# EX 1

	.data
newline:.asciiz "\n"

	.text	
	.globl main
main:

	ori	$t0,$0,0x1234	# t0 = read_int
	ori	$t1,$0,0xF0F0	# t1= read_int
	
	#-------------------------------------------------
	and	$t2,$t0,$t1	# t2 = AND
	
	or	$a0,$0,$t2
	li	$v0,34
	syscall			# print t2
	
	li	$v0,4
	la	$a0,newline
	syscall
	
	#-------------------------------------------------
	or	$t3,$t0,$t1	# t3 = OR
	
	or	$a0,$0,$t3
	li	$v0,34
	syscall			# print t3
	
	li	$v0,4
	la	$a0,newline
	syscall
	
	#-------------------------------------------------
	nor	$t4,$t0,$t1	# t4 = NOR
	
	or	$a0,$0,$t4
	li	$v0,34
	syscall			# print t4
	
	li	$v0,4
	la	$a0, newline
	syscall
	
	#-------------------------------------------------
	xor	$t5,$t0,$t1	# t5 = XOR
	
	or	$a0,$0,$t5
	li	$v0,34
	syscall			# print t5
	
	li	$v0,4
	la	$a0, newline
	syscall
	