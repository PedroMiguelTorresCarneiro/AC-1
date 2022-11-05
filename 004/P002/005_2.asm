# AULA PRATICA Nº 5

# EX 2

# Mapa de Registos:
# t0 - p
# t1 - *p
# t2 - lista + size = lista[size]
#

	.data
str1:	.asciiz	"; "
str2:	.asciiz	"\m Conteudo do array: \n"
lista:	.word	8,-4,3,5,124,-15,87,9,27,15
	.eqv	print_int10,1
	.eqv	print_str,4
	.eqv	SIZE,10
	.text 
	.globl main
main:
	la	$a0,str2
	addi	$v0,$0,print_str	#
	syscall				# print_str(str2);
	la	$t0,lista		# p = lista
	li	$t2,SIZE
	sll	$t2,$t2,2		#
	addu	$t2,$t0,$t2		# t2 = lista + SIZE;
while:
	bgeu	$t0,$t2,endw		# while(p < lista + SIZE) {
	lw	$t1,0($t0)		# 	t1 = *p;
	or	$a0,$0,$t1
	ori	$v0,$0,print_int10	#
	syscall				#	print_int10(*p);
	la	$a0,str1		
	addiu	$v0,$0,print_str	#
	syscall				# 	print_str(str1);
	
	addiu	$t0,$t0,4
	j	while			# }
endw:
	jr	$ra	