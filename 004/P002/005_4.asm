# AULA PRATICA Nº 5

# EX 4

# Mapa de Registos:
# t0 - 
# t1 - aux
# t2 - *(p+1)
# t3 - SIZE
# t4 - houve_troca
# t5 - p
# t6 - pultimo
# t7 - *p

	.data
	.eqv	SIZE,5
	.eqv	FALSE,0
	.eqv	TRUE,1
str1:	.asciiz	"\n Introduza um numero: \n"
str2:	.asciiz	"; "
	.align	2
lista:	.word	0:SIZE
	.eqv	read_int,5
	.eqv	print_int,1
	.eqv	print_str,4
	.text
	.globl main
main:
	la	$a0,str1
	la	$t5,lista		# t5 = lista = p
	li	$t3,SIZE		# t3 = SIZE
	sll	$t3,$t3,2		# size = size*4
	addu	$t6,$t5,$t3		# pultimo = lista + SIZE*4 
# filling the list
for:
	bge	$t5,$t6,endfor		# for (p < pultimo){
	ori	$v0,$0,print_str	#
	syscall				# 	print_str(str1);
	addi	$v0,$0,read_int		#
	syscall				#	v0 = read_int();
	sw	$v0,0($t5)		#	*p = read_int;
	addi	$t5,$t5,4		#	i=i+4;
	j for				#}
endfor:
	la	$t5,lista		# t5 = lista = p
	li	$t3,SIZE		# t3 = SIZE
	subu	$t3, $t3, 1
	sll	$t3,$t3,2		# size = size*4
	addu	$t6,$t5,$t3		# pultimo = lista + SIZE*4 
# sort list
do:	
	la	$t5, lista				
					# do{
	li	$t4,FALSE		#	houveTroca = FALSE;
for2:	
	bge	$t5,$t6,endfor2		# 	for(p< pUltimo){
	lw	$t7,0($t5)		#		t7 = *p;
	lw	$t2,4($t5)		#		t2 = *(p+1);
	ble	$t7,$t2,endif		#		if(*p > *(p+1)){
	sw	$t2,0($t5)		#			aux = *p;
	sw	$t7,4($t5)		#			*p = *(p+1);
	li	$t4,TRUE		#			houveTroca = TRUE;
endif:					#		}	
	addiu	$t5,$t5,4		# 		i++;
	j	for2			#	}
endfor2:
	beq	$t4,TRUE,do		# while(houveTroca==TRUE);

# print sorted list
	la	$t5,lista		# t5 = lista = p
	li	$t3,SIZE		# t3 = SIZE
	sll	$t3,$t3,2		# size = size*4
	addu	$t6,$t5,$t3		# pultimo = lista + SIZE*4 
for3:
	bge	$t5,$t6,endfor3		# for(p < SIZE){
	lw	$a0,0($t5)		# 	t5 = *p;
	ori	$v0,$0,print_int	#	
	syscall				#	print_int(t5);
	la	$a0,str2		
	ori	$v0,$0,print_str
	syscall				#	print_str(; );
	addi	$t5,$t5,4		#	i++;
	j	for3			#}
endfor3:
	jr	$ra