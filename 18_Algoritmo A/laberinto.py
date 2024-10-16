import pygame
import sys

# Inicialización de Pygame
pygame.init()

# Tamaño de la ventana
ANCHO, ALTO = 800, 600
ventana = pygame.display.set_mode((ANCHO, ALTO))
pygame.display.set_caption("Resolución de laberintos con el algoritmo A*")


# Colores
BLANCO = (255, 255, 255)
VERDE = (0, 255, 0)
AZUL = (0, 0, 255)
NEGRO = (0,0,0)
ROJO = (255,0,0)

rect_inicial = None
rect_final = None

# Fuente de texto
fuente = pygame.font.SysFont(None, 55)

# Ciclo principal
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    # Rellenar la ventana

    ventana.fill(BLANCO)

    #Dibujar lineas horizontales
    for i in range(12):
        pygame.draw.line(ventana,NEGRO, (0,(i+1)*50), (800,(i+1)*50))

    #Dibujar lineas verticales
    for i in range(16):
        pygame.draw.line(ventana,NEGRO,((i+1)*50,0),((i+1)*50,800))

    #Dibujar cuadrado inicial
    
    if pygame.mouse.get_pressed()[0]:
        pos = pygame.mouse.get_pos()
        for i in range(16):
            for j in range(12):
                if pos[0] >= i*50 and pos[0] <= (i+1)*50 and pos[1] >= j*50 and pos[1] <= (j+1)*50:
                    rect_inicial = pygame.Rect(i*50,j*50,50,50)
               
    if rect_inicial != None:
        pygame.draw.rect(ventana,VERDE,rect_inicial)
        
    #if pygame.mouse.get_pressed()[0] and rect_inicial != None:
        #pos = pygame.mouse.get_pos()
        #for i in range(16):
            #for j in range(12):
                #if pos[0] >= i*50 and pos[0] <= (i+1)*50 and pos[1] >= j*50 and pos[1] <= (j+1)*50:
                    #rect_final = pygame.Rect(i*50,j*50,50,50)
                        
    #if rect_final != None:
        #pygame.draw.rect(ventana, ROJO, rect_final)


    # Dibujar un rectángulo
    #pygame.draw.rect(ventana, VERDE, (150, 150, 200, 100))

    # Dibujar un círculo
    #pygame.draw.circle(ventana, AZUL, (400, 300), 75)

    # Renderizar texto
    #texto = fuente.render("Hola, Pygame!", True, AZUL)
    #ventana.blit(texto, (250, 500))

    # Actualizar la ventana
    pygame.display.flip()