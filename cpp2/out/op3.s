.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
tempo1: .word 1
tempo2: .word 0
tempo3: .word 0
tempo4: .word 0
tempo5: .word 0
tempo6: .word 1
tempo7: .word 1
tempo8: .word 0
tempo9: .word 1
tempo10: .word 0
tempo11: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t1, tempo0
lw $t2, tempo1
seq $t3, $t1, $t2
sw $t3, tempo2
lw $t9, tempo2
beqz $t9, ____printFalse0____
____printTrue0____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd0____
____printFalse0____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd0____:
li	$v0, 11
li	$a0, 10
syscall
lw $t1, tempo3
lw $t2, tempo4
seq $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
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
lw $t1, tempo6
lw $t2, tempo7
seq $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
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
lw $t1, tempo9
lw $t2, tempo10
seq $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
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
