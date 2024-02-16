#1,1,2,3,5,8,13
def fibonacci(n): 
    a = 1
    b = 0
    for i in range(n):
        print(str(a)+",",end="")
        a = a + b 
        b = a - b

def factorial(num):
    if num == 0 or num == 1:
        return 1
    else:
        return num*factorial(num-1)

def palindroma(cadena):
    return cadena == cadena[::-1]

    
print(factorial(8),'\n')

print(fibonacci(5), '\n')

print(palindroma("otto"), '\n')








