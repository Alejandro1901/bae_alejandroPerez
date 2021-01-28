-- Se dispone de la tabla ALUMNOS con los datos de aquellos alumnos matriculados en un instituto. Realizar las siguientes consultas SQL:

--1. Muestra todos los datos de todos los alumnos.

select * from alumnos;

--2. Muestra el nombre , localidad y fecha de nacimiento de todos los alumnos.

select nombre, localidad, fecha_nac from alumnos;

--3. Muestra el nombre de todos los alumnos. En el resultado de la consulta, la columna “Nombre” debe aparecer con la etiqueta “Nombre y apellidos” (ALIAS DE COLUMNAS).

select nombre as 'Nombre y apellidos' from alumnos;

--5. Consulta los datos de los alumnos que son de Lorca.

select nombre, faltas, (faltas * 2) as 'Faltas de asistencia' from alumnos;

--4. Obtén el nombre y el número de faltas multiplicado por 2 de todos los alumnos (COLUMNAS CALCULADAS). En el resultado de la consulta, la columna faltas debe aparecer con la etiqueta “Faltas de asistencia” (ALIAS DE COLUMNAS)

select * from alumnos where localidad = 'Lorca';

--6. Obtén los datos de los alumnos que son de Murcia o Alhama de Murcia.

select * from  alumnos  where localidad = 'Murcia' or localidad = 'Alhama de Murcia';

--7. Obtén los datos de los alumnos que son de Murcia y están en el primer curso de E.S.O.

select * from  alumnos  where localidad = 'Murcia' and curso = '1' and nivel = 'ESO';

--8. Muestra los alumnos que son de Lorca, están en segundo curso de Bachillerato y tienen más de 10 faltas.

select * from  alumnos  where localidad = 'Lorca' and curso = '2' and nivel = 'Bachillerato' and faltas = '10';

--9. Obtén los datos de aquellos alumnos que son de Murcia ordenados por nombre.

select * from  alumnos  where localidad = 'Murcia' order by nombre;

--10. Obtén los datos de todos los alumnos ordenados por nivel, y dentro de cada nivel por curso.

select * from  alumnos  order by nivel, curso;

--11. Muestra los datos de aquellos alumnos que tengan más de 10 faltas en primer o segundo curso.

select * from  alumnos  where faltas > '10' and curso in ('1', '2');

--12. Muestra los datos de todos aquellos alumnos que tengan menos de 10 faltas en 3o o 4o curso y además sean de Murcia.

select * from  alumnos  where  faltas  < 10 and curso in ('3', '4') and localidad = 'Murcia';

--13. Obtén con una consulta todos los cursos que hay sin repeticiones (distinct).

select distinct curso from  alumnos;

--14. Obtén los datos de los alumnos que no tengan 10 faltas en 1o de E.S.O.

select * from  alumnos  where faltas < '10' and  nivel  = 'ESO' and curso = '1';

--15. Muestra los datos de aquellos alumnos cuyo nombre empiece por la letra 'B'.

select * from  alumnos  where nombre like 'B%';

--16. Con una consulta obtén los alumnos que son de Murcia y cuyo nombre termina con una letra 'O'.

select * from  alumnos  where localidad = 'Murcia' and nombre like '%O';

--17. Muestra los datos de todos aquellos alumnos que están en 1o curso de E.S.O. Y tienen una letra 'U' en la segunda posición del nombre.

select * from  alumnos  where curso = '1' and nivel = 'ESO' and nombre like '_u%';

--18. Obtén los datos de los alumnos cuya columna “Faltas” es nula.

select * from  alumnos  where faltas is null;

--19. Muestra los datos de aquellos alumnos que tienen entre 10 y 20 faltas (between). Ordena el resultado por nombre.

select * from  alumnos  where faltas between '10' and '20' order by nombre;
--20. Muestra los datos de los alumnos que tienen entre 10 y 20 faltas y además son de Murcia.

select * from  alumnos  where localidad = 'Murcia' and faltas between '10' and '20';

--21. Muestra los datos de los alumnos que tienen entre 10 y 20 faltas, son de Murcia y están matriculados en 1o de E.S.O.

select * from  alumnos  where curso = '1' and nivel = 'ESO' and localidad = 'Murcia' and faltas between '10' and '20';

--22. Con una consulta muestra los datos de los alumnos cuyas faltas sean menores que 10 y mayores que 20.

select * from alumnos where faltas < '10' and faltas > '20';

--23. Muestra los datos de los alumnos cuya fecha de nacimiento comprenda los años 1993 y 1994. Ordena el resultado por nombre.

select * from alumnos where fecha_nac between '1993-01-12' and '1994-12-31' order by nombre;

--24. Muestra los datos de los alumnos que sean de primer o segundo curso (no importa que sean de E.S.O. O Bachiller). Utiliza el operador in.

select * from  alumnos  where curso in ('1', '2');

--25. Obtén los datos de aquellos alumnos que sean de tercer o cuarto curso y sean de Murcia. Utiliza el operador in.

select * from  alumnos  where curso in ('3', '4') and localidad = 'Murcia';

--26. Muestra los datos de los alumnos que no sean de E.S.O, ordenados por curso y por nombre descendentemente. Utiliza el operador in.

select * from  alumnos where nivel = 'Bachiller' order by curso desc, nombre desc;

--27. Muestra los datos de los alumnos que sean de primer o segundo curso y no sean de Bachiller. Ordena el resultado por nombre.

select * from  alumnos  where nivel = 'ESO' and curso in('1','2') order by nombre;

--28. Obtén los datos de los alumnos cuyo nombre empiece por la letra 'J', que tengan más de 10 faltas y no sean de Bachiller. Ordena el resultado por curso, y dentro de cada curso, por nombre.

select * from  alumnos  where nombre like 'J%' and faltas > '10' and nivel = 'ESO' order by curso, nombre;

--29. Con una consulta obtén el expediente, nombre, curso y nivel de todos los alumnos ordenado por curso, nivel ascendentemente y nombre descendentemente cuyo nivel no sea 'BACHILLER'.

select expediente, nombre, curso, nivel from  alumnos  where nivel = 'ESO' order by curso, nivel asc, nombre desc;

--30. Con una consulta obtén el nombre de cada alumno en mayúscula cuya localidad sea Murcia.

select upper(nombre), localidad from  alumnos  where localidad = 'Murcia';

--31. Muestra el nombre de cada alumno en mayúscula y la localidad a la que pertenecen en minúscula, ordenados por localidad.

select upper(nombre), lower(localidad) from  alumnos  order by localidad desc;

--32. Con una consulta concatena el nombre de cada alumno y la localidad y sustituye 'BACHILLER' por 'Bachillerato'.

select concat(nombre, localidad) ,REPLACE(nivel,'Bachiller', 'Bachillerato') as nivel from alumnos;

--33. Con una consulta obtén el nombre de cada alumno y la longitud de la cadena “Nombre”.

select nombre, length(nombre)from alumnos;

--34. Con una consulta obtén el nombre, año de nacimiento y mes de nacimiento de cada uno de los alumnos.

select nombre, month(fecha_nac), year(fecha_nac)from alumnos;

--35. Con una consulta muestra el nombre y edad de cada uno de los alumnos (la edad se calcula restando al año de nacimiento 2008)

select nombre, 2008-year(fecha_nac) as edad from alumnos;
