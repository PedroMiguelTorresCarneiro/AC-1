# AULA PRATICA Nº 4

# EX 2

# Mapa de Registos:
#num	= t0
#p	= t1
#*p	= t2

	.data
	.eqv	print_int,1
	.eqv	read_str,8
	.eqv	SIZE,20
str:	.space	21
	.text
	.globl main
main:
	li	$t0,0		# num = 0
	la	$a0,str		#
	li	$a1,SIZE	#
	li	$v0,read_str	#
	syscall			# read_str(str,SIZE)
	la	$t1,str		# p = str
	
while:	
	lb	$t2,0($t1)	# carrega *p
	beq	$t2,0x00,endw	# while (*p != '\0')
if:
	blt	$t2,'0',endif	# 
	bgt	$t2,'9',endif	# if((*p>=0)$$(*p<=9))
	addi	$t0,$t0,1	# num++
endif:
	addi	$t1,$t1,1	# p++
	j while
endw:
	or	$a0,$0,$t0		
	ori	$v0,$0,print_int# print_int(num)
	syscall	
	jr	$ra
