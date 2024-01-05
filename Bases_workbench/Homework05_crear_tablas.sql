CREATE DATABASE Henry;

USE Henry;

CREATE TABLE Carrera (
IdCarrera INT NOT NULL PRIMARY KEY, 
Nombre VARCHAR(40)
);

CREATE TABLE Cohorte (
IdCohorte INT NOT NULL PRIMARY KEY, 
Codigo VARCHAR(40), 
Carrera INT, 
Fecha_Inicio DATE, 
Fecha_Finalización DATE, 
Instructor INT,
FOREIGN KEY(Carrera) REFERENCES Carrera(IdCarrera),
FOREIGN KEY(Instructor) REFERENCES Instructor(IdInstructor)
);

CREATE TABLE Instructor (
IdInstructor INT NOT NULL PRIMARY KEY, 
Cedula_Identidad VARCHAR(30), 
Nombre VARCHAR(40), 
Apellido VARCHAR(40), 
Fecha_Nacimiento DATE, 
Fecha_Incorporación DATE
);

CREATE TABLE Alumnos (
IdAlumno INT NOT NULL PRIMARY KEY, 
Cedula_Identidad VARCHAR(30), 
Nombre VARCHAR(40), 
Apellido VARCHAR(40), 
Fecha_Nacimiento DATE, 
Fecha_Ingreso DATE, 
Cohorte INT,
FOREIGN KEY(Cohorte) REFERENCES Cohorte(IdCohorte)
);