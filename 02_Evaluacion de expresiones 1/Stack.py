class Stack:
    def __init__(self, expresion):
       self.stack = []
       self.expresion = expresion[::-1]


        
    def evalPreorden(self):
        for i in self.expresion:
            if i != '*' and i != '+':
                self.stack.append(i)
                print(self.stack)
            else:
                x = int(self.stack.pop())
                y = int(self.stack.pop())
                if i == '+':
                    self.stack.append(x+y)
                else:
                    self.stack.append(x*y)     
        
        return self.stack
    
    def evalPostorden(self):
        self.expresion = self.expresion[::-1]
        for i in self.expresion:
            if i != '*' and i!='+':
                self.stack.append(i)
                print(self.stack)
            else:
                x = int(self.stack.pop())
                y = int(self.stack.pop())
                if i == '+':
                    self.stack.append(x+y) 
                else: 
                    self.stack.append(x*y) 

                

        
        
        return self.stack

        
       

 










   
            

    
            
        

  

        


    