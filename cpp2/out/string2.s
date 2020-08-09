.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo0: .word 0
s1: .word 0
___tempo1___: .asciiz  "hello"
tempo1: .word 0
___tempo2___: .asciiz  "goodbye"
tempo2: .word 0
tempo3: .word 0
___tempo4___: .asciiz  "hello"
tempo4: .word 0
___tempo5___: .asciiz  "hello"
tempo5: .word 0
tempo6: .word 0
___tempo7___: .asciiz  "hello"
tempo7: .word 0
tempo8: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo0___
sw $t9, tempo0
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall
____len_to_new_line0____:
lb $t2, ($a0)
li $t3, 10
beq $t2, $t3, ____endofreadline0____
addi $a0, $a0, 1
b ____len_to_new_line0____
____endofreadline0____:
sb $zero, ($a0)
lw $t9, tempo0
sw $t9, s1
la $t9, ___tempo1___
sw $t9, tempo1
la $t9, ___tempo2___
sw $t9, tempo2
lw $t1, tempo1
lw $t2, tempo2
____loop1____:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3, ____checkt21____ #str1 end
beqz $t4, ____missmatch1____
seq $t5,$t3,$t4  #compare two bytes
beqz $t5, ____missmatch1____
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j ____loop1____
____missmatch1____:
add $v0, $zero, $zero
addi $v1, $zero, 1
j ____endfunction1____
____checkt21____:
bnez $t4, ____missmatch1____
addi $v0, $zero, 1
add $v1, $zero, $zero
____endfunction1____:
sw $v0, tempo3
lw $t9, tempo3
beqz $t9, ____printFalse2____
____printTrue2____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd2____
____printFalse2____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd2____:
li	$v0, 11
li	$a0, 10
syscall
la $t9, ___tempo4___
sw $t9, tempo4
la $t9, ___tempo5___
sw $t9, tempo5
lw $t1, tempo4
lw $t2, tempo5
____loop3____:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3, ____checkt23____ #str1 end
beqz $t4, ____missmatch3____
seq $t5,$t3,$t4  #compare two bytes
beqz $t5, ____missmatch3____
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j ____loop3____
____missmatch3____:
add $v0, $zero, $zero
addi $v1, $zero, 1
j ____endfunction3____
____checkt23____:
bnez $t4, ____missmatch3____
addi $v0, $zero, 1
add $v1, $zero, $zero
____endfunction3____:
sw $v0, tempo6
lw $t9, tempo6
beqz $t9, ____printFalse4____
____printTrue4____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd4____
____printFalse4____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd4____:
li	$v0, 11
li	$a0, 10
syscall
la $t9, ___tempo7___
sw $t9, tempo7
lw $t1, tempo7
lw $t2, s1
____loop5____:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3, ____checkt25____ #str1 end
beqz $t4, ____missmatch5____
seq $t5,$t3,$t4  #compare two bytes
beqz $t5, ____missmatch5____
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j ____loop5____
____missmatch5____:
add $v0, $zero, $zero
addi $v1, $zero, 1
j ____endfunction5____
____checkt25____:
bnez $t4, ____missmatch5____
addi $v0, $zero, 1
add $v1, $zero, $zero
____endfunction5____:
sw $v0, tempo8
lw $t9, tempo8
beqz $t9, ____printFalse6____
____printTrue6____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd6____
____printFalse6____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd6____:
li	$v0, 11
li	$a0, 10
syscall
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
