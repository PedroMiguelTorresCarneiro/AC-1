# AULA PRATICA Nº3

# EX 2 d)

# Mapa de Registos:
# t0 = value
# t1 = bit
# t2 = i
# t3 = rem
# t4 = FLAG

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor binário e': "
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	print_char,11
	.eqv	valor,32
	.text
	.globl main

main:	la	$a0,str1		#
	li	$v0,print_string	#
	syscall				# print_string(str1);
	ori	$v0,$0,read_int		#
	syscall				#
	or	$t0,$v0,$0		# value = read_int();
	la	$a0,str2		#
	li	$v0,print_string	#
	syscall				# print_string(str2);
	li	$t2,0			# i=0;
	li	$t4,0			# FLAG=0
for:	
	bge	$t2,valor,endfor		# while( i<32){
	srl	$t1,$t0,31		#	bit = value >> 31;
	beq	$t1,$0,step		#	if(bit =!0)
	li	$t4,1			#		flag =1
step:	
	bne	$t4,1,endif		#		if(flag==1)	
	rem	$t3,$t2,4		# 		t3 = i%4
	bne	$t3,0,space		#			if(i%4==0)
	ori	$a0,$0,' '		#	
	li	$v0,print_char		#
	syscall				#				print_char(' ')
space:	
	ori	$a0,$t1,'0'		#
	li	$v0,print_char		#
	syscall				# 		print_char(t4);
endif:	
	sll	$t0,$t0,1		#	value = value <<1;
	addi	$t2,$t2,1		# i++;
	j	for			#}
endfor:
	jr	$ra
