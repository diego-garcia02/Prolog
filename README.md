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

## Ejercicios usando condicionales (if cond when unless y case)

### Ejercicio uno usando if 

```
(defun compraPantalones()
(print "Precio de cada pantalon: $300")
(print "Ingrese la cantidad de pantalones a comprar: ")
(setq c_pantalones (read))
(if (>= c_pantalones 5) (setq precio_total (* 300 0.85 c_pantalones)) (setq precio_total (* 300 c_pantalones)))
(if (>= c_pantalones 12) (setq precio_total (* 300 0.70 c_pantalones)))
(write precio_total))

```

![] (https://github.com/diego-garcia02/Prolog/blob/main/09_Ejercicios%20condicionales/compraPantalones.png)

Se observa que la función se ejecuta correctamente aplicando el descuento indicado dependiendo de la cantidad de pantalones ingresados.

### Ejercicio dos usando if 

```
(defun solicitarPrestamo()
(setq puntos 0)
(print "Ingresa tu nombre: ")
(setq nombre (read))
(print "Ingresa tu historial crediticio: ")
(setq hist_crediticio (read))
(print "Ingresa la cantidad que quieres pedir: ")
(setq prestamo (read))
(print "Ingresa tu salario anual: ")
(setq salario (read)) 
(print "Ingresa e valor de otras propiedades que tengas: ")
(setq v_propiedades (read))
 (if (string-equal hist_crediticio "b")
    (if (>= salario (* 0.5 prestamo))
        (setq puntos (+ puntos 5))
        (if (and (>= salario (* 0.25 prestamo)) (< salario (* 0.5 prestamo)))
           (setq puntos (+ puntos 3))
            (if (and (>= salario (* 0.1)) (< salario (* 0.25 prestamo)))
                (setq puntos (+ puntos 1))
            )
        )      
    )
    (print "Lo siento! Tu historial crediticio no es bueno"))

    (if (string-equal hist_crediticio "b")
    (if (>= v_propiedades (* 2 prestamo))
      (setq puntos (+ puntos 5))
      (if (>= v_propiedades prestamo)
        (setq puntos (+ puntos 3))
    ))
    (print "Lo siento! Tu historial crediticio no es bueno"))
       

        
    (if (> puntos 6)
        (print "Felicidades! El prestamo se te ha concedido")
        (print "Lo siento! No tienes suficientes puntos para solicitar un prestamo"))
    
)

```
![] (https://github.com/diego-garcia02/Prolog/blob/main/09_Ejercicios%20condicionales/solicitarPrestamo.png)

Se observa que la función se ejecuta correctamente otorgando el prestamo dependiendo de los puntos acumulados.
### Ejercicio tres usando case

```
(defun letraMinuscula()
    (print "Ingrese una letra minuscula: ")
    (setq letra (read))
    (case (intern(string-upcase letra))
        (a (print "Es una vocal"))
        (e (print "Es una vocal"))
        (i (print "Es una vocal"))
        (o (print "Es una vocal"))
        (u (print "Es una vocal"))
        (y (print "Es una semivocal"))
        (otherwise (print "Es una consonante"))
    )    
)
```
![] (https://github.com/diego-garcia02/Prolog/blob/main/09_Ejercicios%20condicionales/letraMinuscula.png)

Se observa que la función se ejecuta correctamente imprimiendo la denominación adecuada dependiendo de la letra ingresada.

### Ejercicio cuatro usando cond 

```
(defun añoBisiesto()
    (setq nobisiesto "No es año bisiesto")
    (print "Ingrese un año: ")
    (setq año (read))
    (cond ((and (= (mod año 4) 0) (/= (mod año 100) 0)) (print "Es un año bisiesto")) (nobisiesto))
)
```
![] (https://github.com/diego-garcia02/Prolog/blob/main/09_Ejercicios%20condicionales/añoBisiesto.png)

Se observa que la función se ejecuta correctamente aplicando la condicional correctamente.

### Ejercicio cinco usando when y unless

```
(defun mesesDelAño()
    (print "Ingresa un numero de un mes del año: ")
    (setq mes (read))
    (when (= 2 mes) (print "El mes tiene 28 dias"))
    (when (or (= 4 mes)(= 6 mes)(= 9 mes)(= 11 mes)) (print "El mes tiene 30 dias"))
    (when (or (= 1 mes)(= 3 mes)(= 5 mes)(= 7 mes)(= 8 mes)(= 10 mes)(= 12 mes)) (print "El mes tiene 31 dias"))
    (unless (and (<= mes 12)(>= mes 0)) (print "MES ERRONEO"))
)

```
![] (https://github.com/diego-garcia02/Prolog/blob/main/09_Ejercicios%20condicionales/mesesDelAño.png)

Se observa que la función se ejecuta correctamente imprimiendo la cantidad de dias que tiene cada mes.

## Akinator

Se trata de un programa basado en el mundialmente famoso juego en el que un genio le hara preguntas al jugador para averiguar en cual personaje esta pensando.

![] (https://github.com/diego-garcia02/Prolog/blob/main/10_Akinator/Nodos.png)

De momento, estos son los nodos con los que cuenta nuestro programa.

```
(defun recorre(lista)
    (setq rama (mapcar #'car lista))
    (setq hojas (mapcar #'cdr lista))
    (format t "¿Tu personaje es ~a"(car rama))
    (setq respuesta (read))
    (if (string-equal respuesta "S")
        (recorre (car hojas))
        (recorre (cadr hojas))
    ) 
)
```
Este es el codigo que se encarga de recorrer nuestro arbol las ramas contienen lo que se encuentra en el primer nivel de este y las hojas contienen los otros niveles que hay en ese arbol.

El programa pregunta si el personaje pertenece al primer elemento del primer nivel del arbol (en este caso REAL) y en caso de ser asi recorrera todo lo que este contenido en REAL dentro del arbol, en caso de no ser asi se ira a la otra rama (la rama FICTICIO) y de ahi recorrera todo lo que se encuentre dentro de ese nivel

![] (https://github.com/diego-garcia02/Prolog/blob/main/10_Akinator/recorreNodos1.png)

![] (https://github.com/diego-garcia02/Prolog/blob/main/10_Akinator/recorreNodos2.png)

Se observa que nuestro programa funciona bien a primera vista, pero dado a que solo tenemos dos niveles en nuestro arbol, no podemos afirmar a ciencia cierta si nuestro programa ya esta terminado o si sufrira algunas modificaciones.

## Akinator mejorado

El codigo anterior del akinator no podia recorrer a partir del segundo nivel del arbol, al menos no como se tenia pensado. Sin embargo este actual codigo ya es capaz de recorrer todo los nodos que conforma nuestro arbol.

```
(defun recorre(lista)
    (if (listp(car lista))
     (setq rama (caar lista)) 
     (setq rama (car lista))
    ) 
    
    
    (format t "¿Tu personaje ~a ?" rama)
    (setq respuesta (read))    
    (if (string-equal respuesta "S")
        (recorre (cdar lista))
        (recorre (cdr lista))
    )       
)
```
Primero verifica si la cabeza de la lista es en si misma una lista y en caso de que lo sea sacara la cabeza de la cabeza de la lista.

Preguntamos si el personaje corresponde a lo que este en la cabeza de la lista, y en caso de que lo sea sacamos la cabeza de la lista, es decir, la rama que contiene a los personajes pertenecientes a lo que habia en la cabeza de la lista, luego hacemos un cdr para que no vuelva a incluir otra vez a la cabeza de la lista. 

En caso de que el personaje, no pertenezca a determinada categoria, lo que la función hara sera un cdr que retornara todas las ramas a excepcion de la primera para poder preguntar acerca de las otras categorias y este proceso se repite recursivamente hasta que ya no queden elementos en la rama elegida.

![] (https://github.com/diego-garcia02/Prolog/blob/main/10_Akinator/arbolFuncionando.png)

Se observa que nuestro codigo funciona correctamente al ser capaz de recorrer el arbol de acuerdo a lo que nosotros hayamos contestado.

## Arbol avatar

El siguiente codigo se encarga de recorrer un arbol acerca del mundo de avatar

```
(defun recorre(lista)
     (if (listp(car lista))
     (setq rama (caar lista)) 
     (setq rama (car lista))
    ) 
    
    
    (format t "¿Tu personaje es ~a ?" rama)
    (setq respuesta (read))    
    (if (string-equal respuesta "S")
        (recorre (cadar lista))
        (recorre (cdr lista))
    )     
)
```
El codigo es en esencia el mismo que usamos para construir nuestro Akinator solo que ahora cuando el usuario teclee "S", el arbol tomara la cabeza de la cola de la cabeza del arbol, a diferencia del anterior donde solo tomaba la cola de la cabeza

![] (https://github.com/diego-garcia02/Prolog/blob/main/10_Akinator/arbolAvatar.png)

Se observa que nuestro arbol funciona como se espera 

## Arbol genealogico usando Prolog

Consiste en crear un arbol genealogico con los miembros de nuestra familia asignandoles a cada uno las propiedades que le corresponden.

El arbol completo se encuentra en el siguiente link

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/familia.pl)

## Creación de reglas logicas para nuestro arbol genealogico

Usando prolog podemos crear reglas logicas que nos permiten generar la definición de nuevas propiedades a partir de propiedades ya existentes.

Crearemos reglas para definir a los tios, hermanos, abuelos, nietos e hijos, las cuales quedan de la siguiente manera:

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/Reglas_logicas.png).

Se observa que la regla del abuelo funciona correctamente al pasarle como primer propiedad a josecarmen.

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/Regla_abuelo.png).

Se observa que la regla del hermano funciona correctamente al pasarle como primer propiedad a karen.

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/Regla_hermano.png).

Se observa que la regla del hijo funciona correctamente al pasarle como primer propiedad a miguel.

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/Regla_hijo.png).

Se observa que la regla del nieto funciona correctamente al pasarle como primer propiedad a diego.

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/Regla_nieto.png).

Se observa que la regla del tio funciona correctamente al pasarle como primer propiedad a marbella.

![] (https://github.com/diego-garcia02/Prolog/blob/main/12_Arbol_genealogico/Regla_tio.png).


## Evaluación de sentencias logicas

-La Tierra es un planeta # Constante de individuo Tierra en predicado monario.
-La Luna no es un planeta # Constante de individuo Luna en predicado monario.
-La Luna es un satelite  # Constante de individuo en predicado binario.
-La Tierra gira alrededor del Sol # Constantes de individuo Tierra y Sol en predicado binario.
-Todo planeta es un satelite # Cuantificador universal con variable de individuo planeta en predicado monario.
-Todo planeta gira alrededor del Sol # Cuantificador universal con variable de individuo planeta y constante de individuo Sol en predicado binario.
-Algún planeta gira alrededor de la Luna. # Cuantificador existencial con variable de individuo planeta y constante de individuo Luna en predicado binario.
-Hay por lo menos un satelite. # Cuantificador existencial con variable de individuo satelite en predicado monario.
-Todos los perros del vecino muerden a algún cartero # Cuantificador universal con variable de individuo perros y variable de individuo cartero en predicado binario.
-Hay un cartero al que lo muerden todos los perros # Cuantificador existencial con variables de individuos cartero y perros en predicado binario.
-Todos los carteros son mordidos por algún perro # Cuantificador universal con variables de individuos carteros y perros en predicado binario.
-Hay un perro que muerde a todos los carteros # Cuantificador existencial con variables de individuos perro y carteros en predicado binario.
-Todos los perros que asusten a algún cartero, lo muerden # Cuantificador universal con variables de individuos perros y cartero en predicado binario.
-Hay un perro que muerde a todos los perros que muerden a algún cartero # Cuantificador existencial con variables de individuo perro, perros y cartero en predicado ternario.
-Hay un solo perro que se muerde a si mismo # Cuantificador existencial con variables de individuo perro y si mismo en predicado binario.

## Sistema experto de evaluación medica usando Prolog

Se trata de un sistema que es capaz de buscar enfermedades a partir de sus sintomas.

El codigo esta en el siguiente link:

![] (https://github.com/diego-garcia02/Prolog/blob/main/13_Sistema_experto_medico/Sistema_medico.pl).

La primera regla busca una enfermedad a partir de el sintoma proporcionado o viceversa, siempre y cuando el valor de P este colocado en 1.

```
buscar(X , E , 1) :- sintomade(X, E).
```
La segunda regla puede buscar las enfermedades a partir de una lista de sintomas, solo tenemos que colocar en donde va P la cantidad de sintomas dentro de la lista.

Se observa que ambas reglas funcionan correctamente.

![] (https://github.com/diego-garcia02/Prolog/blob/main/13_Sistema_experto_medico/Primeraregla.png).

![] (https://github.com/diego-garcia02/Prolog/blob/main/13_Sistema_experto_medico/Segundaregla.png).

## Sistema experto del sistema solar

Consiste en un sistema que tiene conocimiento del sistema solar.

Para ver el codigo dar clic en el siguiente enlace:

![] (https://github.com/diego-garcia02/Prolog/blob/main/14_Sistema_solar/Sistema_solar.pl).

Se observa que si le damos una luna, nos da su respectivo planeta.

![] (https://github.com/diego-garcia02/Prolog/blob/main/14_Sistema_solar/Luna_con_planeta.png).

También se observa que al proporcionar un planeta, nos dara sus respectivas lunas.

![] (https://github.com/diego-garcia02/Prolog/blob/main/14_Sistema_solar/Planeta_con_lunas.png).

## Arbol de seguimiento primer enfoque

Se requiere realizar el arbol de seguimiento de la siguiente función:

```
rotar(X,X,0).
rotar([X|Y],L,N):-N1 is N-1, append(Y,[X],Y1),rotar(Y1,L,N1).
```
Con el fin de saber en que momento N es igual a cero.

El arbol se encuentra en el link de abajo:

![] (https://github.com/diego-garcia02/Prolog/blob/main/14_Sistema_solar/Arbol_de_seguimiento_primer_enfoque.png).

## Arbol de seguimiento segundo enfoque

Se requiere realizar el arbol de seguimiento de la siguiente función:

```
rotar(L,R,N):-append(X,Y,L),size(X,N),append(Y,X,R).
```
Debido a que la función no es de caracter recursivo, no es necesario realizar el arbol de seguimiento sin embargo si podemos darnos una idea de como es su funcionamiento, pues como append nos regresa todas las particiones de una lista, usando size podemos determinar la partición que valga la cantidad de veces que querramos rotar la lista, finalmente solo le pasamos ese Y y X a la función append que nos retornara en R la lista rotada.

## Evaluación

### Existe una persona en la Feria tal que si dicha persona paga, entonces todas las personas pagan.

Cuantificador existencial: Existe una 
Variable de individuo: Persona, personas
Predicado binario: Existe una persona en la Feria 
Condicional: entonces
Cuantificador universal: todas

## Socrates es un hombre. Los hombres son mortales. Luego, Socrates es mortal.

Constante de individuo: Socrates
Predicado monario: Socrates es un hombre.
Variable de individuo: hombres
Predicado monario: Los hombres son mortales.
Predicado monario: Socrates es mortal.

## Hay estudiantes inteligentes y hay estudiantes trabajadores. Por lo tanto hay estudiantes inteligentes y trabajadores.

Variables de individuo: estudiantes intligentes, estudiantes trabajadores, estudiantes
Conjuntor: y


## En cierto pais oriental se ha celebrado la fase del campeonato mundial de futbol. Cierto diario deportivo ha publicado las estadisticas de tan magno acontacimiento:

## A todos los porteros que no vistieron camiseta negra les marco gol algún delantero europeo.

Cuantificador universal: Todos
Variables de individuo: porteros, camiseta negra, delantero europeo
Negador: no
Cuantificador existencial: algún
Predicado binario: A todos los porteros que no vistieron camiseta negra
Predicado ternario: A todos los porteros que no vistieron camiseta negra les marco gol algún delantero europeo.

## Algún portero jugo con botas blancas y solo le marcaron goles jugadores con botas blancas

Cuantificador existencial: Algún
Predicado binario: portero jugo con botas blancas
Variables de individuo: portero, botas blancas,jugadores
Conjuntor: y
Predicado cuaternario: portero jugo con botas blancas y solo le marcaron goles jugadores con botas blancas

## Ningún portero se marco un gol a si mismo

Negador del cuantificador existencial: Ningún
Variables de individuo: portero, a si mismo
Predicado binario: Ningún portero se marco gol a si mismo.

## Ningún jugador con botas blancas vistio camiseta negra

Negador del cuantificador existencial: Ningún
Variables de individuo: jugador, botas blancas, camiseta negra
Predicado ternario: Ningún jugador con botas blancas vistio camiseta negra

## Por tanto, algún delantero europeo jugo con botas blancas.

Cuantificador existencial: algún
Variables de individuo: delantero europeo, botas blancas
Predicado binario: algún delantero europeo jugo con botas blancas.

## Socrates era el maestro de Platón. Socrates tuvo, a lo sumo, un maestro. Aristoteles fue discipulo de alguien cuyo maestro fue Socrates. Por consiguiente, Platon fue el maestro de Arsitoteles.

Constantes de indiciduo: Socrates, Platón, Aristoteles
Predicado binario: Socrates era el maestro de Platón
Predicado binario: Aristoteles fue discipulo de alguien cuyo maestro fue Socrates
Predicado binario: Socrates tuvo, a lo sumo, un maestro
Predicado binario: Platon fue el maestro de Aristoteles


## Acertijo

En una calle hay cinco casas, cada una de un color distinto. 
En cada casa vive una persona de distinta nacionalidad.
Cada dueño bebe un único tipo de bebida, fuma una sola marca de cigarrillos 
y tiene una mascota diferente a sus vecinos. 
A partir de las 15 pistas presentadas a continuación, 
la consigna que hay que responder es: "¿Quién es el dueño del pez?".

El británico vive en la casa roja.
El sueco tiene un perro como mascota.
El danés toma té.
El noruego vive en la primera casa.
El alemán fuma Prince.
La casa verde está inmediatamente a la izquierda de la blanca.
El dueño de la casa verde bebe café.
El propietario que fuma Pall Mall cría pájaros.
El dueño de la casa amarilla fuma Dunhill.
El hombre que vive en la casa del centro bebe leche.
El vecino que fuma Blends vive al lado del que tiene un gato.
El hombre que tiene un caballo vive al lado del que fuma Dunhill.
El propietario que fuma Bluemaster toma cerveza.
El vecino que fuma Blends vive al lado del que toma agua.
El noruego vive al lado de la casa azul.

Cuantificador existencial: Hay al menos cinco casas en una calle.
Cuantificador existencial: Hay al menos una persona viviendo en cada casa.
Predicado monario: persona vive en una casa

Predicado monario: Los dueños de la casa beben un tipo de bebida.
Variables de individuo: dueños de la casa
Propiedad: Beber un tipo de bebida.

Predicado monario: Cada dueño fuma una marca de cigarrillos.
Variable de individuo: dueño.
Propiedad: Fumar una marca de cigarrillos.

Predicado binario: Cada dueño tiene una mascota diferente a sus vecinos.
Variable de individuo: dueño.
Propiedad: Tener una mascota.

Predicado binario: El britanico vive en la casa roja.
Constantes de individuo: britanico, casa roja.

Predicado binario: El sueco tiene un perro de mascota.
Constantes de individuo: sueco, perro.

Predicado binario: El danes toma te.
Constantes de individuo: danes,te.

Predicado monario: El noruego vive en la primera casa.
Constante de individuo: noruego.
Propiedad: vivir en la primera casa

Predicado binario: El alemán fuma Prince.
Constantes de individuo: aleman, Prince.

Predicado binario: La casa verde está inmediatamente a la izquierda de la blanca.
Constantes de individuo: casa verde, casa blanca.

Predicado binario: El dueño de la casa verde bebe café.
Variables de individuo: dueño de la casa verde, cafe.

Predicado ternario: El propietario que fuma Pall Mall cría pájaros.
Variable de individuo: propietario, pajaros.
Constantes de individuo: Pall Mall.

Predicado binario: El dueño de la casa amarilla fuma Dunhill.
Variable de individuo: dueño de la casa amarilla.
Constante de individuo: Dunhill.

Predicado binario: El hombre que vive en la casa del centro bebe leche.
Variable de individuo: hombre que vive en la casa del centro
Constante de individuo: leche.

Predicado binario: El vecino que fuma Blends vive al lado del que tiene un gato.
Variable de individuo: vecino que fuma Blends.
Constante de individuo: gato.

Predicado binario: El hombre que tiene un caballo vive al lado del que fuma Dunhill.
Variables de individuo: hombre que tiene un caballo .
Constante de individuo: Dunhill.

Predicado binario: El propietario que fuma Bluemaster toma cerveza.
Variables de individuo: propietario que fuma Bluemaster.
Constante de individuo: cerveza.

Predicado ternario: El vecino que fuma Blends vive al lado del que toma agua.
Variables de individuo: vecino que fuma Blend
Constante de individuo: agua

Predicado binario: El noruego vive al lado de la casa azul.
Constantes de individuo: noruego, casa azul

## Inferencias

Dado que el britanico vive en la casa roja no puede vivir en una casa de diferente color.
Como el noruego vive en la primera casa, esta no puede ser roja dado que ahi vive el britanico.
El sueco tiene un perro como mascota y dado que cada dueño tiene solo una mascota diferente, el no puede ser el dueño del pez.
El dueño de la casa verde bebe cafe y la casa verde se encuentra inmediatamente a la izquierda de la blanca, lo que significa que quien bebe cafe vive a la izquierda de quien vive en la casa blanca.
Como una casa se encuentra a la izquierda de la blanca, la casa blanca no puede ser la ultima casa.
El propietario que fuma Pall Mall cria pajaros, por lo tanto el tampoco es dueño del pez.
El hombre que vive en la casa del centro bebe leche, por lo tanto la casa del centro no puede ser verde pues ahi vive quien bebe cafe.
El propietario dueño del caballo vive al lado del que fuma Dunhill, y este a su vez vive a dentro de la casa amarilla, lo que significa que quien es dueño del caballo vive ya sea a la izquierda o a la derecha de la casa amarilla.
Como el noruego vive al lado de la casa azul y la casa del noruego es la primera casa, la casa del noruego no puede ser blanca pues la casa verde se encuentra a la izquierda de ella,la casa del noruego tampoco puede ser la azul pues cada casa debe ser de diferente color y tampoco puede ser la verde pues se encuentra a la izquierda de la casa blanca, y la casa del noruego no tiene casas a su derecha al ser la primera casa. Por lo que la casa del noruego es la amarilla.

El orden de las casas podria ser de las siguientes dos formas:

1.Amarilla
2.Azul
3.Roja
4.Blanca
5.Verde

1.Amarilla
2.Azul
3.Blanca
4.Verde
5.Roja

Sabemos que el dueño de la casa amarilla es el noruego, por lo tanto es el noruego quien fuma Dunhill
El dueño del caballo vive al lado del que fuma Dunhill, por lo tanto es el quien vive en la casa azul.
Sabemos que el noruego no puede criar a los pajaros ya que el fuma Dunhill.
Similarmente el noruego tampoco puede tener perros de mascota, dado que los tiene el sueco.
El noruego no puede tomar leche ya que esa bebida la toma el propietario de la casa del centro, no puede tomar té tampoco, no puede tomar cerveza porque el fuma Dunhill y no puede tomar cafe porque lo bebe el propietario de la casa verde, por lo tanto el noruego bebe agua.
Quien fuma Blends vive al lado de quien toma agua por lo tanto, quien fuma Blends vive en la casa azul.
Quien vive en la casa azul no puede ser aleman porque fuma Blends, no puede ser noruego porque vive en la casa azul, no puede ser sueco porque tiene caballos y no puede ser britanico porque vive en la casa azul, por lo tanto quien vive en la casa azul es el danes.
Quien cria pajaros no puede ser el noruego porque fuma Dunhill, no puede ser el aleman porque fuma Prince, no puede ser el sueco porque tiene perros y no puede ser el danes porque tiene caballo, por lo tanto quien cria pajaros es el britanico.
El noruego fuma Dunhill, el aleman Prince, el danes Blends y el britanico Pall Mall, asi que quien fuma Bluemaster y bebe cerveza es el sueco.
El britanico fuma Pall Mall, asi que el no toma cerveza y no vive en la casa verde por lo que no toma cafe, el noruego toma agua y el danes té asi que el britanico toma leche.
Quien toma leche esta en el centro asi que la casa roja esta en el centro, por lo que el orden de las casas es como sigue:

1.-Amarilla
2.-Azul
3.-Roja
4.-Blanca
5.-Verde

El vecino que fuma Blends vive al lado del que tiene un gato, como el que vive en la casa azul fuma Blends y tiene de vecinos al de la casa roja y amarilla y el britanico que vive dentro de la casa roja cria pajaros entonces el noruego tiene un gato.
El noruego tiene un gato, el danes un caballo, el britanico pajaros y el sueco un perro por lo que quien tiene al pez es el aleman.

En resumen los datos quedarian de la siguiente manera.

Primera casa: amarilla
Habitada por: noruego
Bebe: agua
Fuma: Dunhill
Mascota: gato

Segunda casa: azul
Habitada por: danes
Bebe: té
Fuma: Blends
Mascota: caballo

Tercera casa: roja
Habitada por: britanico
Bebe: leche
Fuma: Pall Mall
Mascota: pajaros

Cuarta casa: blanca
Habitada por: sueco
Bebe: cerveza
Fuma: Bluemaster
Mascota: perro

Quinta casa: verde
Habitada por: aleman
Bebe: cafe
Fuma: Prince
Mascota: pez
























































































