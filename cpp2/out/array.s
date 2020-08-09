.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 5
len1: .word 0
tempo1: .word 0
_____4_____: .word 4
a1: .word 0
tempo2: .word 0
tempo3: .word 1
tempo4: .word 0
tempo5: .word 1
tempo6: .word 2
tempo7: .word 0
tempo8: .word 2
tempo9: .word 1
tempo10: .word 0
tempo11: .word 0
tempo12: .word 1
tempo13: .word 10
tempo14: .word 0
tempo15: .word 3
tempo16: .word 4
tempo17: .word 0
tempo18: .word 4
tempo19: .word 5
tempo20: .word 0
tempo21: .word 0
i1: .word 0
tempo22: .word 0
tempo23: .word 1
tempo24: .word 0
tempo25: .word 0
tempo26: .word 0
______4_____: .word -4

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
sw $t9, len1
lw $t1, len1
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo1
lw $t1, tempo1
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo1
lw	$t9, tempo1
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo1
lw $t9, tempo1
lw $t8, len1
sw $t8, ($t9)
lw $t1, tempo1
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
sw $t9, a1
lw $t1, _____4_____
lw $t2, tempo2
mul $t3, $t1, $t2
sw $t3, tempo4
lw $t1, a1
lw $t2, tempo4
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
lw $t8, tempo3
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo5
mul $t3, $t1, $t2
sw $t3, tempo7
lw $t1, a1
lw $t2, tempo7
add $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
lw $t8, tempo6
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo9
mul $t3, $t1, $t2
sw $t3, tempo10
lw $t1, a1
lw $t2, tempo10
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
lw $t9, ($t9)
sw $t9, tempo10
lw $t1, _____4_____
lw $t2, tempo8
mul $t3, $t1, $t2
sw $t3, tempo11
lw $t1, a1
lw $t2, tempo11
add $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
lw $t8, tempo10
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo12
mul $t3, $t1, $t2
sw $t3, tempo14
lw $t1, a1
lw $t2, tempo14
add $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
lw $t8, tempo13
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo15
mul $t3, $t1, $t2
sw $t3, tempo17
lw $t1, a1
lw $t2, tempo17
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t8, tempo16
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo18
mul $t3, $t1, $t2
sw $t3, tempo20
lw $t1, a1
lw $t2, tempo20
add $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
lw $t8, tempo19
sw $t8, ($t9)
lw $t9, tempo21
sw $t9, i1
l0:
lw $t1, i1
lw $t2, len1
slt $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
beqz $t9, l2
j l1
l3:
lw $t1, i1
lw $t2, tempo23
add $t3, $t1, $t2
sw $t3, tempo24
lw $t9, tempo24
sw $t9, i1
j l0
l1:
lw $t1, _____4_____
lw $t2, i1
mul $t3, $t1, $t2
sw $t3, tempo25
lw $t1, a1
lw $t2, tempo25
add $t3, $t1, $t2
sw $t3, tempo25
lw $t9, tempo25
lw $t9, ($t9)
sw $t9, tempo25
lw $t9, tempo25
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
j l3
l2:
lw $t9, a1
sw $t9, tempo26
lw $t1, tempo26
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo26
lw $t9, tempo26
lw $t9, ($t9)
sw $t9, tempo26
lw $t9, tempo26
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
