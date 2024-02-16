(defun sumaNumero()
    (print "Dame un numero:")
    (setq num1 (read))
    (print "Dame un segundo numero: ")
    (setq num2 (read))
    (setq resultado (+ num1 num2))
    (write resultado)
)

(sumaNumero)



