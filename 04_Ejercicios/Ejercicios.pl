sub fibonacci{
    my @a = 1;
    my @b = 0;

    my @i = (0 .. $_[0]);

    for(@i){
        printf(@a);
        @a = @a + @b;
        @b = @a - @b;
    }
}


fibonacci(5);