import pygame
import sys

# Inicialización de Pygame
pygame.init()

# Tamaño de la ventana
ANCHO, ALTO = 800, 700
ventana = pygame.display.set_mode((ANCHO, ALTO))
pygame.display.set_caption("Resolución de laberintos con el algoritmo A*")

# Colores
BLANCO = (255, 255, 255)
VERDE = (0, 255, 0)
AZUL = (0, 0, 255)
NEGRO = (0,0,0)
ROJO = (255,0,0)
NARANJA = (244,67,11)

directions =[(0,1),(1,0),(1,1),(-1,0),(0,-1),(-1,-1),(-1,1),(1,-1)]
rect_inicial_coords = None
rect_final_coords = None
rect_inicial = None
rect_final = None
is_solving = False
paredes = []
paredes_coords = []
h = {}
g = {}
f = {}
la = []
lc = []
solucion = []
pos= 0

def get_solution(lc):
<<<<<<< HEAD
   last_index = len(lc) - 1
   while last_index >= 0:
=======
    last_index = len(lc) - 1
    while last_index >= 0:
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
          last_node = lc.pop(-1)
          last_index = len(lc) - 1
          for i in range(len(lc)-1,-1,-1):
               for j,k in directions:
                    if (lc[i][0] + j, lc[i][1] + k) == last_node:
                         farthest_neighbor = lc[i]
                         break
          if len(lc) != 0:
            if farthest_neighbor == lc[0]:
                solucion.insert(0,rect_final_coords)
                print(f"Solucion: {solucion}")
            index = lc.index(farthest_neighbor)
            lc = lc[:index+1]
            solucion.append(farthest_neighbor)
<<<<<<< HEAD
   
    
  
 #Algoritmo para definir la f mas pequeña  
def get_smallest_item(f):
     smallest_value = 2000
     returned_coord = (0,0)
=======
      
    
   
#Algoritmo para definir la f mas pequeña  
def get_smallest_item(f):
     smallest_value = 2000
     returned_coord = f.popitem()
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
     for i,j in f.items():
        if j < smallest_value:
            smallest_value = j
            returned_coord = i
<<<<<<< HEAD

=======
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
            
     return returned_coord
         

def get_neighbors(rect_inicial_coords,paredes_coords):
<<<<<<< HEAD
        print(f"Coord inicial: {rect_inicial_coords}")
        print(f"Valor de G en la coordenada inicial: {g[rect_inicial_coords]}")
        for i,j in directions:
            if int(rect_inicial_coords[0]+i) >=0 and int(rect_inicial_coords[0]+i) <=15 and int(rect_inicial_coords[1]+j) >= 0 and int(rect_inicial_coords[1]+j) <= 11 and (rect_inicial_coords[0]+i,rect_inicial_coords[1]+j) not in paredes_coords and (rect_inicial_coords[0]+i,rect_inicial_coords[1]+j) not in lc:
                 neighbor = (rect_inicial_coords[0]+i,rect_inicial_coords[1]+j)
                 
                 
                 if (rect_inicial_coords[0] + 1,rect_inicial_coords[1]) == neighbor or (rect_inicial_coords[0] - 1,rect_inicial_coords[1]) == neighbor or (rect_inicial_coords[0],rect_inicial_coords[1] + 1) == neighbor or (rect_inicial_coords[0],rect_inicial_coords[1]-1) == neighbor:
                    g_temp = 10
                 else:
                    g_temp = 14 

               
                             
                 g[neighbor] = g[rect_inicial_coords] + g_temp
                 h[neighbor] = (abs(rect_final_coords[0]-neighbor[0]) + abs(rect_final_coords[1]-neighbor[1]))*10
                 f[neighbor] = h[neighbor] + g[neighbor]      
                 
                 if neighbor not in la:
                    la.append(neighbor)    

       
        #print(f"G:{g}")
        #print(f"F:{f}")
        return get_smallest_item(f)
          

def solve(rect_inicial_coords,rect_final_coords,paredes_coords):
      lc.append(rect_inicial_coords)
      #if node == None:
        #node = Node(rect_inicial_coords)
      #else:
        #node.enlazar(rect_inicial_coords)
        #node = node.obtener_siguiente()
      rect_inicial_coords = get_neighbors(rect_inicial_coords,paredes_coords)
      #print(f"Nodo: {rect_inicial_coords}")
=======
        for i,j in directions:
            if rect_inicial_coords[0]+i >=0 and rect_inicial_coords[0]+i <=15 and rect_inicial_coords[1]+j >= 0 and rect_inicial_coords[1]+j <= 11 and (rect_inicial_coords[0]+i,rect_inicial_coords[1]+j) not in paredes_coords and (rect_inicial_coords[0]+i,rect_inicial_coords[1]+j) not in lc and (rect_inicial_coords[0]+i,rect_inicial_coords[1]+j) not in la:
             la.append((rect_inicial_coords[0]+i,rect_inicial_coords[1]+j))
        #print("Lista abierta: "+str(la)

