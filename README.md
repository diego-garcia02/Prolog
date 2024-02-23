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

**Tipado:** Python es un lenguaje no tipado, es decir, el tipo de dato se asigna al momento de inicializar una variable sin que tenga que ser definido por el programador, lo que significa que es un lenguaje dinamicamente tipado.

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

**Tipado:** Java es un lenguaje fuertemente y estaticamente tipado puesto que, nosotros como programadores debemos definir el tipo de dato al momento de declarar una variable. Java tampoco acepta incompatibilidad de tipos, por lo que no podemos meter caracteres en un arreglo de enteros, por ejemplo.

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
**Tipado:** C es, al igual que Java, un lenguaje fuertemente tipado, solo que la diferencia es que este carece de tipos de datos considerados fundamentales a la hora de programar como serian los strings y los boolean. Es de tipado estatico puesto que el tipo de los datos se conoce en tiempo de compilación.

Algunos tipos de datos utilizados en la elaboración de estos programas:
- Enteros o Integers
- Caracteres o chars

**Paradigma:** Imperativo, estructurado

### Funcionamiento de los programas

Se observa que los programas funcionan correctamente

![] (https://github.com/diego-garcia02/Prolog/blob/main/04_Ejercicios/Ejercicios%20en%20C.png)

## 4. Perl
```perl
sub fibonacci{
    my $a = 1;
    my $b = 0;
    my $n = shift;

    for(my $i = 0; $i<$n; $i++){
        print $a;
        print ',';
        $a = $a + $b;
        $b = $a - $b;
    }
    print "\n";

}
  

sub factorial{
    my $n = shift;
    if($n == 0 || $n == 1){
        return 1;
    }else{
        return $n*factorial($n-1);
    }
}

sub palindroma{
    my $string = shift;
    my $string2 = reverse $string;

    if($string eq $string2){
        return 1;
    }else{
        return 0;
    }
}
fibonacci(9);
print factorial(6)."\n";
print palindroma("otto")."\n";
```
**Tipado:** Es un lenguaje debilmente tipado y de tipado dinamico puesto que no hay una distincion entre los tipos de datos que se usan en nuestro programa y no se conocen hasta que llega el tiempo de ejecución.

Algunos tipos de datos utilizados en la elaboración de estos programas:
- Integers o enteros
- Strings o cadenas
- Booleanos

**Paradigma:** Multiparadigma

Se observa que los programas funcionan correctamente

![] (https://github.com/diego-garcia02/Prolog/blob/main/04_Ejercicios/Ejercicios%20en%20Perl.png)


## 5. Go
```go
package main
import ("fmt";"strings")

func main(){
	fibonacci(8);
	fmt.Println(factorial(10));
	fmt.Println(palindroma("ot"));
}

func fibonacci(num int){
	a := 1;
	b := 0;
	for i:=0;i<num;i++ {
		fmt.Print(a);
		fmt.Print(",");
		a = a + b;
		b = a - b;
	}
	fmt.Println("");
}

func factorial(num int) int{
	if num == 0 || num == 1 { 
		return 1;
	}else {
		return num*factorial(num-1);
	}
}

func palindroma(cadena string) bool{
	str := strings.SplitAfter(cadena, "");
	var cadena2 string;
	for i:=len(str)-1;i>=0;i--{
		cadena2 += str[i];
	}

	if(cadena2 == cadena){
		return true;
	}else{
		return false;
	}
    
	
	

}
```
**Tipado:** A diferencia de lenguajes como C, que los datos siempre son fuertemente tipados y lenguajes como Python, que siempre son debilmente tipados, no es el caso en Go, puesto que si tu declaras una variable tienes que especificar de que valor es, pero si tu inicializas una variable sin la palabra "var" antes y le asignas cualquier valor, Go no se complicara mucho sabiendo que tipo de dato es y simplemente se lo asignara de acuerdo a lo que haya almacenado en la variable. Sin embargo, dado que se trata de un lenguaje al que debemos compilar primero para luego ejecutarlo su tipado seria estatico.

Algunos tipos de datos utilizados en estos programas:
- Integers o enteros
- Strings o cadenas
- Booleanos

**Paradigma:**  Imperativo, estructurado

Se observa que los programas funcionan correctamente

![] (https://github.com/diego-garcia02/Prolog/blob/main/04_Ejercicios/Ejercicios%20en%20Go.png)





## Funciones de Lisp 

### Función Max

Devuelve el valor mas alto de un conjunto de numeros dado.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/01_Max.png)

### Función Min

Devuelve el valor mas equeño de un conjunto de numeros dado.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/02_Min.png)

### Función Abs

Devuelve el valor absoluto de cualquier numero ingresado, devuelve lo mismo si el valor ingresado es positivo.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/03_Abs.png)

