# AULA PRATICA Nº2

# EX 2

# d)

	# num = gray;
	# num = num ^ (num >> 4)
	# num = num ^ (num >> 2)
	# num = num ^ (num >> 1)
	# bin = num
	
# TABELA de DADOS:
# 
# t0 = gray
# t1 = num
# t2 = bin

	.data
newline:.asciiz "\n"
	.text
	.globl main
main:
	li	$t0,5		# t0 = 2,
	srl	$t1,$t0,4	# t1 = sll(t0 >> 4)
	xor	$t1,$t0,$t1	# num = num ^ (num >> 4) <=> num = t0 ^ t1
	srl	$t0,$t1,2	# t0 = srl (t1 >> 2);
	xor	$t1,$t1,$t0	# num = num ^ (num >> 2) <=> num = t1 ^ t0
	srl	$t0,$t1,1	# t0 = srl (t1 >> 1)
	xor	$t2,$t1,$t0	# t2 = num ^ (num >> 1) <=> bin = t1 ^ t0
	
	or	$a0,$0,$t2	
	li	$v0,34
	syscall			# print(t1)
	
	