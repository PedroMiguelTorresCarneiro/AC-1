# AULA PRATICA Nº2

# EX 3

# d)

# TABELA DE DADOS:
# t0 = a
# t1 = b

	.data 
str1:	.asciiz "Introduza 2 numeros \n"
str2:	.asciiz "A soma dos dois numeros e': "
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	print_int,1	
	
	.text
	.globl main
main:
	la	$a0,str1		#
	ori	$v0,$0,print_string	#
	syscall				# print_string(str1)
	ori	$v0,$0,read_int
	syscall				# 
	or	$t0,$v0,$0		# t0 = a
	ori	$v0,$0,read_int
	syscall			
	or	$t1,$v0,$0		# t1 = b
	la	$a0,str2
	ori	$v0,$0,print_string	
	syscall				# print(str2)
	add	$t1,$t0,$t1		# t1 = t0 + t1 = a + b 
	or	$a0,$t1,$0
	ori	$v0,$0,print_int
	syscall				# print(t1)
	jr	$ra