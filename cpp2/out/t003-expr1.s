.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
a1: .word 0
tempo1: .word 0
b1: .word 0
tempo2: .word 0
c1: .word 0
tempo3: .word 0
d1: .word 0
tempo4: .word 5
tempo5: .word 0
tempo6: .word 0
z1: .word 0
tempo7: .word 0
tempo8: .word 2
tempo9: .word 0
tempo10: .word 0
tempo11: .word 0
tempo12: .word 0
tempo13: .word 0
tempo14: .word 0
tempo15: .word 0
tempo16: .word 0
tempo17: .word 0
tempo18: .word 0
tempo19: .word 0
tempo20: .word 0

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
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo2
lw $t9, tempo2
sw $t9, c1
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo3
lw $t9, tempo3
sw $t9, d1
lw $t1, b1
lw $t2, tempo4
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t1, a1
lw $t2, tempo5
add $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
sw $t9, z1
lw $t1, z1
lw $t2, d1
mul $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
sw $t9, a1
lw $t1, tempo8
lw $t2, a1
mul $t3, $t1, $t2
sw $t3, tempo9
lw $t1, a1
lw $t2, b1
add $t3, $t1, $t2
sw $t3, tempo10
lw $t1, c1
lw $t2, d1
add $t3, $t1, $t2
sw $t3, tempo11
lw $t1, tempo10
lw $t2, tempo11
div $t3, $t1, $t2
sw $t3, tempo12
lw $t1, tempo9
lw $t2, tempo12
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
sw $t9, z1
lw $t1, z1
lw $t2, a1
div $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
sw $t9, b1
lw $t1, b1
lw $t2, a1
mul $t3, $t1, $t2
sw $t3, tempo15
lw $t1, tempo15
lw $t2, z1
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
sw $t9, c1
lw $t1, a1
lw $t2, b1
sub $t3, $t1, $t2
sw $t3, tempo17
lw $t1, tempo17
lw $t2, c1
sub $t3, $t1, $t2
sw $t3, tempo18
lw $t1, tempo18
lw $t2, d1
sub $t3, $t1, $t2
sw $t3, tempo19
lw $t1, tempo19
lw $t2, z1
sub $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
sw $t9, d1
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
lw $t9, c1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, d1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, z1
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
