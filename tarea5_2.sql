--Un club dicta clases de distintos deportes a sus socios. Guarda la información de sus socios en una tabla llamada "socios", los datos de los deportes en "deportes" y las inscipciones en "inscritos".

--1- Elimine las 3 tablas, si existen.

  drop table if exists socios;

  drop table if exists deportes;

  drop table if exists inscriptos;

--2- Cree las tablas:
 
  create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  ao year,
 cuota char(1),
  primary key(documento,codigodeporte,ao)
 );

--3- Ingrese los siguientes registros:

 insert into socios values('22333444','Juan Pérez');
 insert into socios values('23333444','Ana Garcia');
 insert into socios values('24333444','Hector Fuentes');
 insert into socios values('25533444','Marta Molina');

--4- El club desea saber cuántos socios se han inscrito en cada deporte cada año, considerando sólo los deportes que tienen inscripciones:


--5- El club quiere almacenar esa información en una tabla. Elimine la tabla "inscritospordeporteporaño" si existe.

--6- Cree la tabla utilizando la sentencia del punto 4:


--7- Muestre todos los registros de la nueva tabla.

--8- El club desea saber cuántas veces se ha inscrito un socio en algún deporte:


--9- Elimine la tabla "sociosdeporte" si existe.

--10- Guarde la información del punto 8 en una tabla, creándola a partir de esa consulta:
