class Maze:
    def __init__(self, start=None):
        self.maze = [[1,1,0,0,0,0,1],
                     [1,1,0,1,1,0,1],
                     [1,'S',0,1,0,0,1],
                     [1,0,1,1,0,1,1],
                     [0,0,0,0,0,1,1],
                     ['E',1,1,1,1,1,1]]
        self.start = start
       

    def getStartPoint(self):
        for row in self.maze:
            index = self.maze.index(row)
            for item in row:
                if item == 'E':
                   self.start = (row.index(item), index)
                   row[row.index(item)] = 'x'
                                      
                
    def solve(self):
        if self.start is None:
            self.getStartPoint()
            
        self.searchNext(self.start[0],self.start[1])    
        
      
        
       
       
    def searchNext(self,x,y):
            if y<len(self.maze) and x<len(self.maze[0]):
                if self.maze[x][y] == 0:
                    self.maze[x][y] = 'x'
                    self.searchNext(x+1,y)
                    self.searchNext(x-1,y)
                    self.searchNext(x,y+1)
                    self.searchNext(x,y-1)
                elif self.maze[x][y] == 'S':
                    print(x,y)


    def printMaze(self):
        print (len(self.maze[0]))

   
    
    



maze = Maze()
maze.solve()


                   


                            
                        
                        

                

        
        
    

    

   

    
    
    
