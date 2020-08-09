.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 15
c1: .word 0
tempo1: .word 0
tempo2: .word 0
tempo3: .word 0
tempo4: .word 2
tempo5: .word 0
b0: .word 0
a0: .word 0
tempo7: .word 1
tempo8: .word 0
tempo9: .word 0
tempo10: .word 1
tempo11: .word 0
c0: .word 0
tempo12: .word 3
tempo13: .word 0
tempo14: .word 4
tempo15: .word 5
tempo16: .word 0
d3: .word 0
___tempo17___: .asciiz  "\n"
tempo17: .word 0
tempo18: .word 0
tempo19: .word 0
tempo20: .word 0
tempo21: .word 3
tempo22: .word 0
b4: .word 0
tempo23: .word 3
tempo24: .word 0
tempo25: .word 0
c4: .word 0
tempo26: .word 3
tempo27: .word 0
tempo28: .word 0
___tempo29___: .asciiz  "\n"
tempo29: .word 0
tempo30: .word 0
i5: .word 0
tempo31: .word 4
tempo32: .word 0
tempo33: .word 1
tempo34: .word 0
tempo35: .word 10
tempo36: .word 0
tempo37: .word 0

.text
main:
b ___main___
SayHi:
lw $t9, tempo0
sw $t9, c1
lw $t9, tempo1
beqz $t9, l0
jr $ra
l0:
lw $t1, c1
lw $t2, c1
mul $t3, $t1, $t2
sw $t3, tempo2
lw $t1, c1
lw $t2, tempo2
sub $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
sw $t9, c1
lw $t1, tempo4
lw $t2, c1
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, c1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
one:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, b0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, a0
jal SayHi
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, a0
lw $t2, tempo7
sub $t3, $t1, $t2
sw $t3, tempo8
lw $t1, tempo8
lw $t2, b0
mul $t3, $t1, $t2
sw $t3, tempo9
lw $t1, tempo9
lw $t2, tempo10
add $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
two:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, b0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, c0
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, c0
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo12
addi $sp, $sp, -4
sw $t9, ($sp)
jal one
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo13
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo13
sw $t9, c0
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo14
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo15
addi $sp, $sp, -4
sw $t9, ($sp)
jal one
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo16
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo16
sw $t9, d3
la $t9, ___tempo17___
sw $t9, tempo17
lw $t9, c0
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, d3
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo17
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, c0
lw $t2, d3
slt $t3, $t1, $t2
sw $t3, tempo18
lw $t9, tempo18
sw $t9, b0
lw $t9, b0
beqz $t9, l1
lw $t1, c0
lw $t2, d3
mul $t3, $t1, $t2
sw $t3, tempo19
lw $t9, tempo19
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
j l2
l1:
lw $t1, c0
lw $t2, d3
div $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l2:
jr $ra
three:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, a0
lw $t1, tempo21
lw $t2, a0
mul $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
sw $t9, b4
lw $t1, b4
lw $t2, tempo23
seq $t3, $t1, $t2
sw $t3, tempo24
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, b4
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo24
addi $sp, $sp, -4
sw $t9, ($sp)
jal two
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo25
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo25
sw $t9, c4
lw $t1, b4
lw $t2, tempo26
seq $t3, $t1, $t2
sw $t3, tempo27
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, c4
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo27
addi $sp, $sp, -4
sw $t9, ($sp)
jal two
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo28
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo28
sw $t9, b4
la $t9, ___tempo29___
sw $t9, tempo29
lw $t9, b4
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, c4
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo29
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jr $ra
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo30
sw $t9, i5
l3:
lw $t1, i5
lw $t2, tempo31
slt $t3, $t1, $t2
sw $t3, tempo32
lw $t9, tempo32
beqz $t9, l5
j l4
l6:
lw $t1, i5
lw $t2, tempo33
add $t3, $t1, $t2
sw $t3, tempo34
lw $t9, tempo34
sw $t9, i5
j l3
l4:
lw $t1, i5
lw $t2, tempo35
mul $t3, $t1, $t2
sw $t3, tempo36
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo36
addi $sp, $sp, -4
sw $t9, ($sp)
jal three
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo37
lw $ra, ($sp)
addi $sp, $sp, 4
j l6
l5:
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
