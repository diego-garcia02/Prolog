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

## 02_Evaluacion de expresiones 1

Tenemos la siguiente expresion: 3 + 6 + 6 + 2x3 + 2x5 y queremos convertirla a preorden. Para hacer eso primero tenemos que construir el arbol binario de la expresion identificando a nuestro nodo raiz.

El 	nodo raiz sera el de la operación que hagamos hasta el ultimo, es decir, la operacion que tiene menor jerarquia (en este caso, una suma) que este mas a la derecha.

Por lo tanto, nuestra expresion quedaria de la siguiente manera:

`(3+6+6+2x3)+(2*5)`

El signo mas que queda aislado sera nuestro nodo raiz y las expresiones entre parentesis seran sus hijos.

Puesto que del lado derecho ya no tenemos mas sumas, nos pasamos al lado izquierdo y hacemos el mismo procedimiento de identificar la suma que esta mas a la derecha.

Nuestra expresión quedaria asi:

`(3+6+(2*3))+(2*5)`

Una vez hemos terminado de identificar nuestros nodos raices podemos construir nuestro arbol el cual quedaria de la siguiente manera.

![](https://github.com/diego-garcia02/Prolog/tree/main/02_Evaluacion%20de%20expresiones%201/arbol_binario.jpg)

Ahora solo queda hacer el recorrido del arbol en preorden y asi tendremos nuestra expresión, la cual quedaria de la siguiente manera:

`(++++366x23x25)`

La expresion en postorden quedaria de la siguiente manera:

`(36+6+23*+25*+)`

###Evaluación de expresiones en la pila

Para verificar que nuestra expresión haya sido generada correctamente, lo que tenemos que hacer es evaluarla mediante una pila, y si al final de recorrer la expresion la pila queda solamente con un elemento numerico, significa que nuestra expresión ha sido generada correctamente.

```python
class Stack:
    def __init__(self, expresion):
       self.stack = []
       self.expresion = expresion[::-1]
```
En la clase Stack, lo primero que hacemos es inicializar la pila, e invertir la expresión que se nos proporcione, puesto que nos sera mas facil realizar la evaluación en preorden de esa manera.

```python
def evalPreorden(self):
        for i in self.expresion:
            if i != '*' and i != '+':
                self.stack.append(i)
            else:
                x = int(self.stack.pop())
                y = int(self.stack.pop())
                if i == '+':
                    self.stack.append(x+y)
                else:
                    self.stack.append(x*y)     
        
        return self.stack
```
El codigo de arriba se encarga de recorrer la expresión proporcionada mediante un ciclo for y en caso de que el elemento sea de tipo numerico, lo agrega a la pila. En caso contrario, saca los ultimos dos elementos de la pila, los convierte a enteros y, dependiendo de cual sea el simbolo actual, realiza la operación correspondiente y el resultado lo agrega a la pila.

```python
def evalPostorden(self):
        self.expresion = self.expresion[::-1]
        for i in self.expresion:
            if i != '*' and i!='+':
                self.stack.append(i)
            else:
                x = int(self.stack.pop())
                y = int(self.stack.pop())
                if i == '+':
                    self.stack.append(x+y) 
                else: 
                    self.stack.append(x*y) 
	return self.stack
```
Para realizar la evaluacion en postorden, el codigo es el mismo que el de la evaluación en preorden solo que volvemos a invertir la expresión proporcionada.

















