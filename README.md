#Tareas de Prolog

##01 Laberinto

Consiste acerca de un programa que debe hallar la solución a un laberinto determinado por el programador.

___
	class Maze:
   		 def __init__(self, start=None):
       		 self.maze = [[1,1,0,0,0,0,1],
                     			 [1,1,0,1,1,0,1],
                     			 [1,'S',0,1,0,0,1],
                     			 [1,0,1,1,0,1,1],
                     			 [0,0,0,0,0,1,1],
                                 ['E',1,1,1,1,1,1]]
       		 self.start = start
  ___   
El metodo constructor define la matriz que va a actuar como nuestro laberinto, donde los unos son paredes y los ceros son los espacios por los cuales nuestro programa puede moverse para hallar la salida representada por la letra S a partir de la entrada representada por la letra E . 
Las coordenadas de inicio estan representadas por self.start.

```python
def getStartPoint(self):
        for row in self.maze:
            index = self.maze.index(row)
            for item in row:
                if item == 'E':
                   self.start = (row.index(item), index)
                   row[row.index(item)] = 'x'
```
Este metodo, como su nombre lo indica, va a obtener la posicion de inicio de nuestro laberinto por medio de dos ciclos que van a recorrer toda la matriz hasta toparse con un simbolo que sea igual al caracter E.  Al entrar al primer ciclo, guardamos el indice de la fila actual y al entrar al segundo y una vez se encuentra con E inicializamos la posicion de inicio con el indice del elemento en la fila actual junto con el indice de la fila actual.
Finalmente, marcamos la fila en el indice actual con una x.

```python
 def solve(self):
        if self.start is None:
            self.getStartPoint()
            
        self.searchNext(self.start[0],self.start[1])    
 ```
 La funcion solve es la principal de nuestro programa, pues a partir de ella, se ejecuta todo lo demas. Lo primero que hace es, en caso de que las coordenadas de inicio sean nulas, invoca a la funcion getStartPoint() que se vio anteriormente y luego se invoca a la funcion search junto con sus respectivas coordenadas.
```python
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
```

Esta función es la que se encarga de resolver el laberinto. Lo primero que hace es verificar si la coordenada y es menor a la longitud del laberinto y si la coordenada x es menor a la longitud de una de las filas del laberinto, en caso de ser asi, se dirige a comparar el valor del laberinto en las coordenadas x e y
y si es igual a cero, va y lo cambia por una x.
Seguidamente va a mandarse a invocar a ella misma, pero en las coordenadas x e y adyacentes a la posicion original, esto hasta encontrarse con una posicion donde el valor del laberinto sea igual a S.














