#gets a TAC like string input and outputs a MIPS code

def mipsGen(input_code):
    instructions = input_code.split('\n')
    mipsCode = ''
    for instruction in instructions:
        if instruction == '':
            continue
        mipsCode += '#' + instruction + '\n'
        instruction = instruction.split()
        if instruction[0] == 'intArithmetic':#intArithmetic x = y op z
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
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass
    return '=============mipsGen under construction===============\n' + mipsCode
