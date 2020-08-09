.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 1
tempo1: .word 1
tempo2: .word 0
tempo3: .word 10
tempo4: .word 5
tempo5: .word 0
tempo6: .word 21
tempo7: .word 3
tempo8: .word 0
tempo9: .word 345
tempo10: .word 56
tempo11: .word 0
tempo12: .word 82
tempo13: .word 9
tempo14: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t1, tempo0
lw $t2, tempo1
add $t3, $t1, $t2
sw $t3, tempo2
lw $t9, tempo2
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, tempo3
lw $t2, tempo4
sub $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, tempo6
lw $t2, tempo7
div $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, tempo9
lw $t2, tempo10
mul $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, tempo12
lw $t2, tempo13
rem $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
li	$v0, 1
move 	$a0, $t9
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
