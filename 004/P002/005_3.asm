# AULA PRATICA Nº 5

# EX 3

# Mapa de Registos:
# t0 - j
# t1 - listaj
# t2 - lista + j
# t3 - 
# t4 - houve_troca
# t5 - i
# t6 - lista
# t7 - lista + i

	.data
	.eqv	SIZE,5
	.eqv	FALSE,0
	.eqv	TRUE,1
str1:	.asciiz	"\n In troduza um numero:  \n"
str2:	.asciiz	"; "
	.align	2
lista:	.space	20
	.align	2
	.eqv	read_int,5
	.eqv	print_str,4
	.eqv	print_int,1
	.text
	.globl main

main:
# read 5 values an store then in a ARRAY
	li	$t0,0		# j = 0;
	li	$t3,SIZE
	sub	$t3,$t3,1	# t3 = SIZE -1
while:
	bge	$t0,SIZE,do		# while(j < SIZE){ 
	la	$a0,str1		#
	addi	$v0,$0,print_str	#
	syscall				# print_str(str1);
	li	$v0,read_int		#
	syscall				# v0 = read_int();
	la	$t1,lista		# t1= lista;
	sll	$t2,$t0,2		#
	addu	$t2,$t2,$t1		# t2 = lista[j];
	sw	$v0,0($t2)		# lista[j]= read_int();
	addi	$t0,$t0,1		# j++;
	j	while			#}
# bubble sort the values on the ARRAY
do:					#do{
	li	$t4,FALSE		#	houve_troca = FALSE;
	li	$t5,0			#	i = 0;
for:
	bge	$t5,$t3,endfor		# 	if(i < SIZE-1)
	sll	$t7,$t5,2		#	t7 = i*4
	la	$t6,lista
	addu	$t7,$t7,$t6		#	t7 = &lista[i]
	lw	$t8,0($t7)		#	t8 = lista[i]
	lw	$t9,4($t7)		#	t9 = lista[i+1]
	ble	$t8,$t9,step		#	if(t8 > t9 ){
	sw	$t8,4($t7)		#		lista[i+1]=t8;
	sw	$t9,0($t7)		#		lista[i]=t9;
	li	$t4,TRUE		#		houve_troca = TRUE;
step:					#	}
	addi	$t5,$t5,1		#	i++;
	j	for			#}
endfor:
	beq	$t4,TRUE,do		#while(houve_troca==TRUE)
#print previous sorted list
	li	$t0,0			# j = 0;
	li	$t3,SIZE
	sub	$t3,$t3,1		# t3 = SIZE -1
	
while2:
	bge	$t0,SIZE,endw		# whilhe(j < SIZE){ 
	la	$t1,lista		# t1= lista;
	sll	$t2,$t0,2		# i = i*4
	addu	$t2,$t2,$t1		# t2 = lista[j];
	lw	$t3,0($t2)		# lista[j]= ;
	or	$a0,$0,$t3
	ori	$v0,$0,print_int	#
	syscall				#	print_int10(lista[i]);
	la	$a0,str2		
	addiu	$v0,$0,print_str	#
	syscall				# 	print_str(str2);
	addi	$t0,$t0,1		# j++;
	j	while2			#}
endw:
	jr	$ra

	