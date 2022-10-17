# AULA PRATICA Nº2

# EX 2

# c)

	# gray = bin ^(bin << 1);

# TABELA de DADOS:
# 
# t0 = bin
# t1 = gray

	.data
newline:.asciiz "\n"
	.text
	.globl main
main:
	li	$t0,5		# t0 = 2,
	srl	$t1,$t0,1	# t1 = sll(t0 >> 1)
	xor	$t1,$t0,$t1	# t1 = t0 ^ t1 = t0 XOR sll(t0 >>1)
	
	or	$a0,$0,$t1	
	li	$v0,34
	syscall			# print(t1)
	
	
