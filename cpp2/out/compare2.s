.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .float 0.5
tempo1: .float 0.0
tempo2: .float 0.0
tempo3: .word 0
tempo4: .float 0.5
tempo5: .float 0.0
tempo6: .word 0
tempo7: .float 0.5
tempo8: .float 0.0
tempo9: .float 0.0
tempo10: .word 0
tempo11: .float 0.5
tempo12: .float 0.0
tempo13: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
l.s $f1, -1
l.s $f2, tempo0
mul.s $f3, $f1, $f2
s.s $f3, tempo1
l.s $f1, tempo2
l.s $f2, tempo1
c.le.s $f1, $f2
bc1f ____ceqsfalse0____
____ceqstrue0____:
li $t3, 1
j ____ceqsend0____
____ceqsfalse0____:
li $t3, 0
____ceqsend0____:
sw $t3, tempo3
lw $t9, tempo3
beqz $t9, ____printFalse1____
____printTrue1____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd1____
____printFalse1____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd1____:
li	$v0, 11
li	$a0, 10
syscall
l.s $f1, tempo5
l.s $f2, tempo4
c.le.s $f1, $f2
bc1f ____ceqsfalse2____
____ceqstrue2____:
li $t3, 1
j ____ceqsend2____
____ceqsfalse2____:
li $t3, 0
____ceqsend2____:
sw $t3, tempo6
lw $t9, tempo6
beqz $t9, ____printFalse3____
____printTrue3____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd3____
____printFalse3____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd3____:
li	$v0, 11
li	$a0, 10
syscall
l.s $f1, -1
l.s $f2, tempo7
mul.s $f3, $f1, $f2
s.s $f3, tempo8
l.s $f1, tempo8
l.s $f2, tempo9
c.le.s $f1, $f2
bc1f ____ceqsfalse4____
____ceqstrue4____:
li $t3, 1
j ____ceqsend4____
____ceqsfalse4____:
li $t3, 0
____ceqsend4____:
sw $t3, tempo10
lw $t9, tempo10
beqz $t9, ____printFalse5____
____printTrue5____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd5____
____printFalse5____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd5____:
li	$v0, 11
li	$a0, 10
syscall
l.s $f1, tempo11
l.s $f2, tempo12
c.le.s $f1, $f2
bc1f ____ceqsfalse6____
____ceqstrue6____:
li $t3, 1
j ____ceqsend6____
____ceqsfalse6____:
li $t3, 0
____ceqsend6____:
sw $t3, tempo13
lw $t9, tempo13
beqz $t9, ____printFalse7____
____printTrue7____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd7____
____printFalse7____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd7____:
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
