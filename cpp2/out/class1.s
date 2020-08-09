.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Binky_this: .word 0
tempo0: .word 0
___tempo0___: .word 0
d2: .word 0
tempo1: .word 0
___tempo1___: .word 0
a2: .word 0

.text
main:
b ___main___
Binky_Method:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Binky_this
jr $ra
___main___:
la $ra, _____EndOfWorld_____
lw	$t9, ___tempo0___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo0
lw $t9, tempo0
sw $t9, d2
lw	$t9, ___tempo1___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo1
lw $t9, tempo1
sw $t9, a2
lw $t9, d2
sw $t9, a2
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
