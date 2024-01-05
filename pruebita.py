import pandas as pd

# Crear un DataFrame de ejemplo
data = {'Nombre': ['Juan', 'María', 'Pedro'],
        'Edad': [25, 30, 35],
        'Altura': [1.75, 1.65, 1.80]}
df = pd.DataFrame(data)

# Obtener el uso de memoria antes de la conversión
memoria_antes = df.memory_usage().sum()

# Aplicar convert_dtypes al DataFrame
df = df.convert_dtypes()

# Obtener el uso de memoria después de la conversión
memoria_despues = df.memory_usage().sum()

print(f"Uso de memoria antes de la conversión: {memoria_antes} bytes")
print(f"Uso de memoria después de la conversión: {memoria_despues} bytes")