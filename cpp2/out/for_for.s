.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
i1: .word 0
tempo1: .word 3
tempo2: .word 0
tempo3: .word 1
tempo4: .word 0
j1: .word 0
tempo5: .word 0
tempo6: .word 0
tempo7: .word 1
tempo8: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
sw $t9, i1
l0:
lw $t1, i1
lw $t2, tempo1
slt $t3, $t1, $t2
sw $t3, tempo2
lw $t9, tempo2
beqz $t9, l2
j l1
l3:
lw $t1, i1
lw $t2, tempo3
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
sw $t9, i1
j l0
l1:
lw $t9, i1
sw $t9, j1
l4:
lw $t1, tempo5
lw $t2, j1
sle $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
beqz $t9, l6
j l5
l7:
lw $t1, j1
lw $t2, tempo7
sub $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
sw $t9, j1
j l4
l5:
lw $t9, i1
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, j1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
j l7
l6:
j l3
l2:
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
