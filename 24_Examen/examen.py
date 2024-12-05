import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from keras import Sequential
from keras.src.layers import Dense
from sklearn.model_selection import train_test_split

#Generando los datos
np.random.seed(10)
    
X = np.random.choice([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9],size=(2000,3))
print(X)
y= []
targets = []
#Si el promedio del historial de pagos e ingresos mensuales es mayor a 0.8 la clase 
y1 = [((X[:,0]+X[:,1])/2 >= 0.7).astype(int), ((X[:,0]+X[:,1])/2 > 0.4).astype(int),((X[:,0]+X[:,1])/2 < 0.7).astype(int), ((X[:,0]+X[:,1])/2 <= 0.4).astype(int)]
y2 = [ (X[:,2]<= 0.4).astype(int),  (X[:,2] > 0.4).astype(int),(X[:,2] < 0.7).astype(int), (X[:,2] >= 0.7).astype(int)]


for i in range(len(y1[0])):
   y.append([])
   if (y1[0][i] == 1 and y2[0][i] == 1) or (y1[0][i] == 1 and (y2[1][i] + y2[2][i]) == 2):
       y[i].append(1)
   else:
       y[i].append(0)
   if (y1[0][i] == 1 and y2[3][i] == 1) or ((y1[1][i] + y1[2][i]) == 2 and (y2[1][i] + y2[2][i]) == 2) or ((y1[1][i] + y1[2][i]) == 2 and y2[0][i] == 1):
       y[i].append(1)
   else: 
        y[i].append(0)
   if (y1[3][i] == 1 and y2[0][i] == 1) or (y1[3][i] == 1 and (y2[1][i] + y2[2][i]) == 2) or (y1[3][i] == 1 and y2[3][i] == 1):
       y[i].append(1)
   else:
        y[i].append(0)
   
for i in y: 
    if i[0] == 1:
        targets.append(-1)
    elif i[1] == 1:
        targets.append(0)
    else:
        targets.append(1)




file_path = "./24_Examen/datos.csv"



f = open(file_path, 'w')
for i in range(len(X)):
   row = str(X[i])
   row = row.removeprefix('[')
   row = row.removesuffix(']')
   row = row.replace(" ",", ")
   f.write(row+","+str(targets[i])+"\n")

   
def graficar_datos():
    file_path = './24_Examen/datos.csv'

    df = pd.read_csv(file_path, header=None, names=['HP', 'IM', 'RDI', 'target'], dtype=float)
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

def train_nn():
    file_path = './24_Examen/datos.csv'

    dataset = pd.read_csv(file_path, header=None, names=['HP', 'IM', 'RDI', 'target'], dtype=float)

    X = dataset.iloc[:,:3 ] # Las tres primeras columnas son las características
    y = dataset.iloc[:, 3]   # La cuarta columna es la etiqueta

    X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2,random_state=42)

    model = Sequential([
        Dense(4,input_dim='2',activation='tanh'),
        Dense(1,activation='sigmoid')
    ])

    model.compile(optimizer='adam',loss='binary_crossentropy',metrics=['accuracy'])

    model.fit(X_train,y_train,epochs=20,batch_size=32,verbose=1)

    loss, accuracy = model.evaluate(X_test, y_test, verbose=0)
    print(f"Precision con el conjunto de prueba {accuracy:.2f}")

    nuevo_dato = np.array([[0.9,0.8,0.1]])
    prediccion = model.predict(nuevo_dato)

    print(f"Prediccion para {nuevo_dato}: {prediccion[0][0]:.2f}")

graficar_datos()


















