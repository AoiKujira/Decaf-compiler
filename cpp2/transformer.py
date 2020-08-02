import re

from lark import Transformer
from Symbols import Class


class Scope:
    def __init__(self, parent, number):
        self.children = []
        self.table = {}
        self.parent = parent
        self.number = number


class Test(Transformer):
    def __init__(self, sym):
        super().__init__()
        self.root_scope = Scope(None, 0)
        self.current_scope = self.root_scope
        self.scope_counter = 0
        self.code = '''$'''
        self.lcounter = 0
        self.tcounter = 0
        self.tstack = []
        self.lstack = []
        self.loop_stack = []
        self.classes = sym.classes
        self.sym = sym
        self.var_types = {}
        self.mem_checker = False

    # def expr(self, args):
    #    print("expr")
    #    
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
        if not isinstance(args[0], list):
            # print(args[0])
            if re.match(".*\[.*\]", args[0]):
                name = re.sub("\[.*\]", "", args[0])
                ty = self.var_types[name]
                if ["int", "bool", "double", "string"].__contains__(ty):
                    size = 4
                else:
                    size = self.classes[ty].size
                ind = re.match(".*(\[.*\])", args[0]).group(1).strip("[").strip("]")
                tem = self.make_temp()
                self.code += tem + " = " + str(size) + " * " + ind + "\n"
                self.code += tem + " = " + name + " + " + tem + "\n"
                self.code += "*(" + tem + ")" + " = " + args[1] + "\n"
                return args[1]
            self.code += args[0] + " = " + args[1] + "\n"
            return args[1]
        else:
            self.mem_checker = False
            temp = self.make_temp()
            lee = args[0]
            first = lee[0]
            print(self.code)
            for i in range(1, len(lee)):
                sec = lee[i]
                #print(args)
                t = self.var_types[first]
                c: Class = self.classes[t]
                # handle array members
                if re.match(".*\[.*\]", sec):
                    name = re.sub("\[.*\]", "", sec)
                    ty = re.sub("\[.*\]", "", c.var_types[name])
                    # print(name, ty)
                    if ["int", "bool", "double", "string"].__contains__(ty):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    hold = re.match(".*(\[.*\])", sec)
                    # print(hold)
                    ind = hold.group(1).strip("[").strip("]")
                    o = c.var_offsets[name]
                    tem = self.make_temp()
                    self.code += tem + " = " + first + " + " + str(o) + "\n"
                    self.code += temp + " = " + "*(" + tem + ")" + "\n"
                    self.code += tem + " = " + str(size) + " * " + ind + "\n"
                    self.code += temp + " = " + temp + " + " + tem + "\n"
                    self.var_types[temp] = ty
                    first = temp
                    continue

                o = c.var_offsets[sec]
                self.code += temp + " = " + first + " + " + str(o) + "\n"
                if i != len(lee) - 1:
                    self.code += temp + " = " + "*(" + temp + ")\n"
                self.var_types[temp] = c.var_types[sec]
                first = temp
            self.code += "*(" + temp + ")" + " = " + args[1] + "\n"
            return args[1]

    def new_class(self, args):
        size = self.classes[args[0]].size
        t = self.make_temp()
        self.code += t + " = Allocate " + str(size) + "\n"
        return t

    def make_array(self, args):
        ty = args[1]
        if ["int", "bool", "double", "string"].__contains__(ty):
            size = 4
        else:
            size = self.classes[ty].size
        t = self.make_temp()
        self.code += t + " = " + args[0] + " * " + str(size) + "\n"
        self.code += t + " = Allocate " + t + "\n"
        return t

    def exp_ident(self, args):
        iden = args[0]
        # print(iden)
        cur = self.current_scope
        # noinspection PyBroadException
        try:
            while not (cur.table.keys().__contains__(iden)):
                cur = cur.parent
            self.var_types[iden + str(cur.number)] = cur.table[iden]
            return iden + str(cur.number)
        except:
            return iden

    def exp_mem(self, args):
        self.mem_checker = True

        # print(args)
        if isinstance(args[1], list):
            lee = [args[0]]
            for a in args[1]:
                # print(a)
                lee.append(a)
            return lee
        else:
            return [args[0], args[1]]

    def dec_const(self, args):
        t = self.make_temp()
        dec = args[0]
        self.code += t + " = " + dec + "\n"
        return t

    def hex_const(self, args):
        t = self.make_temp()
        dec = int(args[0], 16)
        self.code += t + " = " + str(dec) + "\n"
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
        #
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
        #
        self.code += t + " = " + str(args[0]) + " + " + str(args[1]) + "\n"
        return t

    def exp_sub(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += t + " = " + args[0] + " - " + args[1] + "\n"
        return t

    def exp_lt(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " < " + args[1] + "\n"
        return t

    def exp_gt(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " > " + args[1] + "\n"
        return t

    def exp_ge(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " >= " + args[1] + "\n"
        return t

    def exp_equal(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " == " + args[1] + "\n"
        return t

    def exp_unequal(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " != " + args[1] + "\n"
        return t

    def exp_and(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " && " + args[1] + "\n"
        return t

    def exp_or(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " || " + args[1] + "\n"
        return t

    def print_stmt(self, args):
        #print(args)
        for arg in args[0]:
            self.code += "Print " + arg + "\n"

    def exp_le(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " <= " + args[1] + "\n"
        return t

    def exp_nine(self, args):
        if not self.mem_checker:
            if not isinstance(args[0], str):
                ret = args[0].children[0]
                self.tstack.append(ret)
                return ret
            else:
                if re.match(".*\[.*\]", args[0]):
                    name = re.sub("\[.*\]", "", args[0])
                    ty = self.var_types[name]
                    if ["int", "bool", "double", "string"].__contains__(ty):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    ind = re.match(".*(\[.*\])", args[0]).group(1).strip("[").strip("]")
                    tem = self.make_temp()
                    self.code += tem + " = " + str(size) + " * " + ind + "\n"
                    self.code += tem + " = " + name + " + " + tem + "\n"
                    self.code += tem + " = " + "*(" + tem + ")" + "\n"
                    return tem
                self.tstack.append(args[0])
                return args[0]
        else:
            self.mem_checker = False
            if not isinstance(args[0], list):
                self.mem_checker = True
                return args[0]
            temp = self.make_temp()
            lee = args[0]
            first = lee[0]
            for i in range(1, len(lee)):
                sec = lee[i]
                t = self.var_types[first]
                c: Class = self.classes[t]
                # handle array members
                if re.match(".*\[.*\]", sec):
                    name = re.sub("\[.*\]", "", sec)
                    ty = re.sub("\[.*\]", "", c.var_types[name])
                    # print(name, ty)
                    if ["int", "bool", "double", "string"].__contains__(ty):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    hold = re.match(".*(\[.*\])", sec)
                    # print(hold)
                    ind = hold.group(1).strip("[").strip("]")
                    o = c.var_offsets[name]
                    tem = self.make_temp()
                    self.code += tem + " = " + first + " + " + str(o) + "\n"
                    self.code += temp + " = " + "*(" + tem + ")" + "\n"
                    self.code += tem + " = " + str(size) + " * " + ind + "\n"
                    self.code += temp + " = " + temp + " + " + tem + "\n"
                    self.var_types[temp] = ty
                    first = temp
                    if i == len(lee) - 1:
                        self.code += temp + " = " + "*(" + temp + ")\n"
                    continue
                o = c.var_offsets[sec]
                self.code += temp + " = " + first + " + " + str(o) + "\n"
                if i != len(lee) - 1 or (
                        i == len(lee) - 1 and ["int", "bool", "double", "string"].__contains__(c.var_types[sec])):
                    self.code += temp + " = " + "*(" + temp + ")\n"
                self.var_types[temp] = c.var_types[sec]
                first = temp

            # self.code += temp + " = *(" + temp + ")" + "\n"
            return temp

    def exp_arr(self, args):
        # print(args)
        return args[0] + "[" + args[1] + "]"

    def function(self, args):
        child = args[0].children
        # print(child)
        if isinstance(args[0].children[1], str):
            add_to_code = args[0].children[1]
        else:
            add_to_code = args[0].children[0]
        self.code += "return from " + add_to_code + "\n\n$"
        before = self.code[:self.code.find("$")]
        after = self.code[(self.code.find("$") + 1):]
        self.code = before + add_to_code + ":\n" + after
        # print("func", self.code[self.code.find("\n"):], "\n\n\n")

    def return_function(self, args):
        # print(args, self.code, "\n\n\n")
        # self.code += "\n" + args[1] + ":\n"
        return ""

    def non_return_function(self, args):
        # print(args, self.code, "\n\n\n")
        # self.code += "\n" + args[0] + ":\n"
        return ""

    # todo func
    def function_call(self, args):
        # print(args)
        self.code += "Lcall " + args[0] + "\n"
        t = self.make_temp()
        self.code += "pop " + t + "\n"
        return t

    def push_args(self, args):
        lee = []
        for x in args:
            self.code += "push " + x.children[0] + "\n"
            lee.append(x.children[0])
        return lee

    def pop_scope(self, args):
        self.current_scope = self.current_scope.parent

    def push_scope(self, args):
        self.scope_counter += 1
        new_scope = Scope(self.current_scope, self.scope_counter)
        self.current_scope.children.append(new_scope)
        self.current_scope = new_scope

    def variable(self, args):
        if self.scope_counter > 0:
            ident = args[1]
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
            #
            self.tstack.append(args[0])
            return args[0]

    def str_const(self, args):
        # print("strrrring")
        (str_con,) = args
        print(str_con)
        return str_con

    def read_line(self, args):
        t = self.make_temp()
        self.code += t + " = Readline()" + "\n"
        return t

    def read_int(self, args):
        t = self.make_temp()
        self.code += t + " = ReadInt()" + "\n"
        return t

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
    null = lambda self, _: "null"

    def make_label(self):
        lab = "l" + str(self.lcounter)
        self.lcounter += 1
        return lab

    def make_temp(self):
        t = "tempo" + str(self.tcounter)
        self.tcounter += 1
        return t
