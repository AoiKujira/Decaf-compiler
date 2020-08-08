.data
____true____: .asciiz "true"
____false____: .asciiz "false"
items0: .word 0
n1: .word 0
tempo1: .word 0
i1: .word 0
tempo2: .word 1
tempo3: .word 0
tempo4: .word 0
tempo5: .word 1
tempo6: .word 0
tempo7: .word 0
j1: .word 0
tempo8: .word 0
tempo9: .word 1
tempo10: .word 0
tempo11: .word 0
tempo12: .word 1
tempo13: .word 0
tempo14: .word 0
_____4_____: .word 4
tempo15: .word 1
tempo16: .word 0
tempo17: .word 0
tempo18: .word 0
tempo19: .word 0
t2: .word 0
tempo20: .word 1
tempo21: .word 0
tempo22: .word 0
tempo23: .word 0
tempo24: .word 1
tempo25: .word 0
tempo26: .word 0
___tempo27___: .asciiz  "Please enter the numbers (max count: 100, enter -1 to end sooner): "
tempo27: .word 0
tempo28: .word 100
tempo29: .word 0
rawitems3: .word 0
tempo30: .word 0
i3: .word 0
tempo31: .word 100
tempo32: .word 0
tempo33: .word 1
tempo34: .word 0
tempo35: .word 0
x4: .word 0
tempo36: .word 1
tempo37: .word 0
tempo38: .word 0
tempo39: .word 0
tempo40: .word 0
items3: .word 0
tempo41: .word 0
j3: .word 0
tempo42: .word 0
tempo43: .word 1
tempo44: .word 0
tempo45: .word 0
tempo46: .word 0
___tempo48___: .asciiz  "After sort: "
tempo48: .word 0
tempo49: .word 0
tempo51: .word 0
tempo52: .word 1
tempo53: .word 0
tempo54: .word 0

