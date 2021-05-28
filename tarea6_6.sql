-- Una empresa almacena los datos de sus empleados en una tabla llamada `empleados`.

-- 1- Eliminamos la tabla, si existe y la creamos.

drop table if exists empleados;

create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
 );

-- 2- Ingrese algunos registros.

 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

-- 3- Elimine el procedimiento llamado `pa_seccion` si existe:

drop procedure if exists pa_seccion;

-- 4- Cree un procedimiento almacenado llamado `pa_seccion` al cual le enviamos el nombre de una sección y que nos retorne el promedio de sueldos de todos los empleados de esa sección y el valor mayor de sueldo (de esa sección)

create procedure pa_seccion
  @seccion varchar(20)='%',
  @promedio decimal(6,2) output,
  @mayor decimal(6,2) output
 as
  select @promedio=avg(sueldo)
   from empleados
   where seccion like @seccion
  select @mayor=max(sueldo)
   from empleados
    where seccion like @seccion;

-- 5- Ejecute el procedimiento creado anteriormente con distintos valores.

declare @p decimal(6,2), @m decimal(6,2)
 execute pa_seccion 'Contaduria', @p output, @m output
 select @p as promedio, @m as mayor

 execute pa_seccion 'Secretaria', @p output, @m output
 select @p as promedio, @m as mayor;

 declare @p decimal(6,2), @m decimal(6,2)
 execute pa_seccion @promedio=@p output,@mayor= @m output
 select @p as promedio, @m as mayor;
