# AULA PRATICA Nº2

# EX 2

# 	sll Rdst,Rsrc,Imm	: shift left logical
#	srl Rdst,Rsrc,Imm	: shift right logical
#	sra Rdst,Rsrc,Imm	: shift right arithmetic

	.data 
newline:.asciiz "\n"
	.text
	.globl main
main:
	li	$t0,0x862A5C1B		# t0 = 0x12345678
	
	#-------------------------------------------------
	sll	$t2,$t0,4
	or	$a0,$0,$t2
	li	$v0,34
	syscall			# print t2
	
	li	$v0,4
	la	$a0,newline
	syscall
	
	#-------------------------------------------------
	srl	$t3,$t0,4
	or	$a0,$0,$t3
	li	$v0,34
	syscall			# print t3
	
	li	$v0,4
	la	$a0,newline
	syscall
	
	#-------------------------------------------------
	sra	$t4,$t0,4
	or	$a0,$0,$t4
	li	$v0,34
	syscall			# print t4
	
	li	$v0,4
	la	$a0,newline
	syscall
	
	
	jr	$ra
	