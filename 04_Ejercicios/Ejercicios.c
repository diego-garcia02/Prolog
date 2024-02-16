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

