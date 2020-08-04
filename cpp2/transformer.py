import re

from Symbols import *


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
        self.code = ''''''
        self.lcounter = 0
        self.tcounter = 0
        self.tstack = []
        self.lstack = []
        self.loop_stack = []
        self.classes = sym.classes
        self.sym = sym
        self.var_types = {}
        self.mem_checker = False
        self.function_types = {}
        self.function_vars = sym.function_vars
        self.in_class = False
        self.last_code = ''''''
        self.new = False
        self.last_class = ""

    def expr(self, args):
        # print("expr", args)
        # print("normal", args)
        if self.new and not isinstance(args[0], str):
            self.code += "Lcall " + self.last_class + "_" + args[0][0][1] + "\n"
            self.new = False
            self.last_class = ""
        return args[0]

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
        self.code += "Ifz " + t + " goto " + end + "\n"
        self.lstack.append(end)

    def make_loop_jump(self, args):
        end = self.lstack.pop()
        start = self.lstack.pop()
        self.code += "jumpto " + start + "\n"
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
        self.code += "Ifz " + t + " goto " + end + "\n"
        self.code += "jumpto " + stmt_lab + "\n"
        self.code += step_lab + ":\n"

    def step_jump(self, args):
        start = self.lstack.pop()
        stmt_lab = self.lstack.pop()
        self.code += "jumpto " + start + "\n"
        self.code += stmt_lab + ":\n"

    def return_jump(self, args):
        end = self.lstack.pop()
        step_lab = self.lstack.pop()
        self.code += "jumpto " + step_lab + "\n"
        self.code += end + ":\n"
        self.loop_stack.pop()

    def break_stmt(self, args):
        lab = self.loop_stack[-1]
        self.code += "jumpto " + lab + "\n"

    def if_cond(self, args):
        t = self.tstack.pop()
        lab = self.make_label()
        print("lab", t)
        print(self.code)
        self.code += "Ifz " + t + " goto " + lab + "\n"
        self.lstack.append(lab)

    def if_out_label(self, args):
        out = self.lstack.pop()
        self.code += out + ":\n"

    def exp_assign(self, args):
        # print("exp assign", args)
        if not isinstance(args[1][0], str):
            args[1] = args[1][0][0]
        # print("exp assign", args)
        if str(args).__contains__('exp_this'):
            self.code += 'init_this.' + args[0][1] + " = " + args[1] + "\n"
            return 'init_this'
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
            # print("self.code", self.code, "\n\nhehe\n\n")
            # print("exp_nine", args)
            self.code += args[0] + " = " + args[1] + "\n"
            return args[1]
        else:
            self.mem_checker = False
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
        # print("new_class", self.classes, args)
        # print(self.code)
        self.last_class = args[0]
        size = self.classes[args[0]].size
        t = self.make_temp()
        self.code += t + " = Allocate " + str(size) + "\n"
        self.new = True
        # print(self.code, "\n\nhehe\n\n")
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
        # print("exp_mem", args)
        if args[1][1] == "correct_init_this":
            # print("heyyyyyy")
            before = self.code[:args[1][2]]
            code = self.code[args[1][2]:]
            after = code[code.find("\n"):]
            code = "push " + args[0]
            self.code = before + code + after
            # print(args[1][1])
            return [args[1][3], args[1][0], args[0]]
        if isinstance(args[0], str) and dict(self.var_types).__contains__(args[0]) and \
                dict(self.function_vars).__contains__(self.var_types[args[0]] + "_" + str(args[1])):
            # print("1")
            # print("exp_mem", args, self.var_types)
            # print(self.last_code, "\n\n\n\nhehe\n\n")
            # print("mem", args[1])
            self.code = self.last_code
            self.code = self.code[:self.code.find("Lcall " + args[1])]
            self.code += "pushaddressof " + args[0] + "\n"
            self.code += "Lcall " + self.var_types[args[0]] + "_" + args[1] + "\n"
            return args
        self.mem_checker = True
        if isinstance(args[1], list):
            # print(2)
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
        self.code += t + " = " + args[1] + " < " + args[0] + "\n"
        return t

    def exp_ge(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[1] + " <= " + args[0] + "\n"
        return t

    def exp_equal(self, args):
        # print("exp_equal", args)
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
        # print(args)
        for arg in args[0]:
            self.code += "Print " + arg + "\n"

    def exp_le(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += t + " = " + args[0] + " <= " + args[1] + "\n"
        return t

    def exp_nine(self, args):
        # print("exp_nine", args)
        # print(self.code, "\n\nhehe\n\n")
        if not isinstance(args[0], list) and str(args).__contains__("exp_this"):
            return "init_this"
        if self.var_types.__contains__(args[0][0]) and not self.function_types.__contains__(args[0][1])\
                and self.classes[self.var_types[args[0][0]]].var_offsets.__contains__(args[0][1]):
            t = self.make_temp()
            # print(self.var_types)
            offset = self.classes[self.var_types[args[0][0]]].var_offsets[args[0][1]]
            self.code += t + " = " + args[0][0] + " + " + str(offset) + "\n"
            self.code += "*(" + t + ") = " + args[0][1] + "\n"
            return t
        if self.var_types.__contains__(args[0][0]):
            self.code = self.last_code
            self.code += "push " + args[0][0] + "\n"
            if self.var_types.__contains__(args[0][0]):
                self.code += "Lcall " + self.var_types[args[0][0]] + "_" + args[0][1] + "\n"
            else:
                self.code += "Lcall init_" + args[0][1] + "\n"
            t = ""
            if self.function_types[args[0][1]] == "return":
                t = self.make_temp()
                self.code += "pop " + t + "\n"
            return t
        if str(args).__contains__('exp_this'):
            return 'init_this.' + args[0][1]
        if isinstance(args[0], list):
            return args
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
                    if ["int", "bool", "double", "string"].__contains__(ty):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    hold = re.match(".*(\[.*\])", sec)
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
            return temp

    def exp_arr(self, args):
        # print(args)
        return args[0] + "[" + args[1] + "]"

    def init_func(self, args):
        self.code += "init_func\n"

    def init_class(self, args):
        self.code += "init_class\n"
        self.in_class = True

    def class_decl(self, args):
        # print("class_decl")
        before_here = self.code[:self.code.find("init_class")]
        code = self.code[self.code.find("init_class") + len("init_class") + 1:]
        after_here = code[code.find("end_class") + len("end_class") + 1:]
        code = code[:code.find("end_class")]
        code = code.replace("init_", args[1] + "_")
        for x in self.function_vars:
            before = code[:str(code).find(x)]
            after = code[str(code).find("return from " + x):]
            code = code[str(code).find(x):]
            code = code[:str(code).find("return from " + x)]
            # print(code, "\n hehe\n\n")
            # print(self.function_vars[x][::-1])
            if str(x).startswith(args[1] + "_"):
                for obj in self.function_vars[x]:
                    obj = obj[1]
                    for y in self.var_types:
                        if str(y).startswith(obj):
                            obj = y
                    code = code.replace(x + ":\n", x + ":\npop " + obj + "\n")
            code = before + code + after
        code = code.replace(":\n", ":\npop " + args[1] + "_this\n")
        self.code = before_here + code + after_here

        while str(self.code).count(args[1] + "_this."):
            before = self.code[:self.code.find(args[1] + "_this.")]
            found = self.code[:self.code.find("push " + args[1] + "_this.")]
            code = self.code[self.code.find(args[1] + "_this.") + len(args[1] + "_this."):]
            after = code[code.find("\n") + 1:]
            code = code[:code.find(" ")]
            offset = self.classes[args[1]].var_offsets[code]
            code = self.code[self.code.find(args[1] + "_this.") + len(args[1] + "_this."):]
            code = code[:code.find("\n")]
            t = self.make_temp()
            add_code = t + " = " + args[1] + "_this + " + str(offset) + "\n"
            # print("\n\nhi\n\n", code, "\n\nhehe\n\n")
            if code.count("= "):
                code = code[code.find("= ") + 2:]
                value = code
                add_code += "*(" + t + ") = " + value + "\n"
            else:
                add_code += t + " = *(" + t + ")\n"
                add_code += "push " + t + "\n"
                before = found

            self.code = before + add_code + after
        return args

    def end_class(self, args):
        self.code += "end_class\n"
        self.in_class = False

    def function(self, args):
        if isinstance(args[0].children[1], str):
            add_to_code = args[0].children[1]
            self.function_types[add_to_code] = 'return'
        else:
            add_to_code = args[0].children[0]
            self.function_types[add_to_code] = 'no_return'
        self.code += "return from " + add_to_code + "\n\n"
        before = self.code[:self.code.find("init_func")]
        after = self.code[(self.code.find("init_func") + 10):]
        self.code = before + add_to_code + ":\n" + after
        return args[0]

    def func_field(self, args):
        child = args[0].children
        if isinstance(child[1], str):
            add_to_code = child[1]
            self.function_types[add_to_code] = 'return'
        else:
            add_to_code = child[0]
            self.function_types[add_to_code] = 'no_return'
        self.code += "return from init_" + add_to_code + "\n\n"
        # print(self.code.find("init_func"))
        before = self.code[:self.code.find("init_func")]
        after = self.code[(self.code.find("init_func") + 10):]
        # print("before", before, "\n\n\n")
        self.code = before + "init_" + add_to_code + ":\n" + after
        # print("new code: \n", self.code, "\n\n\n")
        return args

    def return_func(self, args):
        # print("return_func", args)
        self.code += "push " + args[0] + " \n"
        return args[0]

    # todo func
    def function_call(self, args):
        # print("function call", args, self.in_class)
        try:
            self.last_code = self.code
            add = args[0]
            length = len(self.code)
            if self.in_class:
                # print(self.function_types)
                self.code += "push init_this\n"
                if self.last_class != "":
                    add = self.last_class + "_" + add
                else:
                    add = "init_" + add
            self.code += "Lcall " + add + "\n"
            t = self.make_temp()
            if self.function_types[str(args[0])] == 'return':
                self.code += "pop " + t + "\n"
            t = [args[0], "correct_init_this", length, t]
            # print("pop", t)
        except:
            t = args[0]
        return t

    def print(self, args):
        # print(args)
        count = args
        # print("print", count)
        while len(count) and isinstance(count[0], list):
            count = count[0]
        count = len(count)
        self.code += "Lcall Print " + str(count) + "\n"

    def push_args(self, args):
        # print("push_args", args)
        count = 0
        lee = []
        # print("pushshhhh", self.code)
        for x in args:
            if not isinstance(x, list):
                count += 1
                if not str(x).__contains__("this"):
                    self.code += "push " + x + " \n"
                lee.append(x)
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
        # pr(iden)
        return str(iden)

    def exp_normal(self, args):
        # print("normal", args)
        try:
            # print(args[0].children)
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
        # print(str_con)
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
