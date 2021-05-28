--Una empresa almacena la información de sus empleados en dos tablas llamadas 'empleados' y 'secciones'.  
--Eliminamos las tablas, si existen:

DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;
DROP TABLE IF EXISTS secciones, empleados;

--1. Creamos las tablas.

create table secciones (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    sueldo DECIMAL(5,2),
    PRIMARY KEY (codigo)
);

create table empleados (
    legajo INT NOT NULL AUTO_INCREMENT,
    documento CHAR(8),
    sexo CHAR(1),
    apellido VARCHAR(40),
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    seccion INT NOT NULL,
    cantidadhijos INT,
    estadocivil CHAR(10),
    fechaingreso DATE,
    PRIMARY KEY (legajo)
);


--2. Ingresamos algunos registros.

INSERT INTO secciones VALUES (1,"Administracion",300);
INSERT INTO secciones VALUES (2,"Contaduria",400);
INSERT INTO secciones VALUES (3,"Sistemas",500);

INSERT INTO empleados VALUES (1,"22222222","f","Lopez","Ana","Colon 123",1,2,"casado",'1990-10-10');
INSERT INTO empleados VALUES (2,"23333333","m","Lopez","Luis","Sucre 235",1,0,"soltero",'1990-02-10');
INSERT INTO empleados VALUES (3,"24444444","m","Garcia","Marcos","Sarmiento 1234",2,3,"divorciado",'1998-07-12');
INSERT INTO empleados VALUES (4,"25555555","m","Gomez","Pablo","Bulnes 321",3,2,"casado",'1998-10-09');
INSERT INTO empleados VALUES (5,"26666666","f","Perez","Laura","Peru 1254",3,3,"casado",'2000-05-09');

--3. Eliminamos la vista 'vista_empleados' si existe.

drop view if exists vista_empleados;

--4. Creamos la vista 'vista_empleados', que es resultado de una combinación en la cual se muestran 4 campos.

create VIEW vista_empleados as
    select documento, nombre, apellido, cantidadhijos from empleados;

--5. Vemos la información de la vista.

select * from vista_empleados;

--6. Crear una nueva vista basada en la vista "vista_empleados" que nos retorne todos los empleados que tienen hijos (la borramos si ya existía).

create VIEW vista_empleados_con_hijos as
    select documento, nombre, cantidadhijos from vista_empleados where cantidadhijos > 0;

--7. Vemos la información que suministra la vista `vista_empleados_con_hijos`.

select * from vista_empleados_con_hijos;
