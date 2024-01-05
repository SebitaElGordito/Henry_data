import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

wine_reviews = pd.read_csv(r'C:\Users\Cebol\OneDrive\Escritorio\Henry_data\wine_reviews.csv')

print(wine_reviews)

#2 ¿Cuántas columnas (features) tiene?¿Cuáles son sus nombres?¿Y cuántas filas (instancias)? Luego, descartar la columna `'Unnamed: 0'`.

wine_reviews.info()
print()
print("El DataFrame tiene un total de 14 columnas")
print()
print("Los nombres de las columnas son: ")
print(wine_reviews.columns)
print()
print("...y tiene un total de 129971 filas")
print()


del wine_reviews["Unnamed: 0"]
print(wine_reviews.shape)
print()
print()

3# ¿Cuántos valores faltantes hay en cada columna?

print()
numero_filas = 129971
cantidad_datos_Nan = numero_filas - wine_reviews.count()
print("Hay un total de 204752 valores faltantes, siendo los valores en cada columna de... ")
print(cantidad_datos_Nan)
print()
print()

#4 ¿Cuál o cuáles son los vinos con más valores faltantes?

vinos_valores_faltantes = wine_reviews.groupby('variety').apply(lambda x: x.isnull().sum().sum())
vinos_valores_faltantes_ordenados = vinos_valores_faltantes.sort_values(ascending=False).head(5)
print("Estos son los 5 vinos, agrupados por su variedad, con mayor cantidad de valores faltantes.")
print(vinos_valores_faltantes_ordenados)
print()
print()

#5 Hacerse alguna pregunta acerca del dataset e intentar responderla. Por ejemplo, ¿cuáles son el peor y el mejor vino? Imprimir en pantalla sus características y su descripción. 
# ¿Hay un solo vino que sea el mejor o el peor?


variedad_vinos = wine_reviews[["variety", "points"]].groupby("variety").mean("points")

variedad_vinos_mejor= variedad_vinos.sort_values("points", ascending=False).head(3)
variedad_vinos_peor= variedad_vinos.sort_values("points", ascending=False).tail(3)

mejor_variedad = variedad_vinos_mejor.index[0]  # Nombre de la variedad
mejor_puntuacion = variedad_vinos_mejor['points'].iloc[0]  # Puntuación
print(f"Mejor variedad: {mejor_variedad}, Puntuación: {mejor_puntuacion}")
print()

peor_variedad = variedad_vinos_peor.index[0]  # Nombre de la variedad
peor_puntuacion = variedad_vinos_peor['points'].iloc[0]  # Puntuación
print(f"Peor variedad: {peor_variedad}, Puntuación: {peor_puntuacion}")
print()


carac_mejor_vino = wine_reviews[wine_reviews['variety'] == mejor_variedad][["description", "title"]]

print(carac_mejor_vino)
print()

carac_peor_vino = wine_reviews[wine_reviews['variety'] == peor_variedad][["description", "title"]]

print(carac_peor_vino)

mejor_vino = variedad_vinos_mejor.size
print(mejor_vino)






