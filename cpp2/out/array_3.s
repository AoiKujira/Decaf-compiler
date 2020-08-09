.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 3
tempo1: .word 0
_____4_____: .word 4
s1: .word 0
tempo2: .word 0
tempo3: .word 2
tempo4: .word 0
tempo5: .word 0
tempo6: .word 1
tempo7: .word 2
tempo8: .word 0
tempo9: .word 0
tempo10: .word 2
tempo11: .word 2
tempo12: .word 0
tempo13: .word 0
tempo14: .word 0
tempo15: .word 0
___tempo16___: .asciiz  "a00"
tempo16: .word 0
tempo17: .word 0
tempo18: .word 0
tempo19: .word 1
___tempo20___: .asciiz  "a01"
tempo20: .word 0
tempo21: .word 0
tempo22: .word 1
tempo23: .word 0
___tempo24___: .asciiz  "a10"
tempo24: .word 0
tempo25: .word 0
tempo26: .word 1
tempo27: .word 0
___tempo28___: .asciiz  "a10"
tempo28: .word 0
tempo29: .word 0
tempo30: .word 1
tempo31: .word 1
___tempo32___: .asciiz  "a11"
tempo32: .word 0
tempo33: .word 0
tempo34: .word 2
tempo35: .word 0
___tempo36___: .asciiz  "a20"
tempo36: .word 0
tempo37: .word 0
tempo38: .word 2
tempo39: .word 1
___tempo40___: .asciiz  "a21"
tempo40: .word 0
tempo41: .word 0
tempo42: .word 0
i1: .word 0
tempo43: .word 3
tempo44: .word 0
tempo45: .word 1
tempo46: .word 0
tempo47: .word 0
j1: .word 0
tempo48: .word 2
tempo49: .word 0
tempo50: .word 1
tempo51: .word 0
tempo52: .word 0
tempo53: .word 1
tempo54: .word 1
tempo55: .word 0
tempo56: .word 0
tempo57: .word 0
tempo58: .word 0
tempo59: .word 0
tempo60: .word 0
___tempo61___: .asciiz  "sbc"
tempo61: .word 0
tempo62: .word 0
tempo63: .word 1
tempo64: .word 1
tempo65: .word 0
tempo66: .word 0
tempo67: .word 0
tempo68: .word 0

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
sw $t9, s1
lw $t1, tempo3
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo4
lw $t1, tempo4
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw	$t9, tempo4
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo4
lw $t9, tempo4
lw $t8, tempo3
sw $t8, ($t9)
lw $t1, tempo4
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw $t1, _____4_____
lw $t2, tempo2
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t1, s1
lw $t2, tempo5
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
lw $t8, tempo4
sw $t8, ($t9)
lw $t1, tempo7
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo8
lw $t1, tempo8
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo8
lw	$t9, tempo8
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo8
lw $t9, tempo8
lw $t8, tempo7
sw $t8, ($t9)
lw $t1, tempo8
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo8
lw $t1, _____4_____
lw $t2, tempo6
mul $t3, $t1, $t2
sw $t3, tempo9
lw $t1, s1
lw $t2, tempo9
add $t3, $t1, $t2
sw $t3, tempo9
lw $t9, tempo9
lw $t8, tempo8
sw $t8, ($t9)
lw $t1, tempo11
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo12
lw $t1, tempo12
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo12
lw	$t9, tempo12
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo12
lw $t9, tempo12
lw $t8, tempo11
sw $t8, ($t9)
lw $t1, tempo12
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo12
lw $t1, _____4_____
lw $t2, tempo10
mul $t3, $t1, $t2
sw $t3, tempo13
lw $t1, s1
lw $t2, tempo13
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
lw $t8, tempo12
sw $t8, ($t9)
la $t9, ___tempo16___
sw $t9, tempo16
lw $t1, _____4_____
lw $t2, tempo15
mul $t3, $t1, $t2
sw $t3, tempo17
lw $t1, s1
lw $t2, tempo17
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t8, tempo16
sw $t8, ($t9)
la $t9, ___tempo20___
sw $t9, tempo20
lw $t1, _____4_____
lw $t2, tempo19
mul $t3, $t1, $t2
sw $t3, tempo21
lw $t1, s1
lw $t2, tempo21
add $t3, $t1, $t2
sw $t3, tempo21
lw $t9, tempo21
lw $t8, tempo20
sw $t8, ($t9)
la $t9, ___tempo24___
sw $t9, tempo24
lw $t1, _____4_____
lw $t2, tempo23
mul $t3, $t1, $t2
sw $t3, tempo25
lw $t1, s1
lw $t2, tempo25
add $t3, $t1, $t2
sw $t3, tempo25
lw $t9, tempo25
lw $t8, tempo24
sw $t8, ($t9)
la $t9, ___tempo28___
sw $t9, tempo28
lw $t1, _____4_____
lw $t2, tempo27
mul $t3, $t1, $t2
sw $t3, tempo29
lw $t1, s1
lw $t2, tempo29
add $t3, $t1, $t2
sw $t3, tempo29
lw $t9, tempo29
lw $t8, tempo28
sw $t8, ($t9)
la $t9, ___tempo32___
sw $t9, tempo32
lw $t1, _____4_____
lw $t2, tempo31
mul $t3, $t1, $t2
sw $t3, tempo33
lw $t1, s1
lw $t2, tempo33
add $t3, $t1, $t2
sw $t3, tempo33
lw $t9, tempo33
lw $t8, tempo32
sw $t8, ($t9)
la $t9, ___tempo36___
sw $t9, tempo36
lw $t1, _____4_____
lw $t2, tempo35
mul $t3, $t1, $t2
sw $t3, tempo37
lw $t1, s1
lw $t2, tempo37
add $t3, $t1, $t2
sw $t3, tempo37
lw $t9, tempo37
lw $t8, tempo36
sw $t8, ($t9)
la $t9, ___tempo40___
sw $t9, tempo40
lw $t1, _____4_____
lw $t2, tempo39
mul $t3, $t1, $t2
sw $t3, tempo41
lw $t1, s1
lw $t2, tempo41
add $t3, $t1, $t2
sw $t3, tempo41
lw $t9, tempo41
lw $t8, tempo40
sw $t8, ($t9)
lw $t9, tempo42
sw $t9, i1
l0:
lw $t1, i1
lw $t2, tempo43
slt $t3, $t1, $t2
sw $t3, tempo44
lw $t9, tempo44
beqz $t9, l2
j l1
l3:
lw $t1, i1
lw $t2, tempo45
add $t3, $t1, $t2
sw $t3, tempo46
lw $t9, tempo46
sw $t9, i1
j l0
l1:
lw $t9, tempo47
sw $t9, j1
l4:
lw $t1, j1
lw $t2, tempo48
slt $t3, $t1, $t2
sw $t3, tempo49
lw $t9, tempo49
beqz $t9, l6
j l5
l7:
lw $t1, j1
lw $t2, tempo50
add $t3, $t1, $t2
sw $t3, tempo51
lw $t9, tempo51
sw $t9, j1
j l4
l5:
lw $t1, _____4_____
lw $t2, j1
mul $t3, $t1, $t2
sw $t3, tempo52
lw $t1, s1
lw $t2, tempo52
add $t3, $t1, $t2
sw $t3, tempo52
lw $t9, tempo52
lw $t9, ($t9)
sw $t9, tempo52
lw $t9, tempo52
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l7
l6:
j l3
l2:
lw $t1, _____4_____
lw $t2, tempo56
mul $t3, $t1, $t2
sw $t3, tempo57
lw $t1, s1
lw $t2, tempo57
add $t3, $t1, $t2
sw $t3, tempo57
lw $t9, tempo57
lw $t9, ($t9)
sw $t9, tempo57
lw $t1, _____4_____
lw $t2, tempo54
mul $t3, $t1, $t2
sw $t3, tempo58
lw $t1, s1
lw $t2, tempo58
add $t3, $t1, $t2
sw $t3, tempo58
lw $t9, tempo58
lw $t8, tempo57
sw $t8, ($t9)
la $t9, ___tempo61___
sw $t9, tempo61
lw $t1, _____4_____
lw $t2, tempo60
mul $t3, $t1, $t2
sw $t3, tempo62
lw $t1, s1
lw $t2, tempo62
add $t3, $t1, $t2
sw $t3, tempo62
lw $t9, tempo62
lw $t8, tempo61
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo64
mul $t3, $t1, $t2
sw $t3, tempo65
lw $t1, s1
lw $t2, tempo65
add $t3, $t1, $t2
sw $t3, tempo65
lw $t9, tempo65
lw $t9, ($t9)
sw $t9, tempo65
lw $t9, tempo65
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, _____4_____
lw $t2, tempo67
mul $t3, $t1, $t2
sw $t3, tempo68
lw $t1, s1
lw $t2, tempo68
add $t3, $t1, $t2
sw $t3, tempo68
lw $t9, tempo68
lw $t9, ($t9)
sw $t9, tempo68
lw $t9, tempo68
li	$v0, 4
move	$a0, $t9
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
