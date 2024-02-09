class Node:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data
    
    def insert(self, data):
        if self.data is None:
            self.data = data
        else:
            if data < self.data:
                if self.left is None:
                    self.left = Node(data)
                else:
                    self.left.insert(data)
            elif data > self.data:
                if self.right is None:
                    self.right = Node(data)
                else:
                    self.right.insert(data)
    

def inOrderPrint(root):
        if root is None:
            return 
        inOrderPrint(root.left)
        print(root.data)
        inOrderPrint(root.right)

def preOrderPrint(root):
    if root is None:
        return
    print(root.data)
    preOrderPrint(root.left)
    preOrderPrint(root.right)

def postOrderPrint(root):
    if root is None:
        return
    postOrderPrint(root.left)
    postOrderPrint(root.right)
    print(root.data)
    
if __name__ == '__main__':
    root = Node(6)
    root.insert(4)
    root.insert(1)
    root.insert(3)
    root.insert(8)
    root.insert(11)
    root.insert(7)
   
    postOrderPrint(root)

    





        
    

        



    



    

    

    

        
        

        

    

