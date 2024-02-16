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



