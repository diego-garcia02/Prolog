(defun sumaEnteros(numero suma)
	(setq suma (+ suma numero))
	(if (= numero 1)
		(print suma)
		(sumaEnteros (- numero 1) suma)
	)
)

(defun sumaPares(numero suma)
	(if (= (rem numero 2) 0)
		(setq suma (+ suma numero))
		(print suma)
	)
	(if (> numero 2)
	  (sumaPares (- numero 1) suma)
	)	
)

(defun tercerElementoLista(lista)
	(print (caddr lista))
)

(defun primerYUltimo(lista)
	(setq cabeza (car lista))
	(setq cola (car (reverse lista)))
	(print (list cabeza cola))
	
)





