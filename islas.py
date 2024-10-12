class Ocean:
    def __init__(self):
        self.ocean =[[1,1,0,0,0],
                     [1,1,0,0,0],
                     [0,0,1,0,0],
                     [0,0,0,1,1]]
        self.isles = 0
        
          
    def resolver(self):
        for i in range(len(self.ocean)):
            for j in range(len(self.ocean[0])):
                if self.ocean[i][j] == 1:
                    self.isles += 1
                    self.findNeighbors(i,j)
        return self.isles
       
    def findNeighbors(self,x,y):
       
        if x<len(self.ocean[0]) and y<len(self.ocean) and x>=0 and y>=0:
                if self.ocean[y][x] == 1:
                    self.ocean[y][x] = 'x'
                    
                    self.findNeighbors(x+1,y)
                    self.findNeighbors(x-1,y)
                    self.findNeighbors(x,y+1)
                    self.findNeighbors(x,y-1)
      
     
    
           
        
            

            


           
            
            
                   
  
             
                  
                

ocean = Ocean()
print(ocean.resolver())

    
               

