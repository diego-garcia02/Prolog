import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from keras import Sequential
from keras.src.layers import Dense, InputLayer
from sklearn.model_selection import train_test_split

#Generando los datos
np.random.seed(10)
    
X = np.random.choice([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9],size=(2000,3))

y= []

#Si el promedio del historial de pagos e ingresos mensuales es mayor a 0.8 la clase 
y1 = [((X[:,0]+X[:,1])/2 >= 0.7).astype(int), ((X[:,0]+X[:,1])/2 > 0.4).astype(int),((X[:,0]+X[:,1])/2 < 0.7).astype(int), ((X[:,0]+X[:,1])/2 <= 0.4).astype(int)]
y2 = [ (X[:,2]<= 0.4).astype(int),  (X[:,2] > 0.4).astype(int),(X[:,2] < 0.7).astype(int), (X[:,2] >= 0.7).astype(int)]


for i in range(len(y1[0])):
   y.append([])
   if (y1[0][i] == 1 and y2[0][i] == 1) or (y1[0][i] == 1 and (y2[1][i] + y2[2][i]) == 2):
       y[i].append(1)
   else:
       y[i].append(0)
   if (y1[0][i] == 1 and y2[3][i] == 1) or ((y1[1][i] + y1[2][i]) == 2 and (y2[1][i] + y2[2][i]) == 2) or ((y1[1][i] + y1[2][i]) == 2 and y2[0][i] == 1) or ((y1[1][i] + y1[2][i]) == 2 and y2[3][i] == 1):
       y[i].append(1)
   else: 
        y[i].append(0)
   if (y1[3][i] == 1 and y2[0][i] == 1) or (y1[3][i] == 1 and (y2[1][i] + y2[2][i]) == 2) or (y1[3][i] == 1 and y2[3][i] == 1):
       y[i].append(1)
   else:
        y[i].append(0)
    
print(type(X[0]))
print(X)
y = np.array(y)
print(y)


   
def graficar_datos():
    file_path = './24_Examen/datos.csv'

    df = pd.read_csv(file_path, header=None, names=['HP', 'IM', 'RDI'], dtype=float)
    print(df)
    # Crear la figura 3D
    fig = plt.figure()
    ax = fig.add_subplot(111,projection='3d')
    # Graficar puntos con target=0
    ax.scatter(df[df['target'] == -1]['HP'], df[df['target'] == -1]['RDI'],df[df['target'] == -1]['target'],
            c='blue', marker='o', label='target=1')
    # Graficar puntos con target=1
    ax.scatter(df[df['target'] == 0]['HP'], df[df['target'] == 0]['RDI'],df[df['target'] == 0]['target'],
            c='red', marker='o', label='target=2')
    ax.scatter(df[df['target'] == 1]['HP'], df[df['target'] == 1]['RDI'],df[df['target'] == 1]['target'],
            c='green', marker='o', label='target=3')
    # Etiquetas de los ejes
    ax.set_xlabel('HP')
    ax.set_ylabel('RDI')
    ax.set_zlabel('target')

    # Mostrar leyenda
    ax.legend()
    # Mostrar el gráfico
    plt.show()

def train_nn(X,y):

 
    X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2,random_state=42)

    model = Sequential([
        InputLayer(shape=(3,), ),
        Dense(3, activation='relu'),
        Dense(10, activation='relu'),
        Dense(10,activation='sigmoid'),
        Dense(10, activation='sigmoid'),
        Dense(3,activation='sigmoid')
    ])

    model.compile(optimizer='adam',loss='binary_crossentropy',metrics=['accuracy'])

    model.fit(X_train,y_train,epochs=20,batch_size=32,verbose=1)

    loss, accuracy = model.evaluate(X_test, y_test, verbose=0)
    print(f"Precision con el conjunto de prueba {accuracy:.2f}")

    nuevo_dato = np.array([[0.9,0.8,0.1]])
    prediccion = model.predict(nuevo_dato)

    print(f"Prediccion para {nuevo_dato}: {prediccion}")
train_nn(X,y)



















