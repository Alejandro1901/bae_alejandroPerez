--Una empresa almacena la información de sus empleados en dos tablas llamadas 'empleados' y 'secciones'.  
--Eliminamos las tablas, si existen:

 drop table if exists empleados;
 drop table if exists secciones;

--1. Creamos las tablas.

create table secciones(
  codigo int(2) not null,
  nombre varchar2(20),
  sueldo decimal(5,2)
  constraint PK_secciones primary key (codigo)
 );

 create table empleados(
  legajo int not null,
  documento char(8),
  sexo char(1),
  constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar2(40),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion int not null,
  cantidadhijos int,
  estadocivil char(10),
  constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso date,
  constraint PK_empleados primary key (legajo),

  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo),
  constraint UQ_empleados_documento
   unique(documento)
);

--2. Ingresamos algunos registros.

 insert into secciones values(1,'Administracion',300.00);
 insert into secciones values(2,'Contaduría',400.00);
 insert into secciones values(3,'Sistemas',500.00);

 insert into empleados values(1,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
 insert into empleados values(2,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
 insert into empleados values(3,'24444444', 'm', 'Garcia', 'Marcos', 'Sarmiento 1234', 2, 3, 'divorciado', '1998-07-12');
 insert into empleados values(4,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
 insert into empleados values(5,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');

--3. Eliminamos la vista 'vista_empleados' si existe.

drop view if exists vista_empleados;

--4. Creamos la vista 'vista_empleados', que es resultado de una combinación en la cual se muestran 4 campos.

create view vista_empleados as
  select (apellido||' '||e.nombre) as nombre,
   s.nombre as seccion, cantidadhijos
   from empleados e
   join secciones s
   on codigo=seccion;

--5. Vemos la información de la vista.

 select *from vista_empleados;

--6. Realizamos una consulta a la vista como si se tratara de una tabla.
 
 select seccion,count(*) as cantidad
  from vista_empleados
  group by seccion;


--7. Eliminamos la vista 'vista_empleados_ingreso' si existe.

drop view if exists vista_empleados_ingreso;

--8. Creamos otra vista de 'empleados' denominada 'vista_empleados_ingreso' que almacena la cantidad de empleados por año.

create view vista_empleados_ingreso (fecha,cantidad)
  as
  select extract(year from fechaingreso),count(*)
   from empleados
   group by extract(year from fechaingreso);

--9. Vemos la información que suministra la vista.

 select * from vista_empleados_ingreso;