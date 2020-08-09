.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz  "input your name:"
tempo0: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

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
