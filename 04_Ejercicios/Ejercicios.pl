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