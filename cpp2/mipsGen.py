#gets a TAC like string input and outputs a MIPS code
'''
u better go to page 54 of SPIM_Manual.pdf contains mips manual too
there are also instructions for double and single
================================================================================
-----------assign----------
//constant
assign a f= 1.2
assign a i= 12
assign a s= "fwrefwerf"
assign a b= false
//regular
assign a = b
assign *(a) = b
assign a = *(b)
assign a = allocate 6
assign a = allocate t
----------arith-------------
arith a = b f+ c
arith a = b + c
arith a = b f* c
arith a = b * c
arith a = b f/ c
arith a = b / c
arith a = b f- c
arith a = b - c
arith a = b % c
arith a = b == c
arith a = b != c
arith a = b <= c
arith a = b < c
----------------------
push lable
pop lable
Lcall lable
Lable lable:
return
Printf lable
Printb lable
Printi lable
Prints lable
ReadInt t = ReadInt()
ReadLine t = ReadLine()
ifz...
pushaddressof...
---------------------

'''
def mipsGen(input_code):
    def check_int(x):
        if x[0] == '+':
            return x[1:].isdigit()
        return x.isdigit()
    vars = {}
    instructions = input_code.split('\n')
    mipsDataCode = '.data\n'
    mipsTextCode = '.text\n.globl main\n'
    mipsTextCode += '################ MACROS ################\n'
    mipsTextCode += '.macro read_int($dReg)\nli	$v0, 5\nsyscall\nmove	$dReg, $v0\n.end_macro\n'
    mipsTextCode += '.macro read_string($string_address)\nli	$v0, 8\nli	$a1, 1000  #MAX_SIZE==999\nmove	$a0, $string_address\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro print_int($reg)\nli	$v0, 1\nmove 	$a0, $reg\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro print_double($reg)\nli	$v0, 3\nmove 	$f12, $reg\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro	print_string($string_address)\nli	$v0, 4\nmove	$a0, $string_address\nsyscall\n.end_macro\n'
    mipsTextCode += '########################################\n'
    for instruction in instructions:
        if instruction == '':
            continue
        # mipsTextCode += '#' + instruction + '\n'
        instruction = instruction.split(' ')
        if instruction[0] == 'arith':#arith a = b Xop c
            if instruction[4] == '+':#add
                pass
            if instruction[4] == '-':#sub
                pass
            if instruction[4] == '*':#mul
                pass
            if instruction[4] == '/':#div
                pass
            if instruction[4] == '%':#rem
                pass
            if instruction[4] == '==':#seq
                pass
            if instruction[4] == '!=':#snq
                pass
            if instruction[4] == '<':#slt
                pass
            if instruction[4] == '<=':#sle
                pass
            if instruction[4] == '||':#
                pass
            if instruction[4] == '&&':#
                pass
        if instruction[0] == 'Lable':#lable a:
            pass
        #what options are there?
        if instruction[0] == 'push':#push a
            pass
        #what options are there?
        if instruction[0] == 'pop':#pop a
            pass
        if instruction[0] == 'Lcall':#Lcall lable
            pass
        if instruction[0] == 'Printf':#Printf a
            mipsTextCode += 'l.d $f9, ' + instruction[1] + '\n'
            mipsTextCode += 'print_double($f9)\n'
        if instruction[0] == 'Prints':#Prints a
            mipsTextCode += 'lw $t9, ' + instruction[1] + '\n'
            mipsTextCode += 'print_string($t9)\n'
        if instruction[0] == 'Printi':#Printi a
            mipsTextCode += 'lw $t9, ' + instruction[1] + '\n'
            mipsTextCode += 'print_int($t9)\n'
        if instruction[0] == 'Printb':#Printb a
            mipsTextCode += 'lw $t9, ' + instruction[1] + '\n'
            mipsTextCode += 'print_int($t9)\n'
        if instruction[0] == 'assign':
            if instruction[2] == 'f=':#assign a f= 1.2
                mipsDataCode += instruction[1] + ': ' + '.double ' + instruction[3] + '\n'
                vars[instruction[1]] = 0
            if instruction[2] == 'i=':#assign a i= 12
                mipsDataCode += instruction[1] + ': ' + '.word ' + instruction[3] + '\n'
                vars[instruction[1]] = 0
            if instruction[2] == 's=':#assign a s= "fwrefwerf"
                s = ''
                for i in instruction[3:]:
                    s += ' ' + i
                mipsDataCode += '___' + instruction[1] + '___: ' + '.asciiz ' + s + '\n'
                mipsDataCode += instruction[1] + ': ' + '.word\n'
                mipsTextCode += 'la $t9, ' + '___' + instruction[1] + '___\n'
                mipsTextCode += 'sw $t9, ' + instruction[1] + '\n'
                vars['___' + instruction[1] + '___'] = 0
                vars[instruction[1]] = 0
            if instruction[2] == 'b=':#assign a b= false
                if instruction[3] == 'false':
                    instruction[3] = '0'
                if instruction[3] == 'true':
                    instruction[3] = '1'
                mipsDataCode += instruction[1] + ': ' + '.word ' + instruction[3] + '\n'
                vars[instruction[1]] = 0
            if instruction[2] == '=':
                if instruction[3] == 'allocate':
                    if check_int(instruction[4]):#assign t1 = allocate 6
                        if not instruction[1] in vals.keys():
                            mipsDataCode += instruction[1] + ': ' + '.word\n'
                            vars[instruction[1]] = 0
                        allocLable = '___' + instruction[1] + '___'
                        mipsDataCode += allocLable + ': .word ' + instruction[4] + '\n'
                        mipsTextCode += 'lw	$t9, ' + allocLable + '\n'
                        mipsTextCode += 'li	$v0, 9\n'
                        mipsTextCode += 'move	$a0, $t9\n'
                        mipsTextCode += 'syscall\n'
                        mipsTextCode += 'sw $v0, ' + instruction[1] + '\n'
                    else:#assign t1 = allocate b
                        if not instruction[1] in vals.keys():
                            mipsDataCode += instruction[1] + ': ' + '.word\n'
                            vars[instruction[1]] = 0
                        mipsTextCode += 'lw	$t9, ' + instruction[4] + '\n'
                        mipsTextCode += 'li	$v0, 9\n'
                        mipsTextCode += 'move	$a0, $t9\n'
                        mipsTextCode += 'syscall\n'
                        mipsTextCode += 'sw $v0, ' + instruction[1] + '\n'
                elif instruction[1][0] == '*':#assign *(t1) = t2
                    mipsTextCode += 'lw $t9, ' + instruction[1][2:-1] + '\n'
                    mipsTextCode += 'lw $t8, ' + instruction[3] + '\n'
                    mipsTextCode += 'sw $t8, ($t9)\n'
                elif instruction[3][0] == '*':#assign t1 = *(t2)
                    if not instruction[1] in vars.keys():
                        mipsDataCode += instruction[1] + ': ' + '.word\n'
                        vars[instruction[1]] = 0
                    mipsTextCode += 'la $t9, ' + instruction[3][2:-1] + '\n'
                    mipsTextCode += 'sw $t9, ' + instruction[1] + '\n'
                else:#assign t1 = t2
                    if not instruction[1] in vars.keys():
                        mipsDataCode += instruction[1] + ': ' + '.word\n'
                        vars[instruction[1]] = 0
                    mipsTextCode += "lw $t9, " + instruction[3] + '\n'
                    mipsTextCode += "sw $t9, " + instruction[1] + '\n'
        if instruction[0] == 'getAddress':
            pass
        if instruction[0] == 'return':
            pass
        if instruction[0] == 'ReadInt':#ReadInt t = ReadInt()
            mipsDataCode += instruction[1] + ': ' + '.word\n'
            mipsTextCode += 'read_int($t9)\n'
            mipsTextCode += 'sw $t9, ' + instruction[1] + '\n'
        if instruction[0] == 'ReadLine':#ReadLine t = ReadLine()
            mipsDataCode += instruction[1] + ': ' + '.asciiz\n'
            mipsTextCode += 'la $t9, ' + instruction[1] + '\n'
            mipsTextCode += 'read_string($t9)\n'
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass
    return '=============mipsGen under construction===============\n' + mipsDataCode + '\n' + mipsTextCode
