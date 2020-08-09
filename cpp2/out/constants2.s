.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 1
tempo1: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
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
lw $t9, tempo1
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
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
