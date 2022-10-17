# AULA PRATICA Nº1

# EX 2

# a)
	.data
	
	.text	
	.globl main
main:	
	ori	$t0,$0,3	# t0 = x = 3
	ori	$t2,$0,8	# t2 = 8
	add	$t1,$t0,$t0	# t1 = t0+t0 = x+x = 2x
	sub	$t1,$t1,$t2	# t1 = t1+t2 = 2x+8
	jr	$ra		# end
	
		
# x=2 > t1= -4 ou 0xfffffffc
# x=3 > t1= -2 ou 0xfffffffe
# x=4 > t1= 0  ou 0x00000000
# x=5 > t1= 2  ou 0x00000002