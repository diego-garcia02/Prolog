class Stack:
    def __init__(self):
       self.item = []

    def push(self, data):
        self.item.append(data)

    def pop(self):
        self.item.pop()
    
    def printStack(self):
        for i in self.item:
            print(i)
 


stack = Stack()

stack.push(4)

stack.push()

stack.printStack()


   
            

    
            
        

  

        


    