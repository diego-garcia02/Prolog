(defun volumenEsfera()
    (print "Dame el radio de la esfera")
    (setq radio (read))
    (setq resultado (* (/ 4 3) (* 3.1416 (* radio (* radio radio)))))
    (write resultado)
)

(defun volumenCubo() 
    (print "Dame el lado del cubo")
    (setq lado (read))
    (setq resultado (* lado (* lado lado)))    
    (write resultado)
)

(defun volumenCono()
    (print "Dame el radio de la base del cono: ")
    (setq radio (read))
    (print "Dame la altura del cono: ")
    (setq altura (read))
    (setq resultado (/ (* 3.1416 (* altura (* radio radio))) 3))
)

(defun volumenPiramideCuadrangular()
    (print "Dame el lado de la base de la piramide: ")
    (setq lado (read))
    (setq areabase (* lado lado))
    (print "Dame la altura de la piramide: ")
    (setq altura (read))
    (setq resultado ( / (* areabase altura) 3))
    (write resultado)
)

(defun volumenCilindro()
    (print "Dame el radio de la base del cilindro")
    (setq radio (read))
    (setq areabase (* 3.1416 (* radio radio)))
    (print "Dame la altura del cilindro")
    (setq altura (read))
    (setq resultado (* areabase altura))
    (write resultado)
)

(defun volumenPrismaRectangular()
    (print "Dame el largo del prisma: ")
    (setq largo (read))
    (print "Dame el ancho del prisma: ")
    (setq ancho (read))
    (print "Dame la altura del prisma: ")
    (setq altura (read))
    (setq resultado (* altura (* largo ancho)))
    (write resultado)
)

(defun volumenPrismaTriangular()
    (print "Dame la base del triangulo: ")
    (setq base (read))
    (print "Dame la altura del triangulo: ")
    (setq alturabase (read))
    (setq areabase (/ (* base alturabase) 2))
    (print "Dame la altura del prisma: ")
    (setq altura (read))
    (setq resultado (* areabase altura))
    (write resultado)
)

(defun volumenPrismaPentagonal()
    (print "Dame el lado del pentagono: ")
    (setq lado (read))
    (setq perimetro (* lado 5))
    (print "Dame la apotema del pentagono: ")
    (setq apotema (read))
    (print "Dame la altura del prisma: ")
    (setq altura (read))
    (setq resultado (* altura (/ (* perimetro apotema) 2)))
    (write resultado)
)

(defun volumenOctaedroRegular()
    (print "Dame el lado del octaedro: ")
    (setq lado (read))
    (setq constante (/ (sqrt 2) 3))
    (setq ladoalcubo (* lado (* lado lado)))
    (setq resultado (* constante ladoalcubo))
    (write resultado)
)

(defun volumenIcosaedro()
    (print "Dame el lado del icosaedro: ")
    (setq lado (read))
    (setq constante (* (/ 5 12) (+ 3 (sqrt 5))))
    (setq ladoalcubo (* lado (* lado lado)))
    (setq resultado (* constante ladoalcubo))
    (write resultado)
)


