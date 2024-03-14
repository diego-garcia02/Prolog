(defun recorre(lista)
     (if (listp(car lista))
     (setq rama (caar lista)) 
     (setq rama (car lista))
    ) 
    
    
    (format t "¿Tu personaje es ~a ?" rama)
    (setq respuesta (read))    
    (if (string-equal respuesta "S")
        (recorre (cadar lista))
        (recorre (cdr lista))
    )     
)


(defparameter *nodes*  '((femenino (
                                    (aire (ana))       
                                    (fuego(azula))       
                                    (tierra(top))       
                                    (agua (katara))))
                         (masculino(
                                    (aire (Hola rayo))       
                                    (fuego(Hola fuego))       
                                    (tierra(Hola Tierra))       
                                    (agua (poder de agua))))
                         (ovni(
                               (aire (Hola rayo))       
                               (fuego(Hola fuego))       
                               (tierra(Hola Tierra))       
                               (agua (poder de agua)))
                          )
                         (aleatorio(
                                    (aire (Hola rayo))       
                                    (fuego(Hola fuego))       
                                    (tierra(Hola Tierra))       
                                    (agua (poder de agua)))
                          )
                         ))
(recorre *nodes*)