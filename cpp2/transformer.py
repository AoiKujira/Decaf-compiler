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
        self.loop_stack = []

    # def expr(self, args):
    #     print("expr")
    #     print(args)
    #     self.code += "here be expression code \n"
    #     name = self.make_temp()
    #     self.code += name + " = " + "gotten\n"
    #     self.tstack.append(name)

    def make_start_label(self, args):
        lab = self.make_label()
        self.code += lab + ":\n"
        self.lstack.append(lab)

    def make_condition_jump(self, args):
        t = self.tstack.pop()
        end = self.make_label()
        self.loop_stack.append(end)
        self.code += "If " + t + " zero go to " + end + "\n"
        self.lstack.append(end)

    def make_loop_jump(self, args):
        end = self.lstack.pop()
        start = self.lstack.pop()
        self.code += "jump to " + start + "\n"
        self.code += end + ":" + "\n"
        self.loop_stack.pop()

    def for_jump(self, args):
        t = self.tstack.pop()
        start = self.lstack.pop()
        stmt_lab = self.make_label()
        end = self.make_label()
        self.loop_stack.append(end)
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
        self.loop_stack.pop()

    def break_stmt(self, args):
        lab = self.loop_stack[-1]
        self.code += "jump to " + lab + "\n"

    def if_cond(self, args):
        t = self.tstack.pop()
        lab = self.make_label()
        self.code += "If " + t + " zero go to " + lab + "\n"
        self.lstack.append(lab)

    def if_out_label(self, args):
        out = self.lstack.pop()
        self.code += out + ":\n"

    def exp_assign(self, args):
        self.tstack.append(args[1])
        self.code += "this needs fixing: " + args[0] + " = " + args[1] + "\n"
        return args[1]

    def dec_const(self, args):
        t = self.make_temp()
        dec = args[0]
        self.code += t + " = " + dec + "\n"
        return t

    def hex_const(self, args):
        t = self.make_temp()
        dec = int(args[0], 16)
        self.code += t + " = " + dec + "\n"
        return t

    def exp_not(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += t + " = not(" + args[0] + ")\n"
        return t

    def exp_neg(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += t + " = (-1) * " + args[0] + "\n"
        return t

    def exp_mul(self, args):
        t = self.make_temp()
        # print(args)
        # typecheck here
        self.code += t + " = " + args[0] + " * " + args[1] + "\n"
        return t

    def exp_div(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += t + " = " + args[0] + " / " + args[1] + "\n"
        return t

    def exp_rem(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += t + " = " + args[0] + " % " + args[1] + "\n"
        return t

    def exp_sum(self, args):
        t = self.make_temp()
        # typecheck here
        # print(args)
        self.code += t + " = " + args[0] + " + " + args[1] + "\n"
        return t

    def exp_sub(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += t + " = " + args[0] + " - " + args[1] + "\n"
        return t

    def exp_lt(self, args):
        t = self.make_temp()
        #print(args)
        # typecheck here
        self.code += t + " = " + args[0] + " < " + args[1] + "\n"
        return t

    def exp_ge(self, args):
        t = self.make_temp()
        #print(args)
        # typecheck here
        self.code += t + " = " + args[0] + " >= " + args[1] + "\n"
        return t

    def constant(self, args):
        return args[0]

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
        return str(iden)

    def exp_normal(self, args):
        try:
            ret = args[0].children[0]
            self.tstack.append(ret)
            return ret
        except:
            # print(args)
            self.tstack.append(args[0])
            return args[0]

    def STRING_CONSTANT(self, args):
        #print(args)
        return args


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
