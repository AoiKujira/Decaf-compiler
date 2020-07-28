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
        self.scope_level = 0
        self.code = ''''''
        self.lcounter = 0
        self.tcounter = 0
        self.tstack = []
        self.lstack = []

    def expr(self, args):
        self.code += "here be expression code \n"
        name = self.make_temp()
        self.code += name + " = " + "gotten\n"
        self.tstack.append(name)

    def make_start_label(self, args):
        lab = self.make_label()
        self.code += lab + ":\n"
        self.lstack.append(lab)

    def make_condition_jump(self, args):
        t = self.tstack.pop()
        end = self.make_label()
        self.code += "If " + t + " zero go to " + end + "\n"
        self.lstack.append(end)

    def make_loop_jump(self, args):
        end = self.lstack.pop()
        start = self.lstack.pop()
        self.code += "jump to " + start + "\n"
        self.code += end + ":" + "\n"

    def for_jump(self, args):
        t = self.tstack.pop()
        start = self.lstack.pop()
        stmt_lab = self.make_label()
        end = self.make_label()
        step_lab = self.make_label()
        self.lstack.append(step_lab)
        self.lstack.append(end)
        self.lstack.append(stmt_lab)
        self.lstack.append(start)
        self.code += "If " + t + " zero go to " + end + "\n"
        self.code += "jump to " + stmt_lab + "\n"
        self.code += step_lab + ":\n"

    def step_jump(self, args):
        start = self.lstack.pop()
        stmt_lab = self.lstack.pop()
        self.code += "jump to " + start + "\n"
        self.code += stmt_lab + ":\n"

    def return_jump(self, args):
        end = self.lstack.pop()
        step_lab = self.lstack.pop()
        self.code += "jump to " + step_lab + "\n"
        self.code += end + ":\n"

    def pop_scope(self, args):
        self.current_scope = self.current_scope.parent
        self.scope_level -= 1

    def stmt(self, args):
        self.code += "Here be statement code" + "\n"

    def push_scope(self, args):
        new_scope = Scope(self.current_scope)
        self.current_scope.children.append(new_scope)
        self.current_scope = new_scope
        self.scope_level += 1

    def variable(self, args):
        # print(args)
        (ident,) = args[1]
        self.current_scope.table[ident] = args[0]

    def IDENT(self, iden):
        # print(iden)
        return iden

    def type(self, type):
        if len(type) == 1:
            (type,) = type
        else:
            type = type[0].strip("\"") + "[]"
        return type.strip("\"")

    int = lambda self, _: "int"
    double = lambda self, _: "double"
    str = lambda self, _: "string"
    bool = lambda self, _: "bool"

    def make_label(self):
        lab = "l" + str(self.lcounter)
        self.lcounter += 1
        return lab

    def make_temp(self):
        t = "t" + str(self.tcounter)
        self.tcounter += 1
        return t