#Calcular la F a partir de la G y la H        
def get_smallest_f(rect_inicial_coords,rect_final_coords,g,h):
    #print(la)
    #g_ant = g[rect_inicial_coords]
    for i in la:
         if (rect_inicial_coords[0] + 1,rect_inicial_coords[1]) == i or (rect_inicial_coords[0] - 1,rect_inicial_coords[1]) == i or (rect_inicial_coords[0],rect_inicial_coords[1]+1) == i or (rect_inicial_coords[0],rect_inicial_coords[1]-1) == i:
              g_temp = 10

         else:
              g_temp = 14
        
         g[i] = g[rect_inicial_coords] + g_temp
         h[i] = (abs(rect_final_coords[0]-i[0]) + abs(rect_final_coords[1]-i[1]))*10
         f[i] = h[i] + g[i]
           
                 
    #print(f)
    return get_smallest_item(f)
    
def solve(rect_inicial_coords,paredes_coords,rect_final_coords,g,h):
      lc.append(rect_inicial_coords)
      get_neighbors(rect_inicial_coords,paredes_coords)
      la.remove(rect_inicial_coords)
      rect_inicial_coords = get_smallest_f(rect_inicial_coords,rect_final_coords,g,h)
      #print(rect_inicial_coords)
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
      f.pop(rect_inicial_coords)
      if rect_inicial_coords == rect_final_coords:
           lc.append(rect_final_coords)
           get_solution(lc)             
      else:
<<<<<<< HEAD
           solve(rect_inicial_coords,rect_final_coords,paredes_coords)   
      
           
=======
           solve(rect_inicial_coords,paredes_coords,rect_final_coords,g,h)       
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8

# Fuente de texto
fuente = pygame.font.SysFont(None, 45)

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
        pygame.draw.line(ventana,NEGRO,((i+1)*50,0),((i+1)*50,600))

    #Dibujar cuadrado inicial
    
    if pygame.mouse.get_pressed()[0] and rect_inicial == None:
        pos = pygame.mouse.get_pos()
        for i in range(16):
            for j in range(12):
                if pos[0] >= i*50 and pos[0] <= (i+1)*50 and pos[1] >= j*50 and pos[1] <= (j+1)*50:
                    rect_inicial = pygame.Rect(i*50,j*50,50,50)
                    rect_inicial_coords = (i,j)
                    g[rect_inicial_coords] = 0
<<<<<<< HEAD
                    
=======
                    la.append(rect_inicial_coords)
                    #print(rect_inicial_coords)
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
                    
                    
    if rect_inicial != None:
        pygame.draw.rect(ventana,VERDE,rect_inicial)
    
    #Dibujar cuadrado final        
    if rect_inicial != None and pygame.mouse.get_pressed()[0] and rect_final == None and pygame.mouse.get_pos() != pos:
            pos = pygame.mouse.get_pos()
            for i in range(16):
                for j in range(12):
                    if pos[0] >= i*50 and pos[0] <= (i+1)*50 and pos[1] >= j*50 and pos[1] <= (j+1)*50:
                        rect_final = pygame.Rect(i*50,j*50,50,50)
                        rect_final_coords = (i,j)
<<<<<<< HEAD
                        
=======
                        #print(rect_final_coords)
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
                                
    if rect_final != None:
        pygame.draw.rect(ventana,ROJO,rect_final)
    
    #Dibujar las paredes
    if pygame.mouse.get_pos() != pos and rect_final !=None and pygame.mouse.get_pressed()[0] and not is_solving: 
           pos = pygame.mouse.get_pos()
           for i in range(16):
                for j in range(12):
                    if pos[0] >= i*50 and pos[0] <= (i+1)*50 and pos[1] >= j*50 and pos[1] <= (j+1)*50:
                        paredes.append(pygame.Rect(i*50,j*50,50,50))
                        paredes_coords.append((i,j))
                        
    if paredes != []:
        for i in paredes:
            pygame.draw.rect(ventana,NEGRO,i)
    
    #Creación del boton
    pygame.draw.rect(ventana,NEGRO,(300,625,200,50))
    superficie_texto = fuente.render("Resolver",False,BLANCO)

    ventana.blit(superficie_texto,(325,640))

<<<<<<< HEAD
    if pygame.mouse.get_pressed()[0] and pygame.mouse.get_pos()[0] >= 300 and pygame.mouse.get_pos()[0] <= 500 and pygame.mouse.get_pos()[1] >= 625 and pygame.mouse.get_pos()[1] <= 675 and not is_solving:
            is_solving = True
            solve(rect_inicial_coords,rect_final_coords,paredes_coords)
            
            #solucion.pop(-1)

          
            
    for i in solucion:
        
=======
    if pygame.mouse.get_pressed()[0] and pygame.mouse.get_pos()[0] >= 300 and pygame.mouse.get_pos()[0] <= 500 and pygame.mouse.get_pos()[1] >= 625 and pygame.mouse.get_pos()[1] <= 675 and len(la) == 1:
            is_solving = True
            solve(rect_inicial_coords,paredes_coords,rect_final_coords,g,h)
            solucion.pop(-1)
            
          
            
    for i in solucion:
>>>>>>> 01c3a036b65a10b525953f85cb6b981d3d27d4c8
         pygame.draw.rect(ventana,NARANJA,(i[0]*50,i[1]*50,50,50))
            
    
 

 
             
              
            

    

            
    
   


    
    #time.sleep(10)


    
    # Dibujar un rectángulo
    #pygame.draw.rect(ventana, VERDE, (150, 150, 200, 100))

    # Dibujar un círculo
    #pygame.draw.circle(ventana, AZUL, (400, 300), 75)

    # Renderizar texto
    #texto = fuente.render("Hola, Pygame!", True, AZUL)
    #ventana.blit(texto, (250, 500))

    # Actualizar la ventana
    pygame.display.flip()