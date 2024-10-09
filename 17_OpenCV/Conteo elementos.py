import cv2 as cv
rojos = 0
amarillos = 0
azules = 0
verdes = 0

def recorre(x,y,img):
    if img[x,y] != None:
        if img[x,y] == 255:
            recorre(x+1,y)
            recorre(x-1,y)
            recorre(x,y-1)
            recorre(x,y+1)
            recorre(x-1,y-1)
            recorre(x+1,y-1)
            recorre(x+1,y+1)
            recorre(x-1,y+1)
            rojos = rojos + 1


#Variables para contar los elementos


img = cv.imread('salida.jpg', 1)
hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)
ubb=(0, 100, 100)
uba=(10, 255, 255)
ubb2=(170, 100, 100)
uba2=(180, 255, 255)

mask1 = cv.inRange(hsv, ubb, uba)
mask2 = cv.inRange(hsv, ubb2, uba2)
mask = mask1 + mask2

res = cv.bitwise_and(img, img, mask=mask)

x,y = mask.shape 

recorre(0,0,img)


cv.imshow('mask', mask)
cv.imshow('hsv', hsv)
cv.imshow('res', res)
cv.imshow('img', img)
cv.waitKey(0)
cv.destroyAllWindows()