.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
a1: .word 0
tempo1: .word 0
b1: .word 0

.text
main:
j ___main___
___main___:
la $ra, _______EndOfTheWorld_______
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo0
lw $t9, tempo0
sw $t9, a1
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo1
lw $t9, tempo1
sw $t9, b1
lw $t9, a1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, b1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
_______EndOfTheWorld_______:
li	$v0, 10
syscall
