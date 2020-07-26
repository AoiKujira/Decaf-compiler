from lark import Transformer
class Scope:
    def __init__(self, parent):
        self.children = []
        self.table = {}
        self.parent = parent

class Test(Transformer):
    def __init__(self):
        super().__init__()
        self.root_scope = Scope(None)
        self.current_scope = self.root_scope

    def pop_scope(self, args):
        self.current_scope = self.current_scope.parent

    def push_scope(self, args):
        new_scope = Scope(self.current_scope)
        self.current_scope.children.append(new_scope)
        self.current_scope = new_scope

    def variable(self, args):
        print(args)
        (ident,) = args[1]
        self.current_scope.table[ident] = args[0]

    def IDENT(self, iden):
        #print(iden)
        return iden

    def type(self, type):
        #print(type)
        (type,) = type
        return type[1:-1]

    int = lambda self, _: "int"
    double = lambda self, _: "double"
    str = lambda self, _: "string"
    bool = lambda self, _: "bool"