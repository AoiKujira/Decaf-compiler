.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz  "input your name:"
tempo0: .word 0
___tempo1___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo1: .word 0
___tempo2___: .asciiz  "ok bruh now input your age : ->\n"
tempo2: .word 0
tempo3: .word 0
___tempo4___: .asciiz  "good age? answer is "
tempo4: .word 0
tempo5: .word 1
tempo6: .word 0
___tempo7___: .asciiz  "ok1 simple if"
tempo7: .word 0
tempo8: .word 0
___tempo9___: .asciiz  "wrong"
tempo9: .word 0
___tempo10___: .asciiz  "eyval else ham doroste"
tempo10: .word 0
tempo11: .word 0
tempo12: .word 0
___tempo13___: .asciiz  "wrong"
tempo13: .word 0
tempo14: .word 1
tempo15: .word 1
tempo16: .word 2
tempo17: .word 1
tempo18: .word 3
tempo19: .word 0
___tempo20___: .asciiz  "wrong"
tempo20: .word 0
tempo21: .word 4
tempo22: .word 0
___tempo23___: .asciiz  "wrong"
tempo23: .word 0
tempo24: .word 5
tempo25: .word 0
tempo26: .word 1
tempo27: .word 0
___tempo28___: .asciiz  "wrong"
tempo28: .word 0
tempo29: .word 0
___tempo30___: .asciiz  "wrong"
tempo30: .word 0
___tempo31___: .asciiz  "wrong"
tempo31: .word 0
tempo32: .word 1
___tempo33___: .asciiz  "wrong"
tempo33: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
la $t9, ___tempo1___
sw $t9, tempo1
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall
____len_to_new_line0____:
lb $t2, ($a0)
li $t3, 10
beq $t2, $t3, ____endofreadline0____
addi $a0, $a0, 1
b ____len_to_new_line0____
____endofreadline0____:
sb $zero, ($a0)
lw $t9, tempo1
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
la $t9, ___tempo2___
sw $t9, tempo2
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo3
la $t9, ___tempo4___
sw $t9, tempo4
lw $t9, tempo2
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo3
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo4
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo5
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
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo6
lw $t9, tempo6
beqz $t9, l0
la $t9, ___tempo7___
sw $t9, tempo7
lw $t9, tempo7
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l0:
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo8
lw $t9, tempo8
beqz $t9, l1
la $t9, ___tempo9___
sw $t9, tempo9
lw $t9, tempo9
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l2
l1:
la $t9, ___tempo10___
sw $t9, tempo10
lw $t9, tempo10
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l2:
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo11
lw $t9, tempo11
beqz $t9, l3
lw $t9, tempo12
beqz $t9, l4
la $t9, ___tempo13___
sw $t9, tempo13
lw $t9, tempo13
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l5
l4:
lw $t9, tempo14
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
l5:
lw $t9, tempo15
beqz $t9, l6
lw $t9, tempo16
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
l6:
lw $t9, tempo17
beqz $t9, l7
lw $t9, tempo18
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo19
beqz $t9, l8
la $t9, ___tempo20___
sw $t9, tempo20
lw $t9, tempo20
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l9
l8:
lw $t9, tempo21
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo22
beqz $t9, l10
la $t9, ___tempo23___
sw $t9, tempo23
lw $t9, tempo23
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l11
l10:
lw $t9, tempo24
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo25
lw $t9, tempo25
beqz $t9, l12
lw $t9, tempo26
beqz $t9, ____printFalse2____
____printTrue2____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd2____
____printFalse2____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd2____:
li	$v0, 11
li	$a0, 10
syscall
j l13
l12:
lw $t9, tempo27
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
l13:
l11:
l9:
j l14
l7:
la $t9, ___tempo28___
sw $t9, tempo28
lw $t9, tempo28
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l14:
j l15
l3:
lw $t9, tempo29
beqz $t9, l16
la $t9, ___tempo30___
sw $t9, tempo30
lw $t9, tempo30
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
j l17
l16:
la $t9, ___tempo31___
sw $t9, tempo31
lw $t9, tempo31
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l17:
lw $t9, tempo32
beqz $t9, l18
la $t9, ___tempo33___
sw $t9, tempo33
lw $t9, tempo33
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l18:
l15:
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