.text
main:
j ___main___
sort:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, items0
lw $t9, tempo0
sw $t9, n1
lw $t9, tempo1
sw $t9, i1
l0:
lw $t1, n1
lw $t2, tempo2
sub $t3, $t1, $t2
sw $t3, tempo3
lw $t1, i1
lw $t2, tempo3
slt $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
beqz $t9, l2
j l1
l3:
lw $t1, i1
lw $t2, tempo5
add $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
sw $t9, i1
j l0
l1:
lw $t9, tempo7
sw $t9, j1
l4:
lw $t1, n1
lw $t2, i1
sub $t3, $t1, $t2
sw $t3, tempo8
lw $t1, tempo8
lw $t2, tempo9
sub $t3, $t1, $t2
sw $t3, tempo10
lw $t1, j1
lw $t2, tempo10
slt $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
beqz $t9, l6
j l5
l7:
lw $t1, j1
lw $t2, tempo12
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
sw $t9, j1
j l4
l5:
lw $t1, _____4_____
lw $t2, j1
mul $t3, $t1, $t2
sw $t3, tempo14
lw $t1, items0
lw $t2, tempo14
add $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
lw $t9, ($t9)
sw $t9, tempo14
lw $t1, j1
lw $t2, tempo15
add $t3, $t1, $t2
sw $t3, tempo16
lw $t1, _____4_____
lw $t2, tempo16
mul $t3, $t1, $t2
sw $t3, tempo17
lw $t1, items0
lw $t2, tempo17
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t9, ($t9)
sw $t9, tempo17
lw $t1, tempo17
lw $t2, tempo14
slt $t3, $t1, $t2
sw $t3, tempo18
lw $t9, tempo18
beqz $t9, l8
lw $t1, _____4_____
lw $t2, j1
mul $t3, $t1, $t2
sw $t3, tempo19
lw $t1, items0
lw $t2, tempo19
add $t3, $t1, $t2
sw $t3, tempo19
lw $t9, tempo19
lw $t9, ($t9)
sw $t9, tempo19
lw $t9, tempo19
sw $t9, t2
lw $t1, j1
lw $t2, tempo20
add $t3, $t1, $t2
sw $t3, tempo21
lw $t1, _____4_____
lw $t2, tempo21
mul $t3, $t1, $t2
sw $t3, tempo22
lw $t1, items0
lw $t2, tempo22
add $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
lw $t9, ($t9)
sw $t9, tempo22
lw $t1, _____4_____
lw $t2, j1
mul $t3, $t1, $t2
sw $t3, tempo23
lw $t1, items0
lw $t2, tempo23
add $t3, $t1, $t2
sw $t3, tempo23
lw $t9, tempo23
lw $t8, tempo22
sw $t8, ($t9)
lw $t1, j1
lw $t2, tempo24
add $t3, $t1, $t2
sw $t3, tempo25
lw $t1, _____4_____
lw $t2, tempo25
mul $t3, $t1, $t2
sw $t3, tempo26
lw $t1, items0
lw $t2, tempo26
add $t3, $t1, $t2
sw $t3, tempo26
lw $t9, tempo26
lw $t8, t2
sw $t8, ($t9)
l8:
j l7
l6:
j l3
l2:
jr $ra
___main___:
la $ra, _______End_Of_The_World_______
la $t9, ___tempo27___
sw $t9, tempo27
lw $t9, tempo27
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, tempo28
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo29
lw	$t9, tempo29
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo29
lw $t1, tempo29
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo29
lw $t9, tempo29
sw $t9, rawitems3
lw $t9, tempo30
sw $t9, i3
l9:
lw $t1, i3
lw $t2, tempo31
slt $t3, $t1, $t2
sw $t3, tempo32
lw $t9, tempo32
beqz $t9, l11
j l10
l12:
lw $t1, i3
lw $t2, tempo33
add $t3, $t1, $t2
sw $t3, tempo34
lw $t9, tempo34
sw $t9, i3
j l9
l10:
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo35
lw $t9, tempo35
sw $t9, x4
lw $t1, (-1)
lw $t2, tempo36
mul $t3, $t1, $t2
sw $t3, tempo37
lw $t1, x4
lw $t2, tempo37
seq $t3, $t1, $t2
sw $t3, tempo38
lw $t9, tempo38
beqz $t9, l13
j l11
l13:
lw $t1, _____4_____
lw $t2, i3
mul $t3, $t1, $t2
sw $t3, tempo39
lw $t1, rawitems3
lw $t2, tempo39
add $t3, $t1, $t2
sw $t3, tempo39
lw $t9, tempo39
lw $t8, x4
sw $t8, ($t9)
j l12
l11:
lw $t1, i3
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo40
lw	$t9, tempo40
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo40
lw $t1, tempo40
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo40
lw $t9, tempo40
sw $t9, items3
lw $t9, tempo41
sw $t9, j3
l14:
lw $t1, j3
lw $t2, i3
slt $t3, $t1, $t2
sw $t3, tempo42
lw $t9, tempo42
beqz $t9, l16
j l15
l17:
lw $t1, j3
lw $t2, tempo43
add $t3, $t1, $t2
sw $t3, tempo44
lw $t9, tempo44
sw $t9, j3
j l14
l15:
lw $t1, _____4_____
lw $t2, j3
mul $t3, $t1, $t2
sw $t3, tempo45
lw $t1, rawitems3
lw $t2, tempo45
add $t3, $t1, $t2
sw $t3, tempo45
lw $t9, tempo45
lw $t9, ($t9)
sw $t9, tempo45
lw $t1, _____4_____
lw $t2, j3
mul $t3, $t1, $t2
sw $t3, tempo46
lw $t1, items3
lw $t2, tempo46
add $t3, $t1, $t2
sw $t3, tempo46
lw $t9, tempo46
lw $t8, tempo45
sw $t8, ($t9)
j l17
l16:
lw $t9, items3
subi $sp, $sp, 4
sw $t9, ($sp)
jal sort
la $t9, ___tempo48___
sw $t9, tempo48
lw $t9, tempo48
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo49
sw $t9, i3
l18:
lw $t1, i3
lw $t2, tempo50
slt $t3, $t1, $t2
sw $t3, tempo51
lw $t9, tempo51
beqz $t9, l20
j l19
l21:
lw $t1, i3
lw $t2, tempo52
add $t3, $t1, $t2
sw $t3, tempo53
lw $t9, tempo53
sw $t9, i3
j l18
l19:
lw $t1, _____4_____
lw $t2, i3
mul $t3, $t1, $t2
sw $t3, tempo54
lw $t1, items3
lw $t2, tempo54
add $t3, $t1, $t2
sw $t3, tempo54
lw $t9, tempo54
lw $t9, ($t9)
sw $t9, tempo54
lw $t9, tempo54
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
j l21
l20:
jr $ra
_______End_Of_The_World_______:
li	$v0, 10
syscall
