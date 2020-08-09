.data
____true____: .asciiz "true"
____false____: .asciiz "false"
y0: .word 0
x0: .word 0
___tempo0___: .asciiz  "check"
tempo0: .word 0
tempo1: .word 0
z0: .word 0
tempo2: .word 0
___tempo3___: .asciiz  "zz!"
tempo3: .word 0
___tempo4___: .asciiz  "good z"
tempo4: .word 0
___tempo5___: .asciiz  "bad z"
tempo5: .word 0
tempo6: .word 0
inp0: .word 0
tempo7: .word 5
tempo8: .word 0
___tempo9___: .asciiz  "true"
tempo9: .word 0
tempo10: .word 1
___tempo11___: .asciiz  "pulse"
tempo11: .word 0
tempo12: .word 0
___tempo13___: .asciiz  "while..."
tempo13: .word 0
tempo14: .word 0
tempo16: .word 0
___tempo17___: .asciiz  "Andy mandy"
tempo17: .word 0
tempo18: .word 1
tempo19: .word 0
tempo20: .word 0
tempo21: .word 1
tempo22: .word 1
tempo23: .word 0
tempo25: .word 0
tempo26: .word 1
tempo27: .word 0
tempo29: .word 0
tempo30: .word 0
tempo32: .word 0
tempo34: .word 0
tempo35: .word 0
tempo36: .word 5
x14: .word 0
tempo37: .word 10
y14: .word 0
tempo38: .word 0
tempo40: .word 0
tempo41: .float 2.5
d214: .word 0
tempo42: .float 5.5
d514: .word 0
tempo44: .word 0
___tempo45___: .asciiz  "t"
tempo45: .word 0
tempo46: .word 1
tempo48: .word 0
___tempo49___: .asciiz  "f"
tempo49: .word 0
tempo50: .word 0
tempo52: .word 0
tempo54: .word 0
tempo55: .word 0
tempo57: .word 0
tempo58: .word 0
___tempo59___: .asciiz  "loop"
tempo59: .word 0
tempo60: .word 10
tempo62: .word 0
tempo63: .word 0
tempo65: .word 0
tempo66: .word 0

.text
main:
b ___main___
check:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, y0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l.s $f1, y0
l.s $f2, x0
c.lt.s $f1, $f2
bc1f ____ceqsfalse0____
____ceqstrue0____:
li $t3, 1
j ____ceqsend0____
____ceqsfalse0____:
li $t3, 0
____ceqsend0____:
sw $t3, tempo1
lw $t9, tempo1
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
g:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, z0
lw $t9, z0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, x0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo2
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
z:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, z0
la $t9, ___tempo3___
sw $t9, tempo3
lw $t9, tempo3
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, z0
beqz $t9, l0
la $t9, ___tempo4___
sw $t9, tempo4
lw $t9, tempo4
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l1
l0:
la $t9, ___tempo5___
sw $t9, tempo5
lw $t9, tempo5
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l1:
lw $t9, tempo6
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
ge_5:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, inp0
lw $t1, tempo7
lw $t2, inp0
sle $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
beqz $t9, l2
la $t9, ___tempo9___
sw $t9, tempo9
lw $t9, tempo9
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo10
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l2:
la $t9, ___tempo11___
sw $t9, tempo11
lw $t9, tempo11
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo12
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
while_cond:
la $t9, ___tempo13___
sw $t9, tempo13
lw $t9, tempo13
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo14
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo14
addi $sp, $sp, -4
sw $t9, ($sp)
jal ge_5
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo16
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo16
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
and_cond:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
la $t9, ___tempo17___
sw $t9, tempo17
lw $t9, tempo17
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo18
seq $t3, $t1, $t2
sw $t3, tempo19
lw $t9, tempo19
beqz $t9, l3
lw $t9, tempo20
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l3:
lw $t9, tempo21
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
jumper_3:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
lw $t9, x0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo22
sw $t9, x0
lw $t9, x0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo23
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
jumper_2:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, y0
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, y0
addi $sp, $sp, -4
sw $t9, ($sp)
jal jumper_3
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo25
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, y0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, y0
lw $t2, tempo26
add $t3, $t1, $t2
sw $t3, tempo27
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo27
addi $sp, $sp, -4
sw $t9, ($sp)
jal jumper_3
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo29
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo30
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
jumper_1:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, x0
addi $sp, $sp, -4
sw $t9, ($sp)
jal jumper_2
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo32
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, x0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, x0
addi $sp, $sp, -4
sw $t9, ($sp)
jal jumper_2
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo34
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo35
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
f:
lw $t9, tempo36
sw $t9, x14
lw $t9, tempo37
sw $t9, y14
lw $t1, x14
lw $t2, y14
add $t3, $t1, $t2
sw $t3, tempo38
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, x14
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo38
addi $sp, $sp, -4
sw $t9, ($sp)
jal g
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo40
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, x14
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, y14
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo41
sw $t9, d214
lw $t9, tempo42
sw $t9, d514
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, d214
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, d514
addi $sp, $sp, -4
sw $t9, ($sp)
jal check
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo44
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo44
beqz $t9, l4
la $t9, ___tempo45___
sw $t9, tempo45
lw $t9, tempo45
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo46
addi $sp, $sp, -4
sw $t9, ($sp)
jal z
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo48
lw $ra, ($sp)
addi $sp, $sp, 4
j l5
l4:
la $t9, ___tempo49___
sw $t9, tempo49
lw $t9, tempo49
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo50
addi $sp, $sp, -4
sw $t9, ($sp)
jal z
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo52
lw $ra, ($sp)
addi $sp, $sp, 4
l5:
l6:
jal while_cond
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo54
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo55
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo55
addi $sp, $sp, -4
sw $t9, ($sp)
jal and_cond
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo57
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, tempo54
lw $t2, tempo57
bnez $t1, ___Arg1Is1_1___
li $t3, 0
b ___endAndAnd_1___
___Arg1Is1_1___:
bnez $t2, ___Arg2IsAlso1_1___
li $t3, 0
b ___endAndAnd_1___
___Arg2IsAlso1_1___:
li $t3, 1
___endAndAnd_1___:
sw $t3, tempo58
lw $t9, tempo58
beqz $t9, l7
la $t9, ___tempo59___
sw $t9, tempo59
lw $t9, tempo59
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l6
l7:
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo60
addi $sp, $sp, -4
sw $t9, ($sp)
jal jumper_1
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo62
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo63
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo65
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo66
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
