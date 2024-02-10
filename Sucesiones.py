
def sucesion1(n):
    if n != 0:
        return 1/n
    else: 
        return "Cannot divide by zero"
 
def sucesion2(n):
   return n/n+1

def sucesion3(n): #Para 1 = -3 Para 2 = 
    return (n-4)/n

def sucesion4(n):
   return n*(-1)**n

def sucesion5(n):
   return (n+2)*((-1)**(n+1))/n


print(sucesion5(5))