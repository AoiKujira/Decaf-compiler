.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 1
tempo1: .word 1
tempo2: .word 2
tempo3: .word 3
tempo4: .word 1
tempo5: .word 4

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
beqz $t9, l0
lw $t9, tempo1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
j l1
l0:
lw $t9, tempo2
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
l1:
lw $t9, tempo3
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo4
beqz $t9, l2
lw $t9, tempo5
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
l2:
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
