(defun sumaEnteros(numero suma)
	(setq suma (+ suma numero))
	(sumaEnteros (- numero 1) suma)
	(print suma)
)



(defun sumaPares(numero suma)
	(if (=(/ numero 2) 0)
		(setq suma (+ suma numero))
		 
	)
	(print suma)
 	(sumaPares(numero suma))

)


(defun tercerElementoLista (lista)
	(print (cdr (lista)))
)


(tercerElementoLista '(1 2 3 4 5))