### Función Sqrt

Devuelve la raiz cuadrada del numero ingresado.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/04_Sqrt.png)

### Función Eval 

Evalua la expresion dada.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/05_Eval.png)

### Función Print

Imprime la expresion dada.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/06_Print.png)

### Función Car

Retorna el primer elemento de la lista dada.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/07_Car.png)

### Función Cdr

Retorna la cola de la lista dada, es decir, todos los elementos de la lista a excepción de la cabeza.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/08_Cdr.png)

### Función Cons

Añade la primera lista a la segunda lista.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/09_Cons.png)

### Función Append

Une dos listas en una sola.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/10_Append.png)

### Función Member

Retorna una lista con los elementos que vayan despues del elemento proporcionado en el primer argumento incluyendo a ese mismo elemento.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/11_Member.png)

### Función Cadr

Retorna el segundo elemento de una lista.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/12_Cadr.png)

### Función List

Genera una lista a partir de los elementos proporcionados.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/13_List.png)

### Función Caddr

Retorna el tercer elemento de la lista dada.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/14_Caddr.png)

### Función Reverse

Genera una lista invertida de varios elementos encerrados entre parentesis.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/15_Reverse.png)

### Función Listp

Retorna T en caso de que el elemento proporcionado sea una lista, caso contrario, retorna NIL.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/16_Listp.png)

### Función Equal

Retorna T en caso de que los dos elementos proporcionados sean iguales, caso contrario, retorna NIL.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/17_Equal.png)

### Función Minusp

Retorna T si el elemento proporcionado es un numero negativo, caso contrario, retorna NIL.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/18_Minusp.png)

### Función Plusp

Retorna T si el elemento proporcionado es un numero positivo, caso contrario, retorna NIL.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/19_Plusp.png)

### Función Numberp

Retorna T si el elemento proporcionado es un numero, caso contrario, retorna NIL.

Ejemplo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/05_Funciones%20Lisp/20_Numberp.png)

## Areas y volumenes 

### Area de un cuadrado

```
(defun areaCuadrado()
    (print "Dame el lado del cuadrado: ")
    (setq lado (read))
    (setq resultado (* lado lado))
    (write resultado)
)
```
Saca el area de un cuadrado a partir del lado dado.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaCuadrado.png)

### Area de un triangulo

```
(defun areaTriangulo()
    (print "Dame la base del triangulo: ")
    (setq base (read))
    (print "Dame la altura del triangulo: ")
    (setq altura (read))
    (setq resultado ( / (* base altura) 2 ))
    (write resultado)
)
```
Saca el area de un triangulo a partir de su base y altura.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaTriangulo.png)

### Area de un rectangulo

```
(defun areaRectangulo() 
    (print "Dame la base del rectangulo: ")
    (setq base (read))
    (print "Dame la altura del rectangulo: ")
    (setq altura (read))
    (setq resultado (* base altura))
    (write resultado)
)

```
Saca el area de un rectangulo a partir de su base y altura.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaRectangulo.png)

### Area de un pentagono

```
(defun areaPentagono()
    (print "Dame el lado del pentagono: ")
    (setq lado (read))
    (setq perimetro (* 5 lado))
    (print "Dame la apotema del pentagono: ")
    (setq apotema (read))
    (setq resultado (/ (* perimetro apotema) 2))
    (write resultado)
)

```
Saca el area de un pentagono a partir de su lado y apotema.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaPentagono.png)

### Area de un hexagono

```
(defun areaHexagono()
    (print "Dame el lado del hexagono: ")
    (setq lado (read))
    (setq perimetro (* 6 lado))
    (print "Dame la apotema del hexagono: ")
    (setq apotema (read))
    (setq resultado (/ (* perimetro apotema) 2))
    (write resultado)
)

```
Saca el area de un hexagono a partir de su lado y apotema.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaHexagono.png)

### Area de un heptagono

```
(defun areaHeptagono()
    (print "Dame el lado del heptagono: ")
    (setq lado (read))
    (setq perimetro (* 7 lado))
    (print "Dame la apotema del heptagono: ")
    (setq apotema (read))
    (setq resultado (/ (* perimetro apotema) 2))
    (write resultado)
)

```
Saca el area de un heptagono a partir de su lado y apotema.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaHeptagono.png)

### Area de un Octagono

```
(defun areaOctagono()
    (print "Dame el lado del octagono: ")
    (setq lado (read))
    (setq perimetro (* 8 lado))
    (print "Dame la apotema del octagono: ")
    (setq apotema (read))
    (setq resultado (/ (* perimetro apotema) 2))
    (write resultado)
)

```
Saca el area de un octagono a partir de su lado y apotema.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaOctagono.png)

