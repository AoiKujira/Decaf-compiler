.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz  "not"
tempo0: .word 0
s1: .word 0
___tempo1___: .asciiz  "something else"
tempo1: .word 0
tempo2: .word 0
___tempo3___: .asciiz  "not"
tempo3: .word 0
tempo4: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
sw $t9, s1
la $t9, ___tempo1___
sw $t9, tempo1
lw $t1, s1
lw $t2, tempo1
____loop0____:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3, ____checkt20____ #str1 end
beqz $t4, ____missmatch0____
seq $t5,$t3,$t4  #compare two bytes
beqz $t5, ____missmatch0____
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j ____loop0____
____missmatch0____:
add $v0, $zero, $zero
addi $v1, $zero, 1
j ____endfunction0____
____checkt20____:
bnez $t4, ____missmatch0____
addi $v0, $zero, 1
add $v1, $zero, $zero
____endfunction0____:
sw $v1, tempo2
lw $t9, tempo2
beqz $t9, ____printFalse1____
____printTrue1____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd1____
____printFalse1____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd1____:
li	$v0, 11
li	$a0, 10
syscall
la $t9, ___tempo3___
sw $t9, tempo3
lw $t1, s1
lw $t2, tempo3
____loop2____:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3, ____checkt22____ #str1 end
beqz $t4, ____missmatch2____
seq $t5,$t3,$t4  #compare two bytes
beqz $t5, ____missmatch2____
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j ____loop2____
____missmatch2____:
add $v0, $zero, $zero
addi $v1, $zero, 1
j ____endfunction2____
____checkt22____:
bnez $t4, ____missmatch2____
addi $v0, $zero, 1
add $v1, $zero, $zero
____endfunction2____:
sw $v1, tempo4
lw $t9, tempo4
beqz $t9, ____printFalse3____
____printTrue3____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd3____
____printFalse3____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd3____:
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
