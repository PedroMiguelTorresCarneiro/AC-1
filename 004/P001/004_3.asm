# AULA PRATICA Nº 4

# EX 3

# Mapa de Registos:
# p	= t0
#pultimo= t1
#*p	= t2
#soma	= t3
#	= t4
#	= t5
#	= t6

	.data
array:	.word 7692,23,5,234
	.eqv print_int,1
	.eqv SIZE,4
	.text
	.globl main
main:
	li	$t3,0			# soma = 0;
	li	$t4,SIZE
	sub	$t4,$t4,1		# t4 = 3
	mul	$t4,$t4,4		#
	la	$t0,array		# p = array;
	addu	$t1,$t0,$t4		# pultimo = array + SIZE - 1;
while:	
	bgtu	$t0,$t1,endw		# while(p <= pultimo){
	lw	$t2,0($t0)		# 	t2 = *p;
	addu	$t3,$t3,$t2		# 	soma = soma + (*p);
	addiu	$t0,$t0,4		#	p++;
	j	while
endw:
	or	$a0,$0,$t3		
	ori	$v0,$0,print_int	# print_int(soma)
	syscall	
	jr	$ra	