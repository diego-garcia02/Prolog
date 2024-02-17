fn main(){
    fibonacci(8);
}

fn fibonacci(num:i32){
    let mut a = 1;
    let mut b = 0;
    for _n in 0..num{
        print!("{}",a);
        a = a + b;
        b = a - b;
    }
}