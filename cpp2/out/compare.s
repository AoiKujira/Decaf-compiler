.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .float 0.5
tempo1: .float 0.0
tempo2: .float 0.0
tempo3: .word 0
tempo4: .float 0.5
tempo5: .float 0.0
tempo6: .float 0.0
tempo7: .word 0
tempo8: .float 0.5
tempo9: .float 0.0
tempo10: .float 0.0
tempo11: .word 0
tempo12: .float 0.5
tempo13: .float 0.0
tempo14: .float 0.0
tempo15: .word 0
tempo16: .float 0.5
tempo17: .float 0.0
tempo18: .float 0.9
tempo19: .float 0.0
tempo20: .word 0
tempo21: .float 0.5
tempo22: .float 0.0
tempo23: .float 0.9
tempo24: .float 0.0
tempo25: .word 0
tempo26: .float 0.5
tempo27: .float 0.0
tempo28: .float 0.9
tempo29: .float 0.0
tempo30: .word 0
tempo31: .float 0.5
tempo32: .float 0.0
tempo33: .float 0.9
tempo34: .float 0.0
tempo35: .word 0

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
l.s $f1, -1
l.s $f2, tempo4
mul.s $f3, $f1, $f2
s.s $f3, tempo5
l.s $f1, tempo5
l.s $f2, tempo6
c.le.s $f1, $f2
bc1f ____ceqsfalse2____
____ceqstrue2____:
li $t3, 1
j ____ceqsend2____
____ceqsfalse2____:
li $t3, 0
____ceqsend2____:
sw $t3, tempo7
lw $t9, tempo7
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
l.s $f2, tempo8
mul.s $f3, $f1, $f2
s.s $f3, tempo9
l.s $f1, tempo10
l.s $f2, tempo9
c.lt.s $f1, $f2
bc1f ____ceqsfalse4____
____ceqstrue4____:
li $t3, 1
j ____ceqsend4____
____ceqsfalse4____:
li $t3, 0
____ceqsend4____:
sw $t3, tempo11
lw $t9, tempo11
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
l.s $f1, -1
l.s $f2, tempo12
mul.s $f3, $f1, $f2
s.s $f3, tempo13
l.s $f1, tempo13
l.s $f2, tempo14
c.lt.s $f1, $f2
bc1f ____ceqsfalse6____
____ceqstrue6____:
li $t3, 1
j ____ceqsend6____
____ceqsfalse6____:
li $t3, 0
____ceqsend6____:
sw $t3, tempo15
lw $t9, tempo15
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
l.s $f1, -1
l.s $f2, tempo16
mul.s $f3, $f1, $f2
s.s $f3, tempo17
l.s $f1, -1
l.s $f2, tempo18
mul.s $f3, $f1, $f2
s.s $f3, tempo19
l.s $f1, tempo19
l.s $f2, tempo17
c.le.s $f1, $f2
bc1f ____ceqsfalse8____
____ceqstrue8____:
li $t3, 1
j ____ceqsend8____
____ceqsfalse8____:
li $t3, 0
____ceqsend8____:
sw $t3, tempo20
lw $t9, tempo20
beqz $t9, ____printFalse9____
____printTrue9____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd9____
____printFalse9____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd9____:
li	$v0, 11
li	$a0, 10
syscall
l.s $f1, -1
l.s $f2, tempo21
mul.s $f3, $f1, $f2
s.s $f3, tempo22
l.s $f1, -1
l.s $f2, tempo23
mul.s $f3, $f1, $f2
s.s $f3, tempo24
l.s $f1, tempo22
l.s $f2, tempo24
c.le.s $f1, $f2
bc1f ____ceqsfalse10____
____ceqstrue10____:
li $t3, 1
j ____ceqsend10____
____ceqsfalse10____:
li $t3, 0
____ceqsend10____:
sw $t3, tempo25
lw $t9, tempo25
beqz $t9, ____printFalse11____
____printTrue11____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd11____
____printFalse11____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd11____:
li	$v0, 11
li	$a0, 10
syscall
l.s $f1, -1
l.s $f2, tempo26
mul.s $f3, $f1, $f2
s.s $f3, tempo27
l.s $f1, -1
l.s $f2, tempo28
mul.s $f3, $f1, $f2
s.s $f3, tempo29
l.s $f1, tempo29
l.s $f2, tempo27
c.lt.s $f1, $f2
bc1f ____ceqsfalse12____
____ceqstrue12____:
li $t3, 1
j ____ceqsend12____
____ceqsfalse12____:
li $t3, 0
____ceqsend12____:
sw $t3, tempo30
lw $t9, tempo30
beqz $t9, ____printFalse13____
____printTrue13____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd13____
____printFalse13____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd13____:
li	$v0, 11
li	$a0, 10
syscall
l.s $f1, -1
l.s $f2, tempo31
mul.s $f3, $f1, $f2
s.s $f3, tempo32
l.s $f1, -1
l.s $f2, tempo33
mul.s $f3, $f1, $f2
s.s $f3, tempo34
l.s $f1, tempo32
l.s $f2, tempo34
c.lt.s $f1, $f2
bc1f ____ceqsfalse14____
____ceqstrue14____:
li $t3, 1
j ____ceqsend14____
____ceqsfalse14____:
li $t3, 0
____ceqsend14____:
sw $t3, tempo35
lw $t9, tempo35
beqz $t9, ____printFalse15____
____printTrue15____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd15____
____printFalse15____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd15____:
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
