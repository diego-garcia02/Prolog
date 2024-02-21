(defun recorre(list)
 (if list 
    (progn 
    (print (car list))
    (recorre (cdr list))
    )
 )
)

(recorre '(1 2 3 4))