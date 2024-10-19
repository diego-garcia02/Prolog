import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
 
 # Cargar los datos desde el CSV
df = pd.read_csv('./19_Graficas/testphaser5.csv', header=None, names=['x1', 'x2', 'target'], dtype=float )
 
 # Crear la figura
fig = plt.figure()
 
 # Agregar un subplot 3D
ax = fig.add_subplot(111, projection='3d')
 
 # Graficar los puntos tridimensionales
ax.scatter(df['x1'], df['x2'], df['target'], c='r', marker='o')
 
 # Etiquetas de los ejes
ax.set_xlabel('x1')
ax.set_ylabel('x2')
ax.set_zlabel('Target')
 
 # Mostrar el gráfico
plt.show()
