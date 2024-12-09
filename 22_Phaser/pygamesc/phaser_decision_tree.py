import pygame
import random
import pandas as pd
import numpy as np
import os
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier, export_graphviz
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'
from keras import Sequential
#os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'
#from tensorflow.python.keras.models import Sequential
from keras.src.layers import Dense



# Inicializar Pygame
pygame.init()

# Dimensiones de la pantalla
w, h = 800, 400
pantalla = pygame.display.set_mode((w, h))
pygame.display.set_caption("Juego: Disparo de Bala, Salto, Nave y Menú")

# Colores
BLANCO = (255, 255, 255)
NEGRO = (0, 0, 0)

# Variables del jugador, bala, nave, fondo, etc.
jugador = None
bala = None
fondo = None
nave = None
menu = None

# Variables de salto
salto = False
salto_altura = 15  # Velocidad inicial de salto
gravedad = 1
en_suelo = True

# Variables de pausa y menú
pausa = False
fuente = pygame.font.SysFont('Arial', 24)
menu_activo = True
modo_auto = False  # Indica si el modo de juego es automático
global decision_tree
decision_tree = False
global neural_network
neural_network = False

# Lista para guardar los datos de velocidad, distancia y salto (target)
datos_modelo = []

# Cargar las imágenes
jugador_frames = [
    pygame.image.load('./22_Phaser/pygamesc/assets/sprites/mono_frame_1.png'),
    pygame.image.load('./22_Phaser/pygamesc/assets/sprites/mono_frame_2.png'),
    pygame.image.load('./22_Phaser/pygamesc/assets/sprites/mono_frame_3.png'),
    pygame.image.load('./22_Phaser/pygamesc/assets/sprites/mono_frame_4.png')
]

bala_img = pygame.image.load('./22_Phaser/pygamesc/assets/sprites/purple_ball.png')
fondo_img = pygame.image.load('./22_Phaser/pygamesc/assets/game/fondo2.png')
nave_img = pygame.image.load('./22_Phaser/pygamesc/assets/game/ufo.png')
menu_img = pygame.image.load('./22_Phaser/pygamesc/assets/game/menu.png')

# Escalar la imagen de fondo para que coincida con el tamaño de la pantalla
fondo_img = pygame.transform.scale(fondo_img, (w, h))

