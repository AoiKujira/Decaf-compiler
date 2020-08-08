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
tempo4: .word 0
tempo5: .word 0
tempo6: .word 0
tempo7: .word 0
z1: .word 0

.text
main:
j ___main___
___main___:
la $ra,EndOfWorld
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
lw $t2, c1
mul $t3, $t1, $t2
sw $t3, tempo4
lw $t1, a1
lw $t2, tempo4
add $t3, $t1, $t2
sw $t3, tempo5
lw $t1, d1
lw $t2, a1
div $t3, $t1, $t2
sw $t3, tempo6
lw $t1, tempo5
lw $t2, tempo6
sub $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
sw $t9, z1
lw $t9, z1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
EndOfWorld:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
