.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 2
i1: .word 0
tempo1: .word 7
tempo2: .word 0
tempo3: .word 1
tempo4: .word 0
tempo5: .word 2
j1: .word 0
tempo6: .word 6
tempo7: .word 0
tempo8: .word 1
tempo9: .word 0
tempo10: .word 0
tempo11: .word 10
tempo12: .word 0
___tempo13___: .asciiz  "\n"
tempo13: .word 0
tempo14: .word 5
tempo15: .word 0
___tempo16___: .asciiz  "done"
tempo16: .word 0

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
lw $t9, tempo5
sw $t9, j1
l4:
lw $t1, j1
lw $t2, tempo6
slt $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
beqz $t9, l6
j l5
l7:
lw $t1, j1
lw $t2, tempo8
add $t3, $t1, $t2
sw $t3, tempo9
lw $t9, tempo9
sw $t9, j1
j l4
l5:
lw $t1, i1
lw $t2, j1
mul $t3, $t1, $t2
sw $t3, tempo10
lw $t1, tempo10
lw $t2, tempo11
seq $t3, $t1, $t2
sw $t3, tempo12
lw $t9, tempo12
beqz $t9, l8
j l6
l8:
la $t9, ___tempo13___
sw $t9, tempo13
lw $t9, i1
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, j1
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo13
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l7
l6:
lw $t1, i1
lw $t2, tempo14
seq $t3, $t1, $t2
sw $t3, tempo15
lw $t9, tempo15
beqz $t9, l9
j l2
l9:
j l3
l2:
la $t9, ___tempo16___
sw $t9, tempo16
lw $t9, tempo16
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
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
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