### Area de un circulo

```
(defun areaCirculo()
    (print "Dame el radio del circulo: ")
    (setq radio (read))
    (setq resultado ( * 3.1416 (* radio radio)))
    (write resultado)
)

```
Saca el area de un circulo a partir de su radio.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaCirculo.png)

### Area de un trapecio

```
(defun areaTrapecio()
    (print "Dame la base menor del trapecio: ")
    (setq bmenor (read))
    (print "Dame la base mayor del trapecio: ")
    (setq bmayor (read))
    (print "Dame la altura del trapecio: ")
    (setq altura (read))
    (setq resultado  (/ (* altura (+ bmenor bmayor)) 2))
    (write resultado)
)

```
Saca el area de un trapecio a partir de su base menor, su base mayor y su altura.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaTrapecio.png)

### Area de un rombo

```
(defun areaRombo()
    (print "Dame la diagonal menor del rombo: ")
    (setq dmenor (read))
    (print "Dame la diagonal mayor del rombo: ")
    (setq dmayor (read))
    (setq resultado (/ (* dmenor dmayor) 2))
    (write resultado)
)
```
Saca el area de un rombo a partir de su diagonal menor y de su diagonal mayor.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/areaRombo.png)

## Volumen de una esfera

```
(defun volumenEsfera()
    (print "Dame el radio de la esfera")
    (setq radio (read))
    (setq resultado (* (/ 4 3) (* 3.1416 (* radio (* radio radio)))))
    (write resultado)
)

```

Saca el volumen de una esfera a partir de su radio

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenEsfera.png)


## Volumen de un cubo

```
(defun volumenCubo() 
    (print "Dame el lado del cubo")
    (setq lado (read))
    (setq resultado (* lado (* lado lado)))    
    (write resultado)
)
```

Saca el volumen de un cubo a partir de su lado

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenCubo.png)

## Volumen de un cono

```
(defun volumenCono()
    (print "Dame el radio de la base del cono: ")
    (setq radio (read))
    (print "Dame la altura del cono: ")
    (setq altura (read))
    (setq resultado (/ (* 3.1416 (* altura (* radio radio))) 3))
    (write resultado)
)
```

Saca el volumen de un cono a partir de el radio de la base y su altura

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenCono.png)

## Volumen de un piramide cuadrangular

```
(defun volumenPiramideCuadrangular()
    (print "Dame el lado de la base de la piramide: ")
    (setq lado (read))
    (setq areabase (* lado lado))
    (print "Dame la altura de la piramide: ")
    (setq altura (read))
    (setq resultado ( / (* areabase altura) 3))
    (write resultado)
)
```
Saca el volumen de una piramide a partir de el lado de la base y su altura 

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenPiramideCuadrangular.png)

## Volumen de un cilindro

```
(defun volumenCilindro()
    (print "Dame el radio de la base del cilindro")
    (setq radio (read))
    (setq areabase (* 3.1416 (* radio radio)))
    (print "Dame la altura del cilindro")
    (setq altura (read))
    (setq resultado (* areabase altura))
    (write resultado)
)
```
Saca el volumen de un cilindro a partir de el radio de la base y su altura 

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenCilindro.png)


## Volumen de un prisma rectangular

```
(defun volumenPrismaRectangular()
    (print "Dame el largo del prisma: ")
    (setq largo (read))
    (print "Dame el ancho del prisma: ")
    (setq ancho (read))
    (print "Dame la altura del prisma: ")
    (setq altura (read))
    (setq resultado (* altura (* largo ancho)))
    (write resultado)
)
```
Saca el volumen de un prisma rectangular a partir de su largo, su ancho y su altura 

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenPrismaRectangular.png)


## Volumen de un prisma triangular

```
(defun volumenPrismaTriangular()
    (print "Dame la base del triangulo: ")
    (setq base (read))
    (print "Dame la altura del triangulo: ")
    (setq alturabase (read))
    (setq areabase (/ (* base alturabase) 2))
    (print "Dame la altura del prisma: ")
    (setq altura (read))
    (setq resultado (* areabase altura))
    (write resultado)
)
```
Saca el volumen de un prisma triangular a partir de la base del triangulo, su altura y la altura del prisma.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenPrismaTriangular.png)


## Volumen de un prisma pentagonal

```
(defun volumenPrismaTriangular()
    (print "Dame la base del triangulo: ")
    (setq base (read))
    (print "Dame la altura del triangulo: ")
    (setq alturabase (read))
    (setq areabase (/ (* base alturabase) 2))
    (print "Dame la altura del prisma: ")
    (setq altura (read))
    (setq resultado (* areabase altura))
    (write resultado)
)
```
Saca el volumen de un prisma pentagonal a partir de el lado del pentagono, su apotema y su altura.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenPrismaPentagonal.png)

