.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo0: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo0___
sw $t9, tempo0
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
lw $t9, tempo0
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
