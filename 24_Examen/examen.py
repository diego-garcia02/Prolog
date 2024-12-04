import numpy as np
import pandas as pd
import matplotlib as plt
from tensorflow.python.keras.models import Sequential
from tensorflow.python.keras.layers import Dense
from sklearn.model_selection import train_test_split

#Generando los datos
np.random.seed(0)
X = np.random.rand(1000,3)
#Si el promedio del historial de pagos e ingresos mensuales es mayor a 0.7
y = [((X[:,0] + X[:,1])/2 > 0.8).astype(int),(X[:,2] < 0.3).astype(int),((X[:,0] + X[:,1])/2 < 0.8).astype(int), (X[:,0] + X[:,1])/2 > 0.4 and X[:,2] < 0.7 and X[:,2] > 0.3).any(), 
((X[:,0]+X[:,1])/2 < 0.4 and X[:,2] > 0.7).any()]

print(y)



def graficar_datos():
    file_path = 'C://Prolog//24_Examen//datos.csv'

    df = pd.read_csv(file_path, header=None, names=['Historial de pagos', 'Ingresos mensuales', 'Relación deuda-ingreso', 'Target'], dtype=float)
    # Crear la figura 3D
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    # Graficar puntos con target=0
    ax.scatter(df[df['target'][0] == 0][''], df[df['target'] == 0]['x2'], df[df['target'] == 0]['target'],
            c='blue', marker='o', label='target=0')
    # Graficar puntos con target=1
    ax.scatter(df[df['target'] == 1]['x1'], df[df['target'] == 1]['x2'], df[df['target'] == 1]['target'],
            c='red', marker='x', label='target=1')
    # Etiquetas de los ejes
    ax.set_xlabel('x1')
    ax.set_ylabel('x2')
    ax.set_zlabel('Target')
    # Mostrar leyenda
    ax.legend()
    # Mostrar el gráfico
    plt.show()