## Volumen de un octaedro regular

```
(defun volumenOctaedroRegular()
    (print "Dame el lado del octaedro: ")
    (setq lado (read))
    (setq constante (/ (sqrt 2) 3))
    (setq ladoalcubo (* lado (* lado lado)))
    (setq resultado (* constante ladoalcubo))
    (write resultado)
)
```
Saca el volumen de un octaedro regular a partir de su lado.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenOctaedro.png)

## Volumen de un icosaedro

```
(defun volumenIcosaedro()
    (print "Dame el lado del icosaedro: ")
    (setq lado (read))
    (setq constante (* (/ 5 12) (+ 3 (sqrt 5))))
    (setq ladoalcubo (* lado (* lado lado)))
    (setq resultado (* constante ladoalcubo))
    (write resultado)
)
```
Saca el volumen de un icosaedro a partir de su lado.

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/volumenIcosaedro.png)

## Operaciones con listas 

### Sacar los elementos de las siguientes listas empleando las funciones car y cdr

#### 1.-(a b c d f g h)

**1a.-h**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20la%20H.png)

**1b.-g**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20la%20G.png)

**1c.-f**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20la%20F.png)

**1d.-c**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20la%20F.png)

#### 2.-((a) (b d) ((1 2) 3))

**2a.-d**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20la%20D.png)


**2b.-2**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%202.png)


**2c.-(1 2)**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%20(1 2).png)


**2d.-(3)**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%20(3).png)

#### 3.-((1 2 3) (4 5 6) ((((7 8 9 10)))))

**3a.-4**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%204.png)


**3b.-7**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%207.png)


**3c.-3**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%203.png)


**2d.-10**  

![] (https://github.com/diego-garcia02/Prolog/blob/main/07_Operaciones%20con%20listas/Solo%20el%2010.png)

## Funciones Cond y Case

Se utilizaran las funciones cond y case para elegir las areas y volumenes del ejercicio pasado

### Función Case para elegir areas 
```
(defun eligeArea()
    (princ "Ingresa el numero del area que quieres calcular")(terpri)
    (princ "1.Cuadrado") (terpri)
    (princ "2.Triangulo") (terpri)
    (princ "3.Rectangulo") (terpri)
    (princ "4.Pentagono") (terpri)
    (princ "5.Hexagono") (terpri)
    (princ "6.Heptagono") (terpri)
    (princ "7.Octagono") (terpri)
    (princ "8.Circulo") (terpri)
    (princ "9.Trapecio") (terpri)
    (princ "10.Rombo") (terpri)
    (setq num (read))
    (case num 
        ((1) (areaCuadrado))
        ((2) (areaTriangulo))
        ((3) (areaRectangulo))
        ((4) (areaPentagono))
        ((5) (areaHexagono))
        ((6) (areaHeptagono))
        ((7) (areaOctagono))
        ((8) (areaCirculo))
        ((9) (areaTrapecio))
        ((10) (areaRombo))
    )
)
```
![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/Funcion%20Case%20para%20areas)

Se observa que la función se ejecuta correctamente.

### Función Cond para elegir volumenes 

```
(defun eligeVolumen()
    (princ "Ingresa el numero del volumen que quieres calcular")(terpri)
    (princ "1.Esfera") (terpri)
    (princ "2.Cubo") (terpri)
    (princ "3.Cono") (terpri)
    (princ "4.Piramide Cuadrangular") (terpri)
    (princ "5.Cilindro") (terpri)
    (princ "6.Prisma Rectangular") (terpri)
    (princ "7.Prisma Triangular") (terpri)
    (princ "8.Prisma Pentagonal") (terpri)
    (princ "9.Octaedro Regular") (terpri)
    (princ "10.Icosaedro") (terpri)
    (setq num (read))
    (cond ((= num 1) (volumenEsfera))) 
    (cond ((= num 2) (volumenCubo))) 
    (cond ((= num 3) (volumenCono))) 
    (cond ((= num 4) (volumenPiramideCuadrangular))) 
    (cond ((= num 5) (volumenCilindro))) 
    (cond ((= num 6) (volumenPrismaRectangular)))
    (cond ((= num 7) (volumenPrismaTriangular)))  
    (cond ((= num 8) (volumenPrismaPentagonal))) 
    (cond ((= num 9) (volumenOctaedroRegular)))
    (cond ((= num 10) (volumenIcosaedro)))  
)
```

![] (https://github.com/diego-garcia02/Prolog/blob/main/06_Areas%20y%20volumenes/Funcion%20Cond%20para%20volumenes)

Se observa que la función se ejecuta correctamente.































































