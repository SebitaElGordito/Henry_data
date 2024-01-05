import pandas as pd

wine_reviews = pd.read_csv(r'C:\Users\Cebol\OneDrive\Escritorio\Henry_data\wine_reviews.csv')

print(wine_reviews.dtypes)

# Obtener el uso de memoria antes de la conversión
memoria_antes = wine_reviews.memory_usage().cumsum()

# Aplicar convert_dtypes al DataFrame
wine_reviews = wine_reviews.convert_dtypes()
print()
print()

print(wine_reviews.dtypes)

# Obtener el uso de memoria después de la conversión
memoria_despues = wine_reviews.memory_usage().cumsum()

print(f"Uso de memoria antes de la conversión: {memoria_antes.tail(1)} bytes")
print(f"Uso de memoria después de la conversión: {memoria_despues.tail(1)} bytes")
