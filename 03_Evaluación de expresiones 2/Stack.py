class Stack:
    def __init__(self, expresion):
       self.stack = []
       self.expresion = expresion[::-1]
             
    def evalPreorden(self):
        chain = ""
        for i in self.expresion:
            if i != '*' and i != '+' and i!='(' and i!='-':
                self.stack.append(i)
            elif i == '*' or i=='+' or i=='-':
                x = int(self.stack.pop())
                y = int(self.stack.pop())
                if i == '+':
                    self.stack.append(x+y)
                elif i=='*':
                    self.stack.append(x*y)  
                else:
                    self.stack.append(x-y)  
            else:
                item = self.stack.pop()
                while item != ')':
                    chain = chain + item
                    item = self.stack.pop()
                self.stack.append(int(chain))

                      

        return self.stack
    
    def evalPostorden(self):
        chain = ""
        self.expresion = self.expresion[::-1]
        for i in self.expresion:
            if i!= '+' and i!='*' and i!=')' and i!='-':
                self.stack.append(i)
            elif i == '*' or i=='+' or i=='-':
                x = int(self.stack.pop())
                y = int(self.stack.pop())
                if i == '+':
                    self.stack.append(x+y) 
                elif i== '*': 
                    self.stack.append(x*y)
                else:
                    self.stack.append(y-x)
            else:
                item = self.stack.pop()
                while item != '(':
                    chain = chain + item
                    item = self.stack.pop()
                chain = chain[::-1]
                self.stack.append(int(chain))               
        
        return self.stack
    
stack = Stack("67+8+9+(10)3*32+2-++")
print(stack.evalPostorden())