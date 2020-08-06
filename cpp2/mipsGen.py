#gets a TAC like string input and outputs a MIPS code
'''
u better go to page 54 of SPIM_Manual.pdf contains mips manual too
there are also instructions for double and single
================================================================================
-----------assign----------
//constant
assign a f= b
assign a i= b
assign a s= b
assign a b= b
//regular
assign a = b
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
print lable
readInt
---------------------

'''
def mipsGen(input_code):
    instructions = input_code.split('\n')
    mipsCode = ''
    for instruction in instructions:
        if instruction == '':
            continue
        mipsCode += '#' + instruction + '\n'
        instruction = instruction.split()
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
        #what options are there?
        if instruction[0] == 'Print':#Print a
            pass
        if instruction[0] == 'assign':
            pass
        if instruction[0] == 'getAddress':
            pass
        if instruction[0] == 'return':
            pass
        if instruction[0] == 'Allocate':
            pass
        if instruction[0] == '':
            pass
    return '=============mipsGen under construction===============\n' + mipsCode
