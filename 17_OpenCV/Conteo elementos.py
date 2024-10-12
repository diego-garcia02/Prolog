import cv2 as cv

def resolver(mask,elementos):
     for i in range(len(mask)):
            for j in range(len(mask[0])):
                if mask[i,j] == 255:
                    elementos += 1
                    encontrarVecinos(i,j,mask)
     return elementos
            
def encontrarVecinos(x,y,mask):
      if x<len(mask[0]) and y<len(mask) and x>=0 and y>=0:
                if mask[x,y] == 255:
                    mask[x,y] = 0
                    
                    encontrarVecinos(x+1,y,mask)
                    encontrarVecinos(x-1,y,mask)
                    encontrarVecinos(x,y+1,mask)
                    encontrarVecinos(x,y-1,mask)
     
    


#Variables para contar los elementos


img = cv.imread('C://Prolog//17_OpenCV//salida.jpg', 1)
img = cv.resize(img, (20,20),cv.INTER_AREA)
hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)

ubb=(0, 100, 100)
uba=(10, 255, 255)
ubb2=(170, 100, 100)
uba2=(180, 255, 255)


mask1 = cv.inRange(hsv, ubb, uba)
mask2 = cv.inRange(hsv, ubb2, uba2)
mask = mask1 + mask2

res = cv.bitwise_and(img, img, mask=mask)

elementos = 0

print("Numero de elementos rojos: "+str(resolver(mask,elementos)))

ubb=(10, 100, 100)
uba=(45, 255, 255)

mask = cv.inRange(hsv,ubb, uba)

res = cv.bitwise_and(img,img,mask)

elementos = 0

print("Numero de elementos amarillos: "+str(resolver(mask,elementos)))

ubb=(45, 100, 100)
uba=(85, 255, 255)

mask = cv.inRange(hsv,ubb, uba)

res = cv.bitwise_and(img,img,mask)

elementos = 0

print("Numero de elementos verdes: "+str(resolver(mask,elementos)))

ubb=(85, 100, 100)
uba=(125, 255, 255)

mask = cv.inRange(hsv,ubb, uba)

res = cv.bitwise_and(img,img,mask)

elementos = 0

print("Numero de elementos azules: "+str(resolver(mask,elementos)))

cv.imshow('mask',mask)
cv.waitKey(0)
cv.destroyAllWindows()