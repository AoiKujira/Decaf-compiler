
#from lark.visitors import CollapseAmbiguities
from lark import *

from Symbols import SymbolTable
from chert import Test
from mipsGen import mipsGen


def check_errors(text, output_file):
    open_file = open("grammar.txt", "r")
    grammar = open_file.read()
    parser = Lark(grammar, parser='lalr', debug=False)

    try:
        tree = parser.parse(text)
        # print(tree.pretty())
        sym = SymbolTable()
        while not sym.has_finished:
            # print("doing the thing")
            sym.prep()
            sym.transform(tree)
        # print(sym.classes["Sag"].var_offsets)
        trans = Test(sym)
        trans.transform(tree)
        output_file.write(mipsGen(trans.code))
    except:
        output_file.write("ERROR PARSING")
    #parser.parse(text)
