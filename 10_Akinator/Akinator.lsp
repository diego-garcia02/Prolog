(print "Contesta con S para decir si y con N para decir no")
(terpri)
(defun recorre(lista)
    (setq rama (mapcar #'car lista))
    (setq hojas (mapcar #'cdr lista))
    (format t "¿Tu personaje es ~a"(car rama))
    (setq respuesta (read))
    (if (string-equal respuesta "S")
        (recorre (car hojas))
        (recorre (cadr hojas))
    ) 
       
)

(defparameter *nodes* 
    '((real
        (escritor
                    #|(Marvel 
                        (Stan Lee)
                        (Jack Kirby)
                        (Steve Ditko)
                    )
                    (1953
                       (es escritor de Man Thing Vol 3
                            (J. M. DeMatteis)
                       )
                       
                        
                    )
                    (es conocido por escribir historias de los 4 fantasticos
                        (es escritor de la Secret Wars del 2015
                            (Jonathan Hickman)
                        )
                        (es britanico 
                            (nacio en 1950
                                (Chris Claremont)
                            )
                        )

                    )
                    (britanico
                        (escritor de Inmortal Hulk
                            (Al Ewing)
                        )
                        (conocido por escribir historias de los 4 fantasticos
                             (de 1950
                                (Chris Claremont)
                            )
                        )
                    )
                    (conocido por escribir historias de Spider Man
                        (de 1967
                            (Dan Slott)
                        )
                    )|#
                )(dibujante
                   #|(de 1970
                        (Alex Ross)
                       
                   )
                   (creador de Marvel
                        (de 1917
                            (Jack Kirby)
                        )
                   )

                )) |# 
    ))
    (ficticio 
        (hombre #|(heroe
                   (poderes
                        (estudiante 
                            (preparatoria
                                (arañaradioactiva
                                    (usa traje rojo y azul
                                        (Peter Parker)
                                    )
                                )
                                
                            )
                            (va en primaria
                                (es miembro de power pack
                                    (tiene traje amarillo
                                        (Katie Power)
                                    )
                                    (tiene traje rojo
                                        (Julie Power)
                                    )
                                    (tiene traje azul
                                        (Jack Power)
                                    )
                                    (tiene traje blanco
                                        (Alex Power)
                                    )
                                )
                            )
                        )
                        (es millonario
                                (lleva armadura 
                                    (porta los colores amarillo y rojo
                                        (Tony Stark)
                                    )
                                )                        
                            
                        )
                        (es de fuera de la Tierra
                            (rubio
                                (porta un martillo
                                    (tiene apariencia humana
                                        (Thor)
                                    )
                                    
                                )
                            )
                            (es un dios
                                (es Asgardiano
                                    (es el padre de Thor
                                        (Odin Borson)
                                    )
                                    (es el hermano de Thor
                                        (Loki)
                                    )
                                )
                                (perteneciente a la mitologia griega
                                    (controla el rayo
                                        (Zeus)
                                    )
                                    (es hijo de Zeus
                                        (Hercules)
                                    )
                                )
                            )
                        )
                        (es artista marcial
                            (usa el puño como arma principal
                                (rubio
                                    (Danny Rand)
                                )
                            )
                        )
                        (participo en la WWII
                            (usa un escudo como arma principal
                                (Steve Rogers)
                            )
                        )
                        (vigilante
                            (ciego
                                (Matthew Murdock)
                            )
                        )
                        (cientifico
                            (obtiene sus poderes de la ira
                                (es verde
                                    (Hulk)
                                )
                            )
                            (es castaño
                                (es conocido por estirar su cuerpo
                                    (Reed Richards)
                                )
                            )
                        )
                        (miembro original de los 4 fantasticos
                            (puede encender su cuerpo
                                (Johnny Storm)
                            )
                            (Ben Grimm)
                        )
                        (miembro de los X-Men
                            (puede leer la mente
                                (va en silla de ruedas
                                    (Charles Xavier)
                                )
                            )
                            (puede regenerar su cuerpo
                                (lleva garras metalicas
                                    (Wolverine)
                                )
                                (tiene cancer
                                    (Wade Wilson)
                                )
                            )
                            (puede disparar rayos de sus ojos
                                (Scott Summers)
                            )
                            (es azul
                                (puede teletransportarse
                                    (Nightcrawler)
                                )
                                (Bestia)
                            )
                        )
                        (es hechicero
                            (Stephen Strange)
                        )
                        
                    )
                    (usa arco y flecha
                           (es o fue miembro de los vengadores
                                (Clint Barton)
                           )
                    )                   
                      
                  
                )
                (es un villano
                    (es enemigo de Spider Man
                        (es alienigena
                            (es de color negro
                                (Venom)
                            )
                            (es de color rojo
                                (Carnage)
                            )
                        )
                        (lleva un traje verde
                            (Duende Verde)
                        )
                        (es cientifico
                            (se convierte en lagarto
                                (Dr. Curtis Connors)
                            )
                            (Otto Octavius)
                        )              
                        (tiene traje o apariencia de rinoceronte
                            (Rhino)
                        )
                        (controla la electricidad
                            (Electro)
                        )
                    )
                    (es enemigo de los 4 fantasticos
                        (es un dictador
                            (Victor Von Doom)
                        )
                        (vive en las profundidades de la tierra
                            (Hombre Topo)
                        )
                        (come planetas
                            (Galactus)
                        )
                    
                    )
                    (es enemigo de los X-Men
                        (controla el magnetismo
                            (es grande
                                (Onslaught)
                            )
                            (Magneto)
                        )       
                        (es un dios
                            (Apocalipsis)
                        )   
                        (clona mutantes
                            (Mister Synister)
                        )

                    )
                    (nacio afuera de la Tierra 
                        (es morado
                            (elimino la mitad de la vida en el universo
                                (Thanos)
                            )
                            (come planetas
                                (Galactus)
                            )
                        )
                        
                    )
                    
                )|#
        ) 
        (mujer 
                #|(es una heroina
                    (tiene poderes
                        (es miembro de los vengadores
                            (usa magia
                                (Wanda Maximoff)
                            )
                        )
                        (es miembro de los X-Men
                            (tiene telepatia
                                (estuvo en una relacion con Scott Summers
                                    (Jean Grey)
                                )
                                
                            )
                            (controla el clima
                                (Storm)
                            )
                            (puede absorber otros poderes
                                (Rogue)
                            )
                        )
                        (es miembro de los cuatro fantasticos
                            (Susan Storm)
                        )
                    )
                    (es espia rusa
                        (Natasha Romanoff)
                    )
                   
                )
                (villana
                  
                )|#)
        (entidad 
            #|(come planetas
                (Galactus)
            )|#
                 
        )
    ))
)
    


