# AULA PRATICA Nº2

# EX 1

# c)

	.data
newline:.asciiz "\n"
	
	.text
	.globl main
main:
	ori	$t0,$0,0x0F1E		# t0 = Val_x
	xori	$t1,$t0,0xFFFFFFFF	# t1 = xori(t0,0xFFFFFFFF)
	
	or	$a0,$0,$t1		# a0 = t1
	li	$v0,34
	syscall				# print(t1)
	
	jr	$ra
			