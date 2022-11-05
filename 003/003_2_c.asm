# AULA PRATICA Nº3

# EX 2 c)

# MAPA de REGISTOS
# t0 - value
# t1 - bit
# t2 - i

	.data
str1:	.asciiz "Introduza um valor: "
str2:	.asciiz	"\n Valor em binarioe': "
	.eqv	print_string, 4
	.eqv	read_int,5
	.eqv	print_char,11
	.eqv	valor,32
	.text
	.globl main

main:	
	li	$t0,0			# value = 0
	li	$t2,0			# i = 0
	la	$a0,str1
	ori	$v0,$0,print_string	
	syscall				#print_string("Introduza um numero: ")
	ori	$v0,$0,,read_int
	syscall				#
	or	$t0,$0,$v0		# value = read_int()
	la	$a0,str2
	ori	$v0,$0,print_string	
	syscall				# priont_string("O valor em binario e': ")
for:
	bgeu	$t2,valor,endfor	# for(i=0; i<32; i++)	
	rem	$t3,$t2,4		# t3 = i%4
	bne	$t3,0,space		# if(i%4==0)
	ori	$a0,$0,' '		#	
	li	$v0,print_char		#
	syscall				#print_char(' ')
space:	
	andi	$t1,$t0,0x80000000	# bit = value & 0x80000000;
	srl	$t1,$t1,31		# bit = bit >> 31
	addi	$t1,$t1,0x30		# char = bit+0x30
	
	move	$a0,$t1
	ori	$v0,$0,print_char	#print_char('bit')
	syscall	

	addi	$t2,$t2,1		# i++
	sll	$t0,$t0,1		# value = value << 1
	j	for
endfor:
	jr	$ra
