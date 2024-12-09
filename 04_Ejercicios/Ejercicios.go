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

<<<<<<< HEAD
	return cadena == cadena2;
=======
	if(cadena2 == cadena){
		return true;
	}else{
		return false;
	}
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
    
	
	

}

