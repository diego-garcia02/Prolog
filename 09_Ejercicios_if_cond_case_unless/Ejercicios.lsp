(defun compraPantalones()
(print "Precio de cada pantalon: $300")
(print "Ingrese la cantidad de pantalones a comprar: ")
(setq c_pantalones (read))
(if (>= c_pantalones 5) (setq precio_total (* 300 0.85 c_pantalones)) (setq precio_total (* 300 c_pantalones)))
(if (>= c_pantalones 12) (setq precio_total (* 300 0.70 c_pantalones)))
(write precio_total)
)

(defun prestamo()
(setq puntos 0)
(print "Ingresa tu nombre: ")
(setq nombre (read))
(print "Ingresa tu historial crediticio: ")
(setq hist_crediticio (read))
(print "Ingresa la cantidad que quieres pedir: ")
(setq cantidad (read))
(print "Ingresa tu salario anual: ")
(setq salario (read)) 
(print "Ingresa e valor de otras propiedades que tengas:")
(setq v_propiedades (read))
(cond ((/= hist_crediticio "b")
      (cond (<= salario ))
      (print "Tu historial crediticio es malo")))

)