import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from scipy import stats

#1. Considere el siguiente areglo que contiene la altura de un grupo de estudiantes de Henry y cálcule:

"""python
muestra = np.array( [[1.85, 1.8, 1.8 , 1.8],
                    [1.73,  1.7, 1.75, 1.76],
                    [ 1.65, 1.69,  1.67 ,  1.6],
                    [1.54,  1.57, 1.58, 1.59],
                    [ 1.4 , 1.42,  1.45, 1.48]]) 

- Media.
- Mediana.
- Moda
- Varianza
- Desvío estándar."""

muestra = np.array( [[1.85, 1.8, 1.8 , 1.8],
                    [1.73,  1.7, 1.75, 1.76],
                    [ 1.65, 1.69,  1.67 ,  1.6],
                    [1.54,  1.57, 1.58, 1.59],
                    [ 1.4 , 1.42,  1.45, 1.48]]) 

# Media:
media= muestra.mean()
print("La media es:", media)


# Mediana:
mediana = np.median(muestra)
print("La mediana es:", mediana)
 

#Moda:
def calcular_moda(muestra):
    # Convertir el array de numpy a una lista plana
    muestra_lista = muestra.flatten().tolist()
    
    # Crear un diccionario para contar la frecuencia de cada elemento
    frecuencia = {}
    for elemento in muestra_lista:
        if elemento in frecuencia:
            frecuencia[elemento] += 1
        else:
            frecuencia[elemento] = 1
    
    # Encontrar el elemento con la mayor frecuencia
    moda = max(frecuencia, key=frecuencia.get)
    
    return moda

moda = calcular_moda(muestra)
print("La moda es:", moda)


#Varianza
varianza = round(np.var(muestra), 3)
print("La varianza es:", varianza)


#Desvío estandar
desvio_std = round(np.std(muestra), 3)
print("El desvío estandar es:", desvio_std)



#2. Convierta el arreglo en una lista y realice un Histograma de 5 intervalos. ¿Tiene distribución normal?.

histo = muestra.flatten().tolist()

plt.hist(x=histo, bins=5, color='blue',rwidth=0.85)
plt.title('Histograma de la muestra')
plt.xlabel('Altura de alumnos(cm)')
plt.ylabel('Frecuencia')
plt.show()


#3. Utilizando pandas describa el dataframe.
df_muestra = pd.DataFrame([[1.85, 1.8, 1.8, 1.8], [1.73, 1.7, 1.75, 1.76], [1.65, 1.69, 1.67, 1.6], [1.54, 1.57, 1.58, 1.59], [1.4, 1.42, 1.45, 1.48]])
descripcion = df_muestra.describe()
print(descripcion)



muestra = [1.85, 1.8, 1.8, 1.8, 1.73, 1.7, 1.75, 1.76, 1.65, 1.69, 1.67, 1.6, 1.54, 1.57, 1.58, 1.59, 1.4, 1.42, 1.45, 1.48]

p_valor = stats.shapiro(muestra)[1]

if p_valor > 0.05:
    print("La muestra sigue una distribución normal según la prueba de Shapiro-Wilk y su valor es " + p_valor)
else:
    print("La muestra no sigue una distribución normal según la prueba de Shapiro-Wilk y su valor es " + p_valor)


#4. Con los siguientes datos construye un df y un array que permitan describir adecuadamente la muestra.<br>
#'Ingreso en miles' : 10.5	6.8	20.7	18.2	8.6	25.8	22.2	5.9	7.6	11.8 <br>
#'Años de estudio': 17	18	21	16	16	21	16	14	18	18 <br>


#5. Realice un histograma para de 6 secciones para 'Ingreso en miles' y 'Años de estudio'.