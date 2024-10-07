import cv2
import numpy as np

# Iniciar la captura de video desde la cámara
cap = cv2.VideoCapture(0)

# Definir el rango de color que quieres rastrear en el espacio de color HSV (en este caso, azul)
lower_pink = np.array([140, 150, 0])
upper_pink = np.array([170, 255, 255])

lower_dark_pink = np.array([170,150,0])
upper_dark_pink = np.array([180,255,255])
i = 0
while True:
    # Capturar frame por frame
    ret, frame = cap.read()                                               
    if not ret:
        break
    i = i + 1
    
    # Convertir el frame de BGR a HSV
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    # Crear una máscara que detecte solo el color azul
    mask1 = cv2.inRange(hsv, lower_pink, upper_pink)
    mask2 = cv2.inRange(hsv, lower_dark_pink, upper_dark_pink)
    
    # Filtrar la máscara con operaciones morfológicas
    mask1 = cv2.erode(mask1, None, iterations=2)
    mask1 = cv2.dilate(mask1, None, iterations=2)

    mask2 = cv2.erode(mask2, None, iterations=2)
    mask2 = cv2.dilate(mask2, None, iterations=2)

    mask = mask1 + mask2
    
    # Encontrar contornos en la máscara
    contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Si se encuentra al menos un contorno, seguir el objeto
    if contours:
        # Tomar el contorno más grande
        largest_contour = max(contours, key=cv2.contourArea)
        
        # Encontrar el centro del contorno usando un círculo mínimo que lo rodee
        ((x, y), radius) = cv2.minEnclosingCircle(largest_contour)
        
        # Dibujar el círculo y el centro en el frame original si el radio es mayor que un umbral
        if radius > 10:
            #cv2.circle(frame, (int(x), int(y)), int(radius), (0, 255, 255), 2)
            #cv2.circle(frame, (int(x), int(y)), 5, (0, 255, 255), -1)
            #cv2.rectangle(frame,(int(x-radius), int(x+radius)) )


            img2 = frame[int(y-radius):int(y+radius),int(x-radius):int(x+radius)]
            cv2.imwrite("C://Prolog//17_OpenCV//Frames//recorte"+str(i)+".jpg",img2)
            cv2.imshow('img2',img2)
    
    # Mostrar el frame
    cv2.imshow('Frame', frame)
    cv2.imshow('Mask', mask)

    # Salir si se presiona la tecla 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Liberar la captura y cerrar todas las ventanas
cap.release()

cv2.destroyAllWindows()

#Tarea guardar imagenes para crear un dataset con imwrite y resize