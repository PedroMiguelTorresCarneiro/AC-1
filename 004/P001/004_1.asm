# AULA PRATICA Nº 4

# EX 1

# Mapa de Registos:
#num	= t0
#i	= t1
#str	= t2
#str+i	= t3
#str[i] = t4

	.data
	.eqv	SIZE,20
	.eqv	read_string,8
	.eqv	print_int,1
	.eqv	print_str,4
str:	.space	21
str1:	.asciiz	"Introduza uma string: \n"
	.text
	.globl main

main:
	la	$a0,str1
	li	$v0,print_str
	syscall				# print_string("Introduza uma string: ")
	la	$a0,str			# a0 = &str[0]
	li	$a1,SIZE		# a1 = SIZE
	li	$v0,read_string
	syscall				# read_string(str,SIZE)
	li	$t0,0			# num = 0
	li	$t1,0			# i = 0
while:					
	la	$t2,str			# t2 = str = &str[0]
	addu	$t3,$t2,$t1		# t3 = t2 + t1 = str + i = &str[i]
	lb	$t4,0($t3)		# t4 = str[i]
	beq	$t4,0x00,endw		# while(str[i] != 0){
if:
	blt	$t4,'0',endif		
	bgt	$t4,'9',endif		# if ((str[i]>= '0')&&(str[i]<='9'))
	addi	$t0,$t0,1		# num++		
endif:	
	addi	$t1,$t1,1		# i++
	j	while
endw:
	or	$a0,$0,$t0		
	ori	$v0,$0,print_int
	syscall	
	jr	$ra
