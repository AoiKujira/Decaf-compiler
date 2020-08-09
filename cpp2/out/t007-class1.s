.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Person_this: .word 0
new_name0: .word 0
tempo2: .word 0
_____0_____: .word 0
new_age0: .word 0
tempo3: .word 0
_____4_____: .word 4
___tempo0___: .asciiz  "Name: "
tempo0: .word 0
___tempo1___: .asciiz  " Age: "
tempo1: .word 0
tempo4: .word 0
tempo5: .word 0
___tempo6___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo6: .word 0
name4: .word 0
tempo7: .word 0
age4: .word 0
tempo8: .word 0
___tempo8___: .word 8
p4: .word 0

.text
main:
b ___main___
Person_setName:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, new_name0
lw $t1, Person_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo2
lw $t9, tempo2
lw $t8, new_name0
sw $t8, ($t9)
jr $ra
Person_setAge:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, new_age0
lw $t1, Person_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
lw $t8, new_age0
sw $t8, ($t9)
jr $ra
Person_print:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
la $t9, ___tempo0___
sw $t9, tempo0
la $t9, ___tempo1___
sw $t9, tempo1
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

lw $t1, Person_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
lw $t9, ($t9)
sw $t9, tempo4
lw $t9, tempo4
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo1
li	$v0, 4
move	$a0, $t9
syscall

lw $t1, Person_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
lw $t9, ($t9)
sw $t9, tempo5
lw $t9, tempo5
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo6___
sw $t9, tempo6
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall
____len_to_new_line0____:
lb $t2, ($a0)
li $t3, 10
beq $t2, $t3, ____endofreadline1____
addi $a0, $a0, 1
b ____len_to_new_line0____
____endofreadline1____:
sb $zero, ($a0)
lw $t9, tempo6
sw $t9, name4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo7
lw $t9, tempo7
sw $t9, age4
lw	$t9, ___tempo8___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo8
lw $t9, tempo8
sw $t9, p4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, name4
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, p4
addi $sp, $sp, -4
sw $t9, ($sp)
jal Person_setName
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, age4
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, p4
addi $sp, $sp, -4
sw $t9, ($sp)
jal Person_setAge
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, p4
addi $sp, $sp, -4
sw $t9, ($sp)
jal Person_print
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
