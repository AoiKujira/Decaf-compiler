import re

from lark import Token

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
        self.afterdot = False
        self.root_scope = Scope(None, 0)
        self.current_scope = self.root_scope
        self.scope_counter = 0
        self.code = ''''''
        self.lcounter = 0
        self.tcounter = 0
        self.tstack = []
        self.lstack = []
        self.loop_stack = []
        self.is_funcy = False
        self.classes = sym.classes
        self.sym = sym
        self.var_types = {}
        self.mem_checker = False
        self.function_types = {}
        self.function_types_specific = {}
        self.function_vars = sym.function_vars
        self.in_class = False
        self.last_code = ''''''
        self.new = False
        self.last_class = ""
        self.function_class = {}
        self.func_call = False

    def expr(self, args):
        # print("expr", args)
        # print("normal", args)
        if self.new and not isinstance(args[0], str):
            #     self.code += "Lcall " + self.last_class + "_" + args[0][0][1] + "\n"
            self.new = False
            self.last_class = ""
        return args[0]

    def after_dot(self, args):
        self.afterdot = True

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
        # print("lab", t)
        # print(self.code)
        self.code += "Ifz " + t + " goto " + lab + "\n"
        self.lstack.append(lab)

    def if_out_label(self, args):
        out = self.lstack.pop()
        self.code += out + ":\n"

    def start_vars(self, args):
        self.is_varring = True

    def stop_vars(self, args):
        self.is_varring = False

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
        self.last_class = args[0]
        size = self.classes[args[0]].size
        t = self.make_temp()
        self.code += t + " = Allocate " + str(size) + "\n"
        self.new = True
        # print(self.code, "\n\nhehe\n\n")
        return [t, args[0]]

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
            if self.afterdot:
                raise Exception()
            while not (cur.table.keys().__contains__(iden)):
                cur = cur.parent
                # print(cur.table, "asdfasf", cur.number)
            self.var_types[iden + str(cur.number)] = cur.table[iden]
            return iden + str(cur.number)
        except:
            return iden

    def exp_mem(self, args):
        lee = []
        for a in args:
            if a is not None:
                lee.append(a)
        print("exp_mem", lee)
        self.afterdot = False
        if self.func_call:
            if isinstance(lee[0], str) and len(lee[1]) == 4:
                self.func_call = False
                add = self.var_types[lee[0]] + "_" + lee[1][0]
                self.code += "push " + lee[0] + "\n"
                self.code += "Lcall " + add + "\n"
                # print(self.function_types)
                if (self.function_types.__contains__(add) and self.function_types[add] == 'return') \
                        or (self.function_types.__contains__("init_" + lee[1][0]) and
                            self.function_types["init_" + lee[1][0]] == 'return'):
                    self.code += "pop " + lee[1][3] + "\n"
                return lee[1][3]
            elif self.new:
                # print(3)
                # print(self.code)
                # print(args)
                self.new = False
                self.func_call = False
                self.code += "push " + lee[0][0] + "\n"
                add = lee[0][1] + "_" + lee[1][0]
                self.code += "Lcall " + add + "\n"
                if self.function_types[add] == 'return':
                    self.code += "pop " + lee[1][3] + "\n"
                return lee[1][3]
        if isinstance(lee[0], list) and isinstance(lee[1], list):
            return lee
        if isinstance(lee[0], str) and dict(self.var_types).__contains__(lee[0]) and \
                dict(self.function_vars).__contains__(self.var_types[lee[0]] + "_" + str(lee[1])):
            self.code = self.last_code
            self.code = self.code[:self.code.find("Lcall " + lee[1])]
            self.code += "\npushaddressof " + lee[0] + "\n"
            self.code += "Lcall " + self.var_types[lee[0]] + "_" + lee[1] + "\n"
            return lee
        self.mem_checker = True
        if isinstance(lee[1], list):
            # print(2)
            lee = [lee[0]]
            for a in lee[1]:
                # print(a)
                if a is not None:
                    lee.append(a)
            # print(lee)
            return lee
        elif len(lee) == 3:
            # print([args[0], args[1]])
            return [lee[0], lee[2]]
        else:
            return [lee[0], lee[1]]

    def dec_const(self, args):
        t = self.make_temp()
        dec = args[0]
        self.var_types[t] = "int"
        self.code += "assign " + t + " i= " + dec + "\n"
        return t

    def hex_const(self, args):
        t = self.make_temp()
        dec = int(args[0], 16)
        self.var_types[t] = "int"
        self.code += "assign " + t + " i= " + str(dec) + "\n"
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

    def expr_const(self, args):
        if isinstance(args[0], str):
            return args[0]
        if not isinstance(args[0].children[0], Token):
            return args[0].children[0]
        ty = args[0].children[0].type
        print(ty, print(args[0].children[0]))
        t = self.make_temp()
        if ty == "STRING_CONSTANT":
            self.var_types[t] = "string"
            self.code += "assign " + t + " s= " + args[0].children[0] + "\n"
        elif ty == "BOOL_CONSTANT":
            self.var_types[t] = "bool"
            self.code += "assign " + t + " b= " + args[0].children[0] + "\n"
        elif ty == "int_constant":
            self.var_types[t] = "int"
            self.code += "assign " + t + " i= " + args[0].children[0] + "\n"
        elif ty == "DOUBLE_INT":
            self.var_types[t] = "double"
            self.code += "assign " + t + " f= " + args[0].children[0] + "\n"
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
        print("exp_nine", args)
        # print(self.code, "\n\nhehe\n\n")
        if self.new:
            self.new = False
            return args[0][0]
        if not isinstance(args[0], list) and str(args).__contains__("exp_this"):
            return "init_this"
        if isinstance(args[0], list) and isinstance(args[0][1], list) and self.func_call:
            print("here")
            args = args[0]
            push = args[0]
            add = self.var_types[args[0]] + "_" + args[1][0]
            # lee = []
            # print(self.code, "\n\nhihhi\n\n")
            for i in range(1, str(args).count("correct_init_this") + 1):
                self.code += "push " + push + "\n"
                self.code += "Lcall " + add + "\n"
                # print(self.function_types, add)
                if self.function_types[add] == 'return':
                    self.code += "pop " + args[1][3] + "\n"
                push = args[1][3]
                if len(args) > 2:
                    if isinstance(args[2][0], list):
                        print(args)
                        args = [args[0], args[2][0], args[2][1]]
                    else:
                        print(args)
                        args = [add, args[1][3], args[2]]
                if self.function_types_specific.__contains__(add):
                    add = self.function_types_specific[add] + "_" + args[1][0]
            print(add, args, self.mem_checker)
            # return self.exp_mem(args)
            # print(args, [args[1][3], args[1][0], args[0]]
        if self.func_call:
            # print("heyyy", args, self.function_types)
            self.func_call = False
            if str(args).__contains__("exp_this"):
                self.code += "push init_this\n"
                add = args[0][1]
            else:
                add = args[0][0]
                if self.function_types.__contains__("init_" + add):
                    self.code += "push init_this\n"
            self.code += "Lcall init_" + add + "\n"
            temp = ""
            if self.function_types_specific.__contains__(add):
                temp = self.make_temp()
                self.code += "pop " + temp + "\n"
            return temp
        if self.var_types.__contains__(args[0][0]) and not self.function_types.__contains__(args[0][1]) \
                and self.classes[self.var_types[args[0][0]]].var_offsets.__contains__(args[0][1]):
            t = self.make_temp()
            # print("heh", args)
            offset = self.classes[self.var_types[args[0][0]]].var_offsets[args[0][1]]
            self.code += t + " = " + args[0][0] + " + " + str(offset) + "\n"
            self.code += t + " = *(" + t + ")\n"
            return t
        if len(args[0]) == 3 and self.var_types.__contains__(args[0][2]) and self.function_types.__contains__(
                args[0][1]):
            # print("yaaaaaaaaay")
            self.code = self.last_code
            self.code += "push " + args[0][2] + "\n"
            self.code += "Lcall " + args[0][1] + "\n"
            t = ""
            if self.function_types[args[0][1]] == "return":
                t = self.make_temp()
                self.code += "pop " + t + "\n"
            return t
        if str(args).__contains__('exp_this'):
            # print("here")
            return 'init_this.' + args[0][1]
        if isinstance(args[0], list) and (not self.mem_checker or str(args).__contains__("correct_init_this")):
            # print("here")
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
            print("memmmmm")
            # print(self.code)
            self.mem_checker = False
            if not isinstance(args[0], list):
                self.mem_checker = True
                return args[0]
            temp = self.make_temp()
            lee = args[0]
            first = lee[0]
            # print(self.code)
            for i in range(1, len(lee)):
                sec = lee[i]
                t = self.var_types[first]
                c: Class = self.classes[t]
                # handle array members
                print(lee)
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
                print(c.var_offsets, sec)
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
        self.is_funcy = True
        self.code += "init_func\n"

    def exit_func(self, args):
        self.is_funcy = False

    def init_class(self, args):
        self.code += "init_class\n"
        self.in_class = True

    def class_decl(self, args):
        # print("class_decl")
        # print(self.code, "\n\nhahah\n\n")
        # print("before", self.function_types)
        new_function_types = {}
        for x in self.function_types:
            if str(x).__contains__("init_"):
                # print(args[1], x, x[(x.find["_"] + 1):])
                new_function_types[args[1] + x[x.find("_"):]] = self.function_types[x]
            else:
                new_function_types[x] = self.function_types[x]
        self.function_types = new_function_types
        # print("after", self.function_vars)
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
            # print(x, self.function_vars[x])
            if str(x).startswith(args[1] + "_") and self.function_vars[x] is not None:
                for obj in self.function_vars[x]:
                    obj = obj[1]
                    for y in self.var_types:
                        if str(y).startswith(obj):
                            obj = y
                    code = code.replace(x + ":\n", x + ":\npop " + obj + "\n")
            code = before + code + after
        # print("class_decl", self.function_vars)
        for x in self.function_vars:
            code = code.replace(x + ":\n", x + ":\npop " + args[1] + "_this\n")
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

        # print(self.code, "\n\nhehe\n\n")
        return args

    def end_class(self, args):
        self.code += "end_class\n"
        self.in_class = False

    def function(self, args):
        # print("function", args[0].children)
        self.function_class[args[0].children[0]] = "global"
        child = args[0].children
        if child[1] is not None:
            self.function_types_specific[child[1]] = child[0]
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
        # print("function", child)
        if child[1] is not None:
            self.function_types_specific[child[1]] = child[0]
        if isinstance(child[1], str):
            add_to_code = child[1]
            self.function_types["init_" + add_to_code] = 'return'
        else:
            add_to_code = child[0]
            self.function_types["init_" + add_to_code] = 'no_return'
        self.code += "return from init_" + add_to_code + "\n\n"
        before = self.code[:self.code.find("init_func")]
        after = self.code[(self.code.find("init_func") + 10):]
        self.code = before + "init_" + add_to_code + ":\n" + after
        return args

    def return_func(self, args):
        # print("return_func", args)
        self.code += "push " + args[0] + " \n"
        return args[0]

    def function_call(self, args):
        # print("function call", args, self.last_class)
        try:
            self.func_call = True
            self.last_code = self.code
            add = args[0]
            length = len(self.code)
            t = self.make_temp()
            t = [add, "correct_init_this", length, t]
            # print(t)
            # print("pop", self.code, "\n\npop\n\n")
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
        # print(self.code, "\n\nhehe\n\n")

    def push_args(self, args):
        # print("push_args", args)
        count = 0
        lee = []
        # print("pushshhhh", self.code)
        for x in args:
            if not isinstance(x, list):
                count += 1
                # if not str(x).__contains__("this"):
                self.code += "push " + x + " \n"
                lee.append(x)
        # print(self.code, "\n\nhaha\n\n")
        return lee

    def pop_scope(self, args):
        self.current_scope = self.current_scope.parent

    def push_scope(self, args):
        self.start_vars = True
        self.scope_counter += 1
        new_scope = Scope(self.current_scope, self.scope_counter)
        self.current_scope.children.append(new_scope)
        self.current_scope = new_scope

    def variable(self, args):
        ident = args[1]
        if self.is_funcy:
            self.current_scope.table[ident] = args[0]
        # print(self.current_scope.table, self.current_scope.number)

    def IDENT(self, iden):
        # pr(iden)
        return str(iden)

    def exp_normal(self, args):
        # print("normal", args)
        self.afterdot = False
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
        while self.var_types.keys().__contains__(t):
            self.tcounter += 1
            t = "tempo" + str(self.tcounter)
        self.tcounter += 1
        return t
