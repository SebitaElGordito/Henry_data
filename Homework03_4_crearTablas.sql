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

SELECT @@global.secure_file_priv; -- 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'


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
    Sucursal VARCHAR(30),
    Direccion VARCHAR(40),
    Localidad VARCHAR(30),
    Provincia VARCHAR(30),
    Latitud POINT,
    Longitud POINT
    );
    
CREATE TABLE CanalDeVentas (
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(40)
    );
    
CREATE TABLE Productos (
	ID_Producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Concepto VARCHAR(40),
    Tipo VARCHAR(30),
    Precio DECIMAL(9,2)
    );

CREATE TABLE Proveedores ( 
	IdProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30),
    Address VARCHAR(40),
    City VARCHAR(30),
    State VARCHAR(30),
    Country VARCHAR(30),
    Departmen VARCHAR(30)
    );
    
CREATE TABLE Empleados ( 
	ID_Empleados INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Apellido VARCHAR(30),
    Nombre VARCHAR(30),
    Sucursal VARCHAR(30),
    Sector VARCHAR(30),
    Cargo VARCHAR(30),
    Salario DECIMAL(9,2)
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
    Precio DECIMAL(9,2),
    Cantidad INT,
    FOREIGN KEY(IdCanal) REFERENCES CanalDeVentas(Codigo),
    FOREIGN KEY(IdCliente) REFERENCES Clientes(ID),
    FOREIGN KEY(IdSucursal) REFERENCES Sucursal(ID),
    FOREIGN KEY(IdEmpleado) REFERENCES Empleados(ID_Empleados),
    FOREIGN KEY(IdProducto) REFERENCES Productos(ID_Producto)
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
    Provincia VARCHAR(30),
    Nombre_y_Apellido VARCHAR(50),
    Domicilio VARCHAR(30),
    Telefono INT,
    Edad INT,
    Localidad VARCHAR(30),
    X POINT,
    Y POINT,
    Fecha_Alta DATE,
    Usuario_Alta VARCHAR(30),
    Fecha_Ultima_Modificacion DATE,
    Usuario_Ultima_Modificacion VARCHAR(30),
    Marca_Baja INT,
    Col10 VARCHAR(30)
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

CREATE TABLE TipoDeGasto ( 
	IdTipoGasto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(40),
    Monto_Aproximado DECIMAL(9,2)
    );
    
    
