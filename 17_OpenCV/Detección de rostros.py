import numpy as np
import cv2 as cv

#rostro = cv.CascadeClassifier('./17_OpenCV/haarcascade_frontalface_alt.xml')
cap = cv.VideoCapture(0)

lower_skin = np.array([0, 200, 0])
upper_skin = np.array([20, 255, 255])

pixel_list = []

x=y=w=h= 0 
img = 0
count = 0
while True:
    ret, frame = cap.read()
    hsv = cv.cvtColor(frame, cv.COLOR_BGR2HSV)
    
    mask = cv.inRange(hsv, lower_skin, upper_skin)

    mask = cv.erode(mask,None, iterations=2)
    mask = cv.dilate(mask,None,iterations=2)  

    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)

    if contours:
        largest_contour = max(contours, key=cv.contourArea)
        
        #Encontrar el centro del contorno usando un círculo mínimo que lo rodee
        ((x, y), radius) = cv.minEnclosingCircle(largest_contour)
        
        # Dibujar el círculo y el centro en el frame original si el radio es mayor que un umbral
        if radius > 10:
            #cv2.circle(frame, (int(x), int(y)), int(radius), (0, 255, 255), 2)
            #cv2.circle(frame, (int(x), int(y)), 5, (0, 255, 255), -1)
            cv.rectangle(frame, (int(x-radius), int(y-radius)), (int(x+radius), int(y+radius)), (0, 0, 255), 3)
            img2 = frame[int(y-radius):int(y+radius),int(x-radius):int(x+radius)]

            #Reescalando las imagenes a 80 y 100 
            img_80 = cv.resize(img2, (80,80), interpolation=cv.INTER_AREA)
            img_100 = cv.resize(img2, (100,100), interpolation=cv.INTER_AREA)

            #Pasando las imagenes a escala de grises
            gray_80 = cv.cvtColor(img_80, cv.COLOR_BGR2GRAY)
            gray_100 = cv.cvtColor(img_100, cv.COLOR_BGR2GRAY)
            
            x80,y80 = gray_80.shape
            x100,y100 = gray_100.shape

            img80 = np.zeros((x80*2,y80*2),dtype='uint8')
            img100 = np.zeros((x100*2,y100*2),dtype='uint8')

            #Binarizando las imagenes
            for i in range(x80):
                for j in range(y80):
                    if(img80[i,j]>150):
                        img80[i,j]=255
                    else:
                        img80[i,j] = 0
        
            for i in range(x100):
                for j in range(y100):
                    if(img100[i,j]>150):
                        img100[i,j]=255
                    else:
                        img100[i,j] = 0
            
            for i in range(x100):
                for j in range(y100):
                    if i<img100.shape[0] and j<img100.shape[0] and img80[i,j] == img100[i,j]:
                        pixel_list.append(img80[i,j])
            
            

                        

                
            

            cv.imshow('img80', img80)
            cv.imshow('img100', img100)
            
            #cv2.imwrite("C://Prolog//17_OpenCV//Frames//recorte"+str(i)+".jpg",img2)
            #cv2.imshow('img2',img2)
    
    #name = '/home/likcos/imgs/cara'+str(count)+'.jpg'
    #cv.imwrite(name, frame)
    cv.imshow('rostros', frame)
    cv.imshow('mask', mask)
    
    k = cv.waitKey(1) 
    if k == 27 & 0xFF == ord('q'):
        break
cap.release()
cv.destroyAllWindows()