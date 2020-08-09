.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 1
tempo1: .word 0
tempo2: .word 0
tempo3: .word 1
tempo4: .word 0
tempo5: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t1, tempo0
lw $t2, tempo1
bnez $t1, ___Arg1Is1_0___
li $t3, 0
b ___endAndAnd_0___
___Arg1Is1_0___:
bnez $t2, ___Arg2IsAlso1_0___
li $t3, 0
b ___endAndAnd_0___
___Arg2IsAlso1_0___:
li $t3, 1
___endAndAnd_0___:
sw $t3, tempo2
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
lw $t1, tempo3
lw $t2, tempo4
beqz $t1, ___Arg1Is0_2___
li $t3, 1
b ___endOrOr_2___
___Arg1Is0_2___:
beqz $t2, ___Arg2IsAlso0_2___
li $t3, 1
b ___endOrOr_2___
___Arg2IsAlso0_2___:
li $t3, 0
___endOrOr_2___:
sw $t3, tempo5
lw $t9, tempo5
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
