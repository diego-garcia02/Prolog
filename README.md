# Tareas de Prolog

## 01 Laberinto

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

### Funcionamiento del programa

Para verificar el correcto funcionamiento de nuestro programa instanciamos un objeto de la clase maze e invocamos al metodo solve:

![] (https://github.com/diego-garcia02/Prolog/blob/main/01_Laberinto/programa_funcionando.png)

Como se observa, el programa arroja las coordenadas correctas, y asi concluye esta tarea.

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

![] (https://github.com/diego-garcia02/Prolog/tree/main/02_Evaluacion%20de%20expresiones%201/arbol_binario.jpg)

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

#### Evaluación en preorden

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

#### Evaluación en postorden

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

### Funcionamiento del programa

Para verificar que nuestro programa funciona, instanciamos un objeto de la clase Stack y la pasamos la expresion a evaluar, luego ejecutamos el metodo evalPreorden().

![] (https://github.com/diego-garcia02/Prolog/blob/main/02_Evaluacion%20de%20expresiones%201/expresion_preorden.png)

Se observa que lo unico que queda en la pila es el numero 31 el cual es el resultado de evaluar la expresión.

![] (https://github.com/diego-garcia02/Prolog/blob/main/02_Evaluacion%20de%20expresiones%201/expresion_postorden.png)

Se observa lo mismo al evaluar la expresión en postorden y con eso concluimos esta tarea.

## 03_Evaluación de expresiones 2

Debemos convertir la expresión (6+7+8+9+10*3+3+2-2) y evaluarla en la pila para lo cual debemos agrupar terminos respetando la jerarquia de operaciones y crear el arbol.

La expresión agrupada quedaria de la siguiente manera:

`(6+7+8+9)+((10*3)+(3+2-2))`

El unico signo + que no esta entre parentesis servira como nuestro nodo raiz y el arbol quedaria de la siguiente manera:

![] (https://github.com/diego-garcia02/Prolog/tree/main/03_Evaluacion%20de%20expresiones%202/arbol_binario.jpg)

Asi quedaria la expresion en preorden:

`++++6789+*(10)3-+322`

Y la expresión en postorden:

`67+8+9+(10)3*32+2-++`

### Evaluación de expresiones usando la pila

El codigo para este caso es practicamente el mismo que el del ejercicio anterior, con unas modificaciones en las funciones para evaluar en preorden y postorden.

#### Evaluación en preorden
```python
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
 ```
Primero que nada, inicializamos una cadena vacia que nos servira para almacenar el valor del numero entre parentesis, agregamos la operacion de resta para que no agregue el simbolo a la pila si se encuentra con el y para que haga la resta entre los dos ultimos elementos de la pila.

Como la cadena esta invertida, si encuentra el simbolo de '(' significa que  ahora debe sacar elementos de la pila y concatenarlos en una cadena hasta encontrarse con el simbolo ')' ,seguidamente convertimos la cadena a entero y la agregamos a la pila.


#### Evaluación en postorden

```python
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
```
El codigo para evaluar en postorden es muy similar al anterior para evaluar en preorden, solo que aqui volvemos a invertir la cadena y en lugar de que se pare a volver a recorrer la pila para sacar y concatenar elementos cuando se encuentra con  '(', lo hace cuando se encuentra con ')', en la operación de resta en lugar de restar x-y, restamos y-x, debido a que como la cadena ya no esta invertida el sustraendo se añade despues a la pila, y a la hora sacar elementos de la pila invertimos la cadena ahora si la agregamos a la pila.

### Funcionamiento del programa

Para verificar que nuestro programa funciona, instanciamos un objeto de la clase Stack y la pasamos la expresion a evaluar, luego ejecutamos el metodo evalPreorden().

![] (https://github.com/diego-garcia02/Prolog/blob/main/03_Evaluaci%C3%B3n%20de%20expresiones%202/evaluacion_preorden.png)

Se observa que lo unico que queda en la pila es el numero 63 el cual es el resultado de efectuar la expresión.

![] (https://github.com/diego-garcia02/Prolog/blob/main/03_Evaluaci%C3%B3n%20de%20expresiones%202/evaluaci%C3%B3n_postorden.png)

Se observa lo mismo al evaluar la expresión en postorden y con eso concluimos esta tarea.

## Ejercicios

### 1. Python

```python
def fibonacci(n): 
    a = 1
    b = 0
    for i in range(n):
        print(str(a)+",",end="")
        a = a + b 
        b = a - b

print(fibonacci(7))

def factorial(num):
    if num == 0 or num == 1:
        return 1
    else:
        return num*factorial(num-1)
    
print(factorial(8))

def palindroma(cadena):
    return cadena == cadena[::-1]
```

**Tipado:** Python es un lenguaje no tipado, es decir, el tipo de dato se asigna al momento de inicializar una variable sin que tenga que ser definido por el programador.

Algunos tipos de datos utilizados en la elaboración de estos programas:
- Integer o entero
- String o cadena
- Booleanos 

**Paradigma:** Multiparadigma

### Funcionamiento de los programas

Se observa que los programas funcionan correctamente

![] (https://github.com/diego-garcia02/Prolog/blob/main/04_Ejercicios/Ejercicios%20en%20Python.png)

## 2. Java 
```java
public class Ejercicios{
public static void main(String[] args){
    fibonacci(8);
    System.out.println(factorial(5));
    System.out.println(palindroma("anitalavalatina"));
}

public static void fibonacci(int n){
    int a = 1;
    int b = 0; 
    if(n > 0){
    for(int i=0;i<n;i++){
        System.out.print(a+",");
        a = a + b;
        b = a - b;

    }
    }else{
        System.out.println("Por favor! Introducza un entero valido");
    }
    System.out.println("");
}


public static int factorial(int n){
    if(n == 0 || n == 1){
        return 1;
    }else{
        return n*factorial(n-1);
    }
}
public static boolean palindroma(String cadena){
    char[] char_array = new char[cadena.length()];
    int index = 0;
    for(int i=cadena.length()-1;i>=0;i--){
        char_array[index] = cadena.charAt(i);
        index++;     

    }

    String cadena2 = String.valueOf(char_array);
    
    return cadena.equals(cadena2);
    
    
}

}
```

**Tipado:** Java es un lenguaje fuertemente tipado puesto que, nosotros como programadores debemos definir el tipo de dato al momento de declarar una variable. Java tampoco acepta incompatibilidad de tipos, por lo que no podemos meter caracteres en un arreglo de enteros, por ejemplo.

Algunos tipos de datos utilizados en estos programas:
- Enteros o Integer
- Caracteres o chars
- Strings o cadenas
- Booleanos

**Paradigma:** Orientado a objetos, imperativo

### Funcionamiento de los programas

Se observa que los programas funcionan correctamente

![] (https://github.com/diego-garcia02/Prolog/blob/main/04_Ejercicios/Ejercicios%20en%20Java.png)

## 3. C

```c
#include <stdio.h>
void main(){
    fibonacci(5);

    int a = factorial(5);

    printf("%d\n",a);

    int c = palindroma("otto");
    printf("%d\n", c);
}

void fibonacci(int n){
    int a = 1;
    int b = 0;
    for(int i=1;i<=n;i++){
        printf("%i , ",a);
        a = a + b;
        b = a - b;
    }
    printf("\n");
}

int factorial(int num){
    if(num == 1 || num == 0){
        return 1;
    }else{
        return num*factorial(num-1);
    }
}

int palindroma(char* cadena){
    int longitud =  strlen(cadena);
    
    char cadena2[longitud];
    int cont = 0;
    for(int i = longitud-1; i>=0;i--){
        cadena2[cont] = cadena[i];
        cont++;
    }
    cont = 0;
    for(int i=0;i<longitud;i++){
        if(cadena[i] == cadena2[i]){
            cont++;
        }
    }

    if(cont == longitud){
        return 1;
    }else{
        return 0;
    }


}
```
**Tipado:** C es, al igual que Java, un lenguaje fuertemente tipado, solo que la diferencia es que este carece de tipos de datos considerados fundamentales a la hora de programar como serian los strings y los boolean.

Algunos tipos de datos utilizados en la elaboración de estos programas:
- Enteros o Integers
- Caracteres o chars

**Paradigma:** Imperativo, estructurado

### Funcionamiento de los programas

Se observa que los programas funcionan correctamente

![] (https://github.com/diego-garcia02/Prolog/blob/main/04_Ejercicios/Ejercicios%20en%20C.png)



















