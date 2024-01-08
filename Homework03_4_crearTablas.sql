DROP DATABASE IF EXISTS henry_m3;
CREATE DATABASE henry_m3;

/*sql
LOAD DATA LOCAL INFILE ‘archivo’
CHARACTER SET 
IGNORE
FIELDS TERMINATED BY ‘;’ ENCLOSED BY ‘»‘
LINES STARTING BY » TERMINATES BY »
IGNORE 1 LINES
(field1, field2, field3, @field4)
*/

-- Ruta de origen

-- SELECT @@global.secure_file_priv; -- 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'


-- Para cargar datos en una tabla primero hay que crear la tabla  SOLO ARCHIVOS CSV	
/*
CREATE TABLE nombre (
	Columna1 Varchar(80)
	);*/


/*
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Nombre.csv'
INTO TABLE nombre
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(columna1, columna2, columna3, ...)
;
*/

USE henry_m3;

CREATE TABLE Sucursal (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Sucursal VARCHAR(40),
    Direccion VARCHAR(50),
    Localidad VARCHAR(40),
    Provincia VARCHAR(40),
    Latitud VARCHAR(40),
    Longitud VARCHAR(40)
    );
    
CREATE TABLE CanalDeVentas (
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(40)
    );
    
CREATE TABLE Productos (
	ID_Producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Concepto VARCHAR(200),
    Tipo VARCHAR(200),
    Precio DECIMAL(15,2)
    );

CREATE TABLE Proveedores ( 
	IdProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40),
    Address VARCHAR(40),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    Departmen VARCHAR(40)
    );
    
CREATE TABLE Empleados ( 
	ID_Empleados INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Apellido VARCHAR(40),
    Nombre VARCHAR(40),
    Sucursal VARCHAR(40),
    Sector VARCHAR(40),
    Cargo VARCHAR(40),
    Salario DECIMAL(9,2)
    );
    
CREATE TABLE Compra ( 
	IdCompra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    IdProducto INT,
    Cantidad INT,
    Precio DECIMAL(9,2),
    IdProveedor INT,
    FOREIGN KEY(IdProducto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY(IdProveedor) REFERENCES Proveedores(IdProveedor)
    );
    
CREATE TABLE Clientes ( 
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Provincia VARCHAR(40),
    Nombre_y_Apellido VARCHAR(200),
    Domicilio VARCHAR(200),
    Telefono VARCHAR(40),
    Edad INT,
    Localidad VARCHAR(200),
    X VARCHAR(40),
    Y VARCHAR(40),
    Fecha_Alta DATE,
    Usuario_Alta VARCHAR(40),
    Fecha_Ultima_Modificacion DATE,
    Usuario_Ultima_Modificacion VARCHAR(40),
    Marca_Baja INT,
    Col10 VARCHAR(40)
    );

CREATE TABLE TipoDeGasto ( 
	IdTipoGasto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(40),
    Monto_Aproximado DECIMAL(9,2)
    );
    
CREATE TABLE Gasto ( 
	IdGasto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdSucursal INT,
    IdTipoGasto INT,
    Fecha DATE,
    Monto DECIMAL(9,2),
    FOREIGN KEY(IdSucursal) REFERENCES Sucursal(ID),
    FOREIGN KEY(IdTipoGasto) REFERENCES TipoDeGasto(IdTipoGasto)
    );
    
CREATE TABLE Ventas ( 
	IdVenta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE,
    Fecha_entrega DATE,
    IdCanal INT,
    IdCliente INT,
    IdSucursal INT,
    IdEmpleado INT,
    IdProducto INT,
    Precio DECIMAL(15,2),
    Cantidad INT,
    FOREIGN KEY(IdCanal) REFERENCES CanalDeVentas(Codigo),
    FOREIGN KEY(IdCliente) REFERENCES Clientes(ID),
    FOREIGN KEY(IdSucursal) REFERENCES Sucursal(ID),
    FOREIGN KEY(IdEmpleado) REFERENCES Empleados(ID_Empleados),
    FOREIGN KEY(IdProducto) REFERENCES Productos(ID_Producto)
    );
    
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sucursales.csv'
INTO TABLE Sucursal
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(ID, Sucursal, Direccion, Localidad, Provincia, Latitud, Longitud)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\CanalDeVenta.csv'
INTO TABLE CanalDeVentas
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(Codigo, Descripcion)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PRODUCTOS.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(ID_Producto, Concepto, Tipo, Precio )
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Proveedores.csv'
INTO TABLE Proveedores
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(IdProveedor, Nombre, Address, City, State, Country, Departmen)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Empleados.csv'
INTO TABLE Empleados
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(ID_Empleados, Apellido, Nombre, Sucursal, Sector, Cargo, Salario)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\compra.csv'
INTO TABLE compra
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(IdCompra, Fecha, IdProducto, Cantidad, Precio, IdProveedor)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Clientes.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(ID, Provincia, Nombre_y_Apellido, Domicilio, Telefono, Edad, Localidad, X, Y, Fecha_alta, Usuario_alta, Fecha_ultima_modificacion, Usuario_ultima_modificacion, Marca_baja, col10)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\TiposDeGasto.csv'
INTO TABLE TipoDeGasto
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(IDTipoGasto, Descripcion, Monto_aproximado)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Gasto.csv'
INTO TABLE Gasto
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(IdGasto, IdSucursal, IdTipoGasto, Fecha, Monto)
;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Venta.csv'
INTO TABLE Ventas
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''   -- COMO ESTAN SEPARADAS LAS COLUMNAS, FIELDS -> COLUMNAS
LINES TERMINATED BY '\n' -- LAS LINEAS SE SEPARAN CON UN SALTO DE LINEA
IGNORE 1 LINES -- SE SALTEA EL ENCABEZADO
(IdVenta, Fecha, Fecha_entrega, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad)
;