# Crear el rectángulo del jugador y de la bala
jugador = pygame.Rect(50, h - 100, 32, 48)
bala = pygame.Rect(w - 50, h - 90, 16, 16)
nave = pygame.Rect(w - 100, h - 100, 64, 64)
menu_rect = pygame.Rect(w // 2 - 135, h // 2 - 90, 270, 180)  # Tamaño del menú

# Variables para la animación del jugador
current_frame = 0
frame_speed = 10  # Cuántos frames antes de cambiar a la siguiente imagen
frame_count = 0

# Variables para la bala
velocidad_bala = -10  # VGelocidad de la bala hacia la izquierda
bala_disparada = False

# Variables para el fondo en movimiento
fondo_x1 = 0
fondo_x2 = w

def auto_neural_network(datos_modelo):
 
    file_path = "./22_Phaser/pygamesc/datos.csv"
    
    try:
        f = open(file_path,'x')
    except FileExistsError:
        print("File already exists!")
    
    f = open(file_path, 'w')
    for i in datos_modelo:
        i = str(i)
        i = i.removeprefix('(')
        i = i.removesuffix(')')
        i = i.replace(" ","")
        f.write(i+"\n")
    
    f = open(file_path,'r')
    
    dataset = pd.read_csv(file_path, header=None, names=['velocidad', 'distancia', 'target'],dtype=float)
    print(dataset)
    # Definir características (X) y etiquetas (y)
    X = dataset.iloc[:,:2]  # Las dos primeras columnas son las características
    y = dataset.iloc[:, 2]   # La tercera columna es la etiqueta

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    global model
    model = Sequential([
        Dense(2,input_dim=2,activation='relu'), #relu
        #Dense(6, activation = 'sigmoid'), #relu
        #Dense(6, activation = 'sigmoid'),
        Dense(6, activation = 'relu'), #sigmoid
        Dense(6, activation='sigmoid'),
        Dense(1,activation='sigmoid'), #sigmoid
       
    ])

    model.compile(optimizer='adam',
                 loss='binary_crossentropy',
                 metrics=['accuracy'])
    model.summary()
    print(f"Pesos: {model.get_weights()}")

    model.fit(X_train,y_train,epochs=100,batch_size=32,verbose=1)


    loss, accuracy = model.evaluate(X_test,y_test,verbose=0)
    print(f"Prediccion en el conjunto de prueba: {accuracy:.2f}")


   

def auto_decision_tree(datos_modelo):
    #os.environ["PATH"] += os.pathsep + 'C:/Program Files (x86)/Graphviz2.38/bin/'
    #os.environ["PATH"] += os.pathsep + 'C:/Program Files (x86)/Graphviz2.38/bin/dot.exe'
    # Cargar el dataset
    file_path = "./22_Phaser/pygamesc/datos.csv"
    
    try:
        f = open(file_path,'x')
    except FileExistsError:
        print("File already exists!")
        
    f = open(file_path, 'w')
    for i in datos_modelo:
        i = str(i)
        i = i.removeprefix('(')
        i = i.removesuffix(')')
        i = i.replace(" ","")
        f.write(i+"\n")
    
    f = open(file_path,'r')
       
    #print(file_path)
    dataset = pd.read_csv(file_path, header=None, names=['velocidad', 'distancia', 'target'],dtype=float)
    
    # Eliminar columnas innecesarias (como la vacía "Unnamed: 3")
    #dataset = dataset.drop(columns=['Unnamed: 3'])

    # Definir características (X) y etiquetas (y)
    X = dataset.iloc[:,:2]  # Las dos primeras columnas son las características
    y = dataset.iloc[:, 2]   # La tercera columna es la etiqueta

    # Dividir los datos en conjunto de entrenamiento y prueba
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Crear el clasificador de Árbol de Decisión
    global clf 
    clf = DecisionTreeClassifier()

    # Entrenar el modelo
    clf.fit(X_train, y_train)
    #print(f'Dataset de prueba: {X_test}')
    #print(f'Tipo de dato del dataset: {type(X_test)}')
    
    y_score= clf.score(X_test,y_test)
    print(y_score)



def graficar_datos():
    file_path = './22_Phaser/pygamesc/datos.csv'
    try:
        f = open(file_path,'x')
    except FileExistsError:
        print("File already exists!")
        
    f = open(file_path, 'w')
    for i in datos_modelo:
        i = str(i)
        #print(i)
        i = i.removeprefix('(')
        i = i.removesuffix(')')
        f.write(i+"\n")
    f = open(file_path,'r')
    # Cargar los datos desde el CSV especificando que la primera fila es un encabezado
    df = pd.read_csv(file_path, header=None, names=['x1', 'x2', 'target'], dtype=float)
    print(df)
    # Crear la figura 3D
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    # Graficar puntos con target=0
    ax.scatter(df[df['target'] == 0]['x1'], df[df['target'] == 0]['x2'], df[df['target'] == 0]['target'], c='blue', marker='o', label='target=0')
    # Graficar puntos con target=1
    ax.scatter(df[df['target'] == 1]['x1'], df[df['target'] == 1]['x2'], df[df['target'] == 1]['target'],c='red', marker='x', label='target=1')
    # Etiquetas de los ejes
    ax.set_xlabel('x1')
    ax.set_ylabel('x2')
    ax.set_zlabel('Target')
    # Mostrar leyenda
    ax.legend()
    # Mostrar el gráfico
    plt.show()

def velocidadbala(min,max):
    return random.randint(min,max)

# Función para disparar la bala
def disparar_bala():
    global bala_disparada, velocidad_bala
    if not bala_disparada:
        velocidad_bala = -1*velocidadbala(5,20)  # Velocidad aleatoria negativa para la bala
        bala_disparada = True

def datos_entrenamiento_decision_tree():
    global jugador, bala, velocidad_bala, salto
    distancia = abs(jugador.x - bala.x)
    
    data_frame = pd.DataFrame([[velocidad_bala, distancia]],columns=['velocidad','distancia'])
    #array = np.array([velocidad_bala,distancia])
    #print(data_frame)
    data = clf.predict(data_frame)
    #print(data[0])
    #aire = round(data[0]*100)
    #piso = round(data[1]*100)
    return int(data[0])

def datos_entrenamiento_neural_network():

    global jugador, bala, velocidad_bala, salto
    distancia = abs(jugador.x - bala.x)
    array = np.array([[velocidad_bala,distancia]])
    data = model.predict(array)
    print(round(data[0][0]))
    print(data[0][0])
    return round(data[0][0])
    



  

# Función para reiniciar la posición de la bala
def reset_bala():
    global bala, bala_disparada
    bala.x = w - 50  # Reiniciar la posición de la bala
    bala_disparada = False

# Función para manejar el salto
def manejar_salto():
    global jugador, salto, salto_altura, gravedad, en_suelo

    if salto:
        jugador.y -= salto_altura  # Mover al jugador hacia arriba
        salto_altura -= gravedad  # Aplicar gravedad (reduce la velocidad del salto)

        # Si el jugador llega al suelo, detener el salto
        if jugador.y >= h - 100:
            jugador.y = h - 100
            salto = False
            salto_altura = 15  # Restablecer la velocidad de salto
            en_suelo = True

# Función para actualizar el juego
def update():
    global bala, velocidad_bala, current_frame, frame_count, fondo_x1, fondo_x2

    # Mover el fondo
    fondo_x1 -= 1
    fondo_x2 -= 1

    # Si el primer fondo sale de la pantalla, lo movemos detrás del segundo
    if fondo_x1 <= -w:
        fondo_x1 = w

    # Si el segundo fondo sale de la pantalla, lo movemos detrás del primero
    if fondo_x2 <= -w:
        fondo_x2 = w

    # Dibujar los fondos
    pantalla.blit(fondo_img, (fondo_x1, 0))
    pantalla.blit(fondo_img, (fondo_x2, 0))

    # Animación del jugador
    frame_count += 1
    if frame_count >= frame_speed:
        current_frame = (current_frame + 1) % len(jugador_frames)
        frame_count = 0

    # Dibujar el jugador con la animación
    pantalla.blit(jugador_frames[current_frame], (jugador.x, jugador.y))
    print("Altura del jugador: "+str(jugador.y))

    # Dibujar la nave
    pantalla.blit(nave_img, (nave.x, nave.y))





    # Mover y dibujar la bala
    if bala_disparada:
        bala.x += velocidad_bala

    # Si la bala sale de la pantalla, reiniciar su posición
    if bala.x < 0:
        reset_bala()

    pantalla.blit(bala_img, (bala.x, bala.y))

    # Colisión entre la bala y el jugador
    if jugador.colliderect(bala):
        print("Colisión detectada!")

        reiniciar_juego()  # Terminar el juego y mostrar el menú

# Función para guardar datos del modelo en modo manual
def guardar_datos():
    global jugador, bala, velocidad_bala, salto
    distancia = abs(jugador.x - bala.x)
    salto_hecho = 1 if salto else 0  # 1 si saltó, 0 si no saltó
    # Guardar velocidad de la bala, distancia al jugador y si saltó o no
    datos_modelo.append((velocidad_bala,distancia,salto_hecho))

# Función para pausar el juego y guardar los datos
def pausa_juego():
    global pausa
    pausa = not pausa
    if pausa:
        print("Juego pausado. Datos registrados hasta ahora:", datos_modelo)
    else:
        print("Juego reanudado.")

def reiniciar_juego():
    global menu_activo, jugador, bala, nave, bala_disparada, salto, en_suelo, decision_tree, neural_network
    menu_activo = True  # Activar de nuevo el menú
    jugador.x, jugador.y = 50, h - 100  # Reiniciar posición del jugador
    bala.x = w - 50  # Reiniciar posición de la bala
    nave.x, nave.y = w - 100, h - 100  # Reiniciar posición de la nave
    bala_disparada = False
    salto = False
    en_suelo = True
    decision_tree = False
    neural_network = False
    #datos_modelo = [] 
    # Mostrar los datos recopilados hasta el momento
    print("Datos recopilados para el modelo: ", datos_modelo)
    mostrar_menu()  # Mostrar el menú de nuevo para seleccionar modo


# Función para mostrar el menú y seleccionar el modo de juego
def mostrar_menu():
    global menu_activo, modo_auto,neural_network,decision_tree
    pantalla.fill(NEGRO)
    texto = fuente.render("Presiona 'D' para Modo Auto con Decision Tree, 'R' para Modo Auto con Redes Neuronales 'M' para Manual,'Q' para Salir o 'G' para Graficar", True, BLANCO)
    pantalla.blit(texto, (w/12 , h/2.5))
    pygame.display.flip()

    

    while menu_activo:
        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                pygame.quit()
                exit()
            if evento.type == pygame.KEYDOWN:
                if evento.key == pygame.K_r:
                    modo_auto = True
                    menu_activo = False
                    neural_network = True
                    auto_neural_network(datos_modelo)
                elif evento.key == pygame.K_d:
                    modo_auto = True
                    menu_activo = False
                    decision_tree = True
                    auto_decision_tree(datos_modelo)
                elif evento.key == pygame.K_m:
                    modo_auto = False
                    menu_activo = False
                elif evento.key == pygame.K_q:
                    print("Juego terminado. Datos recopilados:", datos_modelo)
                    pygame.quit()
                    exit()
                elif evento.key == pygame.K_g:
                    print("Datos graficados")
                    graficar_datos()
                


# Función para reiniciar el juego tras la colisión

def main():
   
    global salto, en_suelo, bala_disparada,bala, datos_modelo

    reloj = pygame.time.Clock()
    mostrar_menu()  # Mostrar el menú al inicio
    correr = True

    while correr:
        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                correr = False
            if evento.type == pygame.KEYDOWN:
                if evento.key == pygame.K_SPACE and en_suelo and not pausa:  # Detectar la tecla espacio para saltar
                    salto = True
                    en_suelo = False
                if evento.key == pygame.K_p:  # Presiona 'p' para pausar el juego
                    pausa_juego()
                if evento.key == pygame.K_q:  # Presiona 'q' para terminar el juego
                    print("Juego terminado. Datos recopilados:", datos_modelo)
                    pygame.quit()
                    exit()
                if evento.key == pygame.K_j:
                   datos_modelo = []
                   reiniciar_juego()
               

        if not pausa:
            # Modo manual: el jugador controla el salto
            if not modo_auto:
                if salto:
                    manejar_salto()
                # Guardar los datos si estamos en modo manual
                print("Time to store data")
                guardar_datos()
            if modo_auto and salto:
                manejar_salto()
            
                  
                    #manejar_salto()
            if modo_auto and en_suelo and decision_tree:
                if datos_entrenamiento_decision_tree() == 1:
                        salto = True
                        en_suelo = False
            if modo_auto and en_suelo and neural_network:
                if datos_entrenamiento_neural_network() == 1:
                        salto = True
                        en_suelo = False
            
                
            
            

            # Actualizar el juego
            if not bala_disparada:
                disparar_bala()
            update()

        # Actualizar la pantalla
        pygame.display.flip()
        reloj.tick(30)  # Limitar el juego a 30 FPS

    pygame.quit()

if __name__ == "__main__":
    main()
