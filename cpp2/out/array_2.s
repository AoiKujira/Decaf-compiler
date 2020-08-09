.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 3
tempo1: .word 0
_____4_____: .word 4
a1: .word 0
tempo2: .word 0
i1: .word 0
tempo3: .word 3
tempo4: .word 0
tempo5: .word 1
tempo6: .word 0
tempo7: .word 1
tempo8: .word 0
tempo9: .word 0
tempo10: .word 0
tempo11: .word 0
tempo12: .word 3
tempo13: .word 0
tempo14: .word 1
tempo15: .word 0
tempo16: .word 0
j1: .word 0
tempo17: .word 0
tempo18: .word 1
tempo19: .word 0
tempo20: .word 3
tempo21: .word 0
tempo22: .word 0
tempo23: .word 0
k1: .word 0
tempo24: .word 3
tempo25: .word 0
tempo26: .word 1
tempo27: .word 0
tempo28: .word 0
tempo29: .word 0
tempo30: .word 3
tempo31: .word 0
tempo32: .word 1
tempo33: .word 0
___tempo34___: .asciiz  "i "
tempo34: .word 0
tempo35: .word 0
tempo36: .word 0
tempo37: .word 1
tempo38: .word 0
___tempo39___: .asciiz  "j "
tempo39: .word 0
tempo40: .word 0
tempo41: .word 3
tempo42: .word 0
tempo43: .word 1
tempo44: .word 0
tempo45: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t1, tempo0
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
lw $t8, tempo0
sw $t8, ($t9)
lw $t1, tempo1
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
sw $t9, a1
lw $t9, tempo2
sw $t9, i1
l0:
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
lw $t1, i1
lw $t2, tempo7
add $t3, $t1, $t2
sw $t3, tempo8
lw $t1, tempo8
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo9
lw $t1, tempo9
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo9
lw	$t9, tempo9
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo9
lw $t9, tempo9
lw $t8, tempo8
sw $t8, ($t9)
lw $t1, tempo9
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo9
lw $t1, _____4_____
lw $t2, i1
mul $t3, $t1, $t2
sw $t3, tempo10
lw $t1, a1
lw $t2, tempo10
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
lw $t8, tempo9
sw $t8, ($t9)
j l3
l2:
lw $t9, tempo11
sw $t9, i1
l4:
lw $t1, i1
lw $t2, tempo12
slt $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
beqz $t9, l6
j l5
l7:
lw $t1, i1
lw $t2, tempo14
add $t3, $t1, $t2
sw $t3, tempo15
lw $t9, tempo15
sw $t9, i1
j l4
l5:
lw $t9, tempo16
sw $t9, j1
l8:
lw $t1, j1
lw $t2, i1
sle $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
beqz $t9, l10
j l9
l11:
lw $t1, j1
lw $t2, tempo18
add $t3, $t1, $t2
sw $t3, tempo19
lw $t9, tempo19
sw $t9, j1
j l8
l9:
lw $t1, tempo20
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo21
lw $t1, tempo21
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo21
lw	$t9, tempo21
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo21
lw $t9, tempo21
lw $t8, tempo20
sw $t8, ($t9)
lw $t1, tempo21
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo21
lw $t1, _____4_____
lw $t2, j1
mul $t3, $t1, $t2
sw $t3, tempo22
lw $t1, a1
lw $t2, tempo22
add $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
lw $t8, tempo21
sw $t8, ($t9)
lw $t9, tempo23
sw $t9, k1
l12:
lw $t1, k1
lw $t2, tempo24
slt $t3, $t1, $t2
sw $t3, tempo25
lw $t9, tempo25
beqz $t9, l14
j l13
l15:
lw $t1, k1
lw $t2, tempo26
add $t3, $t1, $t2
sw $t3, tempo27
lw $t9, tempo27
sw $t9, k1
j l12
l13:
lw $t1, _____4_____
lw $t2, k1
mul $t3, $t1, $t2
sw $t3, tempo28
lw $t1, a1
lw $t2, tempo28
add $t3, $t1, $t2
sw $t3, tempo28
lw $t9, tempo28
lw $t8, k1
sw $t8, ($t9)
j l15
l14:
j l11
l10:
j l7
l6:
lw $t9, tempo29
sw $t9, i1
l16:
lw $t1, i1
lw $t2, tempo30
slt $t3, $t1, $t2
sw $t3, tempo31
lw $t9, tempo31
beqz $t9, l18
j l17
l19:
lw $t1, i1
lw $t2, tempo32
add $t3, $t1, $t2
sw $t3, tempo33
lw $t9, tempo33
sw $t9, i1
j l16
l17:
la $t9, ___tempo34___
sw $t9, tempo34
lw $t9, tempo34
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, i1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo35
sw $t9, j1
l20:
lw $t1, j1
lw $t2, i1
sle $t3, $t1, $t2
sw $t3, tempo36
lw $t9, tempo36
beqz $t9, l22
j l21
l23:
lw $t1, j1
lw $t2, tempo37
add $t3, $t1, $t2
sw $t3, tempo38
lw $t9, tempo38
sw $t9, j1
j l20
l21:
la $t9, ___tempo39___
sw $t9, tempo39
lw $t9, tempo39
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, j1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo40
sw $t9, k1
l24:
lw $t1, k1
lw $t2, tempo41
slt $t3, $t1, $t2
sw $t3, tempo42
lw $t9, tempo42
beqz $t9, l26
j l25
l27:
lw $t1, k1
lw $t2, tempo43
add $t3, $t1, $t2
sw $t3, tempo44
lw $t9, tempo44
sw $t9, k1
j l24
l25:
lw $t1, _____4_____
lw $t2, k1
mul $t3, $t1, $t2
sw $t3, tempo45
lw $t1, a1
lw $t2, tempo45
add $t3, $t1, $t2
sw $t3, tempo45
lw $t9, tempo45
lw $t9, ($t9)
sw $t9, tempo45
lw $t9, tempo45
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
j l27
l26:
j l23
l22:
j l19
l18:
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
