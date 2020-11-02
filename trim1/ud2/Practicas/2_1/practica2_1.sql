CREATE DATABASE bd_centro;
USE bd_centro;
CREATE TABLE ALUMNOS;
(
dni VARCHAR(9)
[CONSTRAINT KEY]
[PRIMARY KEY]
nombre VARCHAR(10)
apellido1 VARCHAR(15)
apellido2 VARCHAR(15)
direccion VARCHAR(30)
sexo char(1)
   constraint centro_sexo check (sexo in ('V','H')),
fecha_nacimiento DATE
curso: curso en el que se matricula
);
CREATE TABLE CURSOS;
(
nombre VARCHAR(10)
codigo VARCHAR(5)
dni_profesor VARCHAR(9)
[CONSTRAINT KEY]
[PRIMARY KEY]
[FOREIGN KEY]
maximo_alumnos VARCHAR(3)
fecha_Inicio DATE
fecha_fin DATE
horas VARCHAR(3)
);
CREATE TABLE PROFESORES
(
dni VARCHAR(9)
[CONSTRAINT KEY]
[PRIMARY KEY]
[FOREIGN KEY]
nombre VARCHAR(10)
apellido1(15)
apellido2(15)
direccion(30)
salario ROUND(2.3,2)
)
