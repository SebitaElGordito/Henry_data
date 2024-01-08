import pandas as pd
import pymysql
import csv

db_Sucursal = pd.read_csv(r'C:\Users\Cebol\OneDrive\Escritorio\Henry_data\CSV_Homework03_4\Sucursales.csv')



conexion = pymysql.connect(
    host = "localhost", 
    database = "henry_m3",
    user = "root",
    password = "root1234"
)

cursor = conexion.cursor()

for index, row in db_Sucursal.iterrows():
    values = (
        row['ID'],
        row['Sucursal'],
        row['Direccion'],
        row['Localidad'],
        row['Provincia'],
        row['Latitud'],
        row['Longitud']
    )

cursor.execute('INSERT INTO Sucursal (ID, Sucursal, Direccion, Localidad, Provincia, Latitud, Longitud) VALUES(%s,%s,%s,%s,%s,ST_PointFromText(%s),ST_PointFromText(%s))', values)

cursor.commit()

conexion.close()


db_CanalDeVentas = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\CanalDeVentas.csv')

conexion = pymysql.connect(
    host = "localhost", 
    database = "henry_m3",
    user = "root",
    password = "root1234"
)

cursor = conexion.cursor()

cursor.execute('INSERT INTO Sucursal (ID, Sucursal, Direccion, Localidad, Provincia, Latitud, Longitud) VALUES(%s,%s,%s,%s,%s,%s,%s)')

conexion.close()







db_Productos = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Productos.csv')
db_Proveedores = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Proveedores.csv')
db_Empleados = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Empleados.csv')
db_Venta = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Venta.csv')
db_Compra = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Compra.csv')
db_Clientes = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Clientes.csv')
db_Gasto = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Gasto.csv')
db_TipoDeGasto = pd.read_csv('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\TipoDeGasto.csv')


conexion = pymysql.connect(
    host = "localhost", 
    database = "henry_m3",
    user = "root",
    password = "root1234"
)