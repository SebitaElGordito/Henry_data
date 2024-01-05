import pandas as pd

df_accidentes = pd.read_csv(r'C:\Users\Cebol\OneDrive\Escritorio\Henry_data\DataSets\Nuclear_Incidents.csv')
print(df_accidentes.head(5))

registro_paises = df_accidentes[["Location ",'Numbers of Direct Deaths', 'Numbers of InDirect Deaths']].groupby('Location ').sum()
print(registro_paises)