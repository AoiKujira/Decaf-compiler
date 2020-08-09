.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Point_this: .word 0
yVal0: .word 0
xVal0: .word 0
tempo3: .word 0
_____0_____: .word 0
tempo4: .word 0
_____4_____: .word 4
___tempo0___: .asciiz  "["
tempo0: .word 0
___tempo1___: .asciiz  ", "
tempo1: .word 0
___tempo2___: .asciiz  "]\n"
tempo2: .word 0
tempo5: .word 0
tempo6: .word 0
Rect_this: .word 0
h0: .word 0
w0: .word 0
y0: .word 0
x0: .word 0
tempo7: .word 2
tempo8: .word 0
_____8_____: .word 8
tempo32: .word 0
tempo9: .word 0
tempo10: .word 0
___tempo10___: .word 8
tempo11: .word 0
tempo33: .word 0
tempo12: .word 0
tempo14: .word 0
tempo34: .word 0
tempo15: .word 1
tempo16: .word 0
___tempo16___: .word 8
tempo17: .word 0
tempo35: .word 0
tempo18: .word 1
tempo19: .word 0
tempo20: .word 0
tempo22: .word 0
tempo36: .word 0
___tempo23___: .asciiz  "{\n lower left = "
tempo23: .word 0
tempo24: .word 0
tempo26: .word 0
tempo37: .word 0
___tempo27___: .asciiz  " upper right = "
tempo27: .word 0
tempo28: .word 1
tempo30: .word 0
tempo38: .word 0
___tempo31___: .asciiz  "}\n"
tempo31: .word 0
tempo39: .word 0
___tempo39___: .word 8
r5: .word 0
tempo40: .word 10
tempo41: .word 10
tempo42: .word 5
tempo43: .word 28

.text
main:
b ___main___
Point_Init:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Point_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, yVal0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, xVal0
lw $t1, Point_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
lw $t8, xVal0
sw $t8, ($t9)
lw $t1, Point_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
lw $t8, yVal0
sw $t8, ($t9)
jr $ra
Point_PrintSelf:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Point_this
la $t9, ___tempo0___
sw $t9, tempo0
la $t9, ___tempo1___
sw $t9, tempo1
la $t9, ___tempo2___
sw $t9, tempo2
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

lw $t1, Point_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
lw $t9, ($t9)
sw $t9, tempo5
lw $t9, tempo5
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo1
li	$v0, 4
move	$a0, $t9
syscall

lw $t1, Point_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
lw $t9, ($t9)
sw $t9, tempo6
lw $t9, tempo6
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo2
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jr $ra
Rect_Init:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Rect_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, h0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, w0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, y0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
lw $t1, tempo7
lw $t2, _____8_____
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
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo32
lw $t9, tempo32
lw $t8, tempo8
sw $t8, ($t9)
lw	$t9, ___tempo10___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo10
lw $t1, _____4_____
lw $t2, tempo9
mul $t3, $t1, $t2
sw $t3, tempo11
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo33
lw $t9, tempo33
lw $t9, ($t9)
sw $t9, tempo33
lw $t1, tempo33
lw $t2, tempo11
add $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
lw $t8, tempo10
sw $t8, ($t9)
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, x0
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, y0
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t1, _____4_____
lw $t2, tempo12
mul $t3, $t1, $t2
sw $t3, tempo14
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo34
lw $t9, tempo34
lw $t9, ($t9)
sw $t9, tempo34
lw $t1, tempo34
lw $t2, tempo14
add $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
lw $t9, ($t9)
sw $t9, tempo14
lw $t9, tempo14
addi $sp, $sp, -4
sw $t9, ($sp)
jal Point_Init
lw $ra, ($sp)
addi $sp, $sp, 4
lw	$t9, ___tempo16___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo16
lw $t1, _____4_____
lw $t2, tempo15
mul $t3, $t1, $t2
sw $t3, tempo17
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo35
lw $t9, tempo35
lw $t9, ($t9)
sw $t9, tempo35
lw $t1, tempo35
lw $t2, tempo17
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t8, tempo16
sw $t8, ($t9)
lw $t1, x0
lw $t2, w0
add $t3, $t1, $t2
sw $t3, tempo19
lw $t1, y0
lw $t2, h0
add $t3, $t1, $t2
sw $t3, tempo20
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo19
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo20
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t1, _____4_____
lw $t2, tempo18
mul $t3, $t1, $t2
sw $t3, tempo22
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo36
lw $t9, tempo36
lw $t9, ($t9)
sw $t9, tempo36
lw $t1, tempo36
lw $t2, tempo22
add $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
lw $t9, ($t9)
sw $t9, tempo22
lw $t9, tempo22
addi $sp, $sp, -4
sw $t9, ($sp)
jal Point_Init
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
Rect_PrintSelf:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Rect_this
la $t9, ___tempo23___
sw $t9, tempo23
lw $t9, tempo23
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, _____4_____
lw $t2, tempo24
mul $t3, $t1, $t2
sw $t3, tempo26
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo37
lw $t9, tempo37
lw $t9, ($t9)
sw $t9, tempo37
lw $t1, tempo37
lw $t2, tempo26
add $t3, $t1, $t2
sw $t3, tempo26
lw $t9, tempo26
lw $t9, ($t9)
sw $t9, tempo26
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo26
addi $sp, $sp, -4
sw $t9, ($sp)
jal Point_PrintSelf
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo27___
sw $t9, tempo27
lw $t9, tempo27
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, _____4_____
lw $t2, tempo28
mul $t3, $t1, $t2
sw $t3, tempo30
lw $t1, Rect_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo38
lw $t9, tempo38
lw $t9, ($t9)
sw $t9, tempo38
lw $t1, tempo38
lw $t2, tempo30
add $t3, $t1, $t2
sw $t3, tempo30
lw $t9, tempo30
lw $t9, ($t9)
sw $t9, tempo30
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo30
addi $sp, $sp, -4
sw $t9, ($sp)
jal Point_PrintSelf
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo31___
sw $t9, tempo31
lw $t9, tempo31
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jr $ra
___main___:
la $ra, _____EndOfWorld_____
lw	$t9, ___tempo39___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo39
lw $t9, tempo39
sw $t9, r5
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo40
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo41
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo42
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo43
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, r5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Rect_Init
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, r5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Rect_PrintSelf
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
