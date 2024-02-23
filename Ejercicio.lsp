(defun sumaNumero()
    (print "Dame un numero:")
    (setq num1 (read))
    (print "Dame un segundo numero: ")
    (setq num2 (read))
    (setq resultado (+ num1 num2))
    (write resultado)
)

(defun condTest(a b)
(cond ((< a b) (print "a es menor que b")) (print "b es menor que a"))
)

(defun caseTest(a)
    (case a 
        ((1) (print "Suma")
         (princ "Dame un numero: ")
         (setq a (read))
         (princ "Dame otro numero: ")
         (setq b (read))
         (suma a b)
         )
        ((2) (print "Es el numero 2"))
    )
)

(defun suma(a b)
    (+ a b)
)




