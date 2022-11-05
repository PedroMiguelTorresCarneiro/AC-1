# AULA PRATICA Nº 5

# EX 1

# Mapa de Registos:
# t0 - i
# t1 - lista
# t2 - lista + i
#

	.data
	.eqv	SIZE,5
str1:	.asciiz	"\n Introduza um numero: "
	.align	2
lista:	.space	20
	.eqv	read_int,5
	.eqv	print_str,4
	.text
	.globl main

main:
	li	$t0,0			# i = 0
while:		
	bge	$t0,SIZE,endw		# while(i < SIZE)
	la	$a0,str1		#{
	addi	$v0,$0,print_str	#
	syscall				#	print_str(str1);
	
	li	$v0,read_int		#
	syscall				#	v0 = read_int();
	la	$t1,lista		#	t1 = lista == &lista[0]
	sll	$t2,$t0,2		#
	addu	$t2,$t2,$t1		# 	t2 = &lista[i] == lista + i
	
	sw	$v0,0($t2)		#	lista[i] = read_int();
	addi	$t0,$t0,1		#	i++;
	j	while			#}
endw:	
	jr 	$ra				
	
	