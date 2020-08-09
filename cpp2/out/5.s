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
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
