# AULA PRATICA Nº1

# EX 3

# a)

	.data
	.text 
	.globl main
main:
	ori	$v0,$0,5
	syscall			# read_int()
	
	or	$t0,$0,$v0	# t0 = 0+v0 = x
	ori	$t2,$0,8	# t2 = 8
	add	$t1,$t0,$t0	# t1 = 2x
	sub	$t1,$t1,$t2	# t1 = t1-t2 = 2x-8
	
	or	$a0,$0,$t1	#
	#ori	$v0,$0,1	# (print_int10)
	#ori	$v0,$0,34	# (print_int16)
	ori	$v0,$0,36	# (print_intu10)
	syscall			# print_int(t1)
	
	jr	$ra		# end
	
# b) 
	# x=3 , t1= -2
	# x=5 , t1= 2

# c)
	# x=2 , t1= 0xfffffffc
	# x=3 , t1= 0xfffffffe
	# x=4 , t1= 0x00000000
	# x=5 , t1= 0x00000002
	
# d)
	# x=2 , t1= 4294967292
	# x=3 , t1= 4294967294
	# x=4 , t1= 0
	# x=5 , t1= 2

	