(defun compraPantalones()
(print "Precio de cada pantalon: $300")
(print "Ingrese la cantidad de pantalones a comprar: ")
(setq c_pantalones (read))
(if (>= c_pantalones 5) (setq precio_total (* 300 0.85 c_pantalones)) (setq precio_total (* 300 c_pantalones)))
(if (>= c_pantalones 12) (setq precio_total (* 300 0.70 c_pantalones)))
(write precio_total))

(defun solicitarPrestamo()
(setq puntos 0)
(print "Ingresa tu nombre: ")
(setq nombre (read))
(print "Ingresa tu historial crediticio: ")
(setq hist_crediticio (read))
(print "Ingresa la cantidad que quieres pedir: ")
(setq prestamo (read))
(print "Ingresa tu salario anual: ")
(setq salario (read)) 
(print "Ingresa e valor de otras propiedades que tengas: ")
(setq v_propiedades (read))
 (if (string-equal hist_crediticio "b")
    (if (>= salario (* 0.5 prestamo))
        (setq puntos (+ puntos 5))
        (if (and (>= salario (* 0.25 prestamo)) (< salario (* 0.5 prestamo)))
           (setq puntos (+ puntos 3))
            (if (and (>= salario (* 0.1)) (< salario (* 0.25 prestamo)))
                (setq puntos (+ puntos 1))
            )
        )      
    )
    (print "Lo siento! Tu historial crediticio no es bueno"))

    (if (string-equal hist_crediticio "b")
    (if (>= v_propiedades (* 2 prestamo))
      (setq puntos (+ puntos 5))
      (if (>= v_propiedades prestamo)
        (setq puntos (+ puntos 3))
    ))
    (print "Lo siento! Tu historial crediticio no es bueno"))
       

        
    (if (> puntos 6)
        (print "Felicidades! El prestamo se te ha concedido")
        (print "Lo siento! No tienes suficientes puntos para solicitar un prestamo"))
    
)

(defun letraMinuscula()
    (print "Ingrese una letra minuscula: ")
    (setq letra (read))
    (case (intern(string-upcase letra))
        (a (print "Es una vocal"))
        (e (print "Es una vocal"))
        (i (print "Es una vocal"))
        (o (print "Es una vocal"))
        (u (print "Es una vocal"))
        (y (print "Es una semivocal"))
        (otherwise (print "Es una consonante"))
    )    
)

(defun añoBisiesto()
    (setq nobisiesto "No es año bisiesto")
    (print "Ingrese un año: ")
    (setq año (read))
    (cond ((and (= (mod año 4) 0) (/= (mod año 100) 0)) (print "Es un año bisiesto")) (nobisiesto))
)

(defun mesesDelAño()
    (print "Ingresa un numero de un mes del año: ")
    (setq mes (read))
    (when (= 2 mes) (print "El mes tiene 28 dias"))
    (when (or (= 4 mes)(= 6 mes)(= 9 mes)(= 11 mes)) (print "El mes tiene 30 dias"))
    (when (or (= 1 mes)(= 3 mes)(= 5 mes)(= 7 mes)(= 8 mes)(= 10 mes)(= 12 mes)) (print "El mes tiene 31 dias"))
    (unless (and (<= mes 12)(>= mes 0)) (print "MES ERRONEO"))
)
