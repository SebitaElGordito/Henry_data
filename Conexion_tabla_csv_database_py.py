import pandas as pd
import pymysql

# Conexión a la base de datos
conexion = pymysql.connect(
    host = "localhost", 
    database = "henry_m3",
    user = "root",
    password = "root1234"
)
"""
Creación de una nueva base de datos, si no llega a existir.
cursor.execute("CREATE DATABASE henry_m3")"""

cursor = conexion.cursor()


#Crear tabla con archivos excel o csv
"""
Leer datos desde Excel
df = pd.read_excel('ruta/a/tu/archivo.xlsx')
            o
df = pd.read_csv('ruta/a/tu/archivo.csv')

# Conexión a la base de datos
conexion = pymysql.connect(
    host = "localhost", 
    database = "henry_m3",
    user = "root",
    password = "root1234"
)

# Insertar datos en la tabla
    cursor.execute('INSERT INTO nombre_tabla (nombre, categoria, direccion, barrio, comuna) VALUES(%s,%s,%s,%s,%s)'
            
"""



# Creación de una nueva tabla
sql = "CREATE TABLE employees (id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,branch_id BIGINT UNSIGNED,dni VARCHAR(20) UNIQUE,name VARCHAR(150),email VARCHAR(100),birth_date DATE,created_at TIMESTAMP NULL,updated_at TIMESTAMP NULL)"
cursor.execute(sql)

# commit para guardar los cambios
conexion.commit()

# Conexión a la base de datos finalizada
conexion.close()
