.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Person_this: .word 0
new_name0: .word 0
name: .word 0
new_age0: .word 0
age: .word 0
___tempo0___: .asciiz  "Name: "
tempo0: .word 0
___tempo1___: .asciiz  " Age: "
tempo1: .word 0
Student_this: .word 0
new_grade0: .word 0
grade: .word 0
___tempo2___: .asciiz  "Name: "
tempo2: .word 0
___tempo3___: .asciiz  " Age: "
tempo3: .word 0
___tempo4___: .asciiz  " Grade: "
tempo4: .word 0
tempo5: .word 0
___tempo5___: .word 0
p19: .word 0
___tempo6___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo6: .word 0
tempo8: .word 0
tempo10: .word 0
___tempo10___: .word 0
p29: .word 0
n9: .word 0
___tempo11___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo11: .word 0
tempo13: .word 0
tempo15: .word 0
___tempo15___: .word 0
s19: .word 0
___tempo16___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo16: .word 0
tempo18: .word 0
tempo20: .word 0
tempo22: .word 0
___tempo22___: .word 0
s29: .word 0
___tempo23___: .asciiz "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 "
tempo23: .word 0
p9: .word 0
tempo25: .word 0
tempo27: .word 0
tempo35: .word 0
tempo36: .word 0
tempo37: .word 0

.text
main:
j ___main___
Person_setName:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, new_name0
lw $t9, new_name0
sw $t9, name
jr $ra
Person_getName:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
lw $t9, name
subi $sp, $sp, 4
sw $t9, ($sp)
jr $ra
jr $ra
Person_setAge:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, new_age0
lw $t9, new_age0
sw $t9, age
jr $ra
Person_getAge:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Person_this
lw $t9, age
subi $sp, $sp, 4
sw $t9, ($sp)
jr $ra
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

lw $t9, name
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo1
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, age
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
Student_setGrade:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Student_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, new_grade0
lw $t9, new_grade0
sw $t9, grade
jr $ra
Student_getGrade:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Student_this
lw $t9, grade
subi $sp, $sp, 4
sw $t9, ($sp)
jr $ra
jr $ra
Student_print:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Student_this
la $t9, ___tempo2___
sw $t9, tempo2
la $t9, ___tempo3___
sw $t9, tempo3
la $t9, ___tempo4___
sw $t9, tempo4
lw $t9, tempo2
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, name
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo3
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, age
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo4
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, grade
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
___main___:
la $ra,EndOfWorld
lw	$t9, ___tempo5___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo5
lw $t9, tempo5
sw $t9, p19
la $t9, ___tempo6___
sw $t9, tempo6
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall

subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo6
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, p19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_setName
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo8
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo8
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, p19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_setAge
lw $ra, ($sp)
addi $sp, $sp, 4
lw	$t9, ___tempo10___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo10
lw $t9, tempo10
sw $t9, p29
lw $t9, p29
sw $t9, n9
la $t9, ___tempo11___
sw $t9, tempo11
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall

subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo11
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, n9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Nameable_setName
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo13
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo13
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, p29
subi $sp, $sp, 4
sw $t9, ($sp)
jal person_setAge
lw $ra, ($sp)
addi $sp, $sp, 4
lw	$t9, ___tempo15___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo15
lw $t9, tempo15
sw $t9, s19
la $t9, ___tempo16___
sw $t9, tempo16
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall

subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo16
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, s19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Student_setName
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo18
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo18
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, s19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Student_setAge
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo20
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo20
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, s19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Student_setGrade
lw $ra, ($sp)
addi $sp, $sp, 4
lw	$t9, ___tempo22___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo22
lw $t9, tempo22
sw $t9, s29
lw $t9, s29
sw $t9, n9
la $t9, ___tempo23___
sw $t9, tempo23
li	$v0, 8
li	$a1, 1010  #MAX_String_Read_SIZE==1000
move	$a0, $t9
syscall

subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo23
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, n9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Nameable_setName
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, s29
sw $t9, p9
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo25
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo25
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, p9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_setAge
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo27
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo27
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, s29
subi $sp, $sp, 4
sw $t9, ($sp)
jal Student_setGrade
lw $ra, ($sp)
addi $sp, $sp, 4
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, p19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_print
lw $ra, ($sp)
addi $sp, $sp, 4
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, p29
subi $sp, $sp, 4
sw $t9, ($sp)
jal person_print
lw $ra, ($sp)
addi $sp, $sp, 4
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, s19
subi $sp, $sp, 4
sw $t9, ($sp)
jal Student_print
lw $ra, ($sp)
addi $sp, $sp, 4
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, s29
subi $sp, $sp, 4
sw $t9, ($sp)
jal Student_print
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, p19
sw $t9, n9
lw $t9, n9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Nameable_getName
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 11
li	$a0, 10
syscall
lw $t9, s29
sw $t9, n9
lw $t9, n9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Nameable_getName
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 11
li	$a0, 10
syscall
lw $t9, p29
sw $t9, p9
lw $t9, p9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_getName
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo35
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo35
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, p9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_getAge
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo36
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo36
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, s19
sw $t9, p9
lw $t9, p9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_getAge
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo37
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo37
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, p9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Person_print
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, s29
sw $t9, n9
lw $t9, n9
subi $sp, $sp, 4
sw $t9, ($sp)
jal Nameable_getName
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 11
li	$a0, 10
syscall
jr $ra
EndOfWorld:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
