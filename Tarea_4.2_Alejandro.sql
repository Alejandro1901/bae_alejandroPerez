-- Realizar las siguientes consultas:

--1 Mostrar el apellido, oficio y número de departamento de cada empleado.

select apellido, dept_no, oficio from emple;

--2 Mostrar el número, nombre y localización de cada departamento.

select departamento_no, dnombre, loc from dept;

--3 Mostrar todos los datos de todos los empleados.

select * from emple;

--4 Datos de los empleados ordenados por apellidos.

select apellido from emple Order by apellido ASC;

--5 Datos de los empleados ordenados por número de departamento descendentemente.

select apellido,oficio,dir,fecha_alt,salario,comision,dept_no,emple_no from emple order by dept_no desc;

--6 Datos de los empleados ordenados por número de departamento descendentemente y dentro de cada departamento ordenados por apellido ascendentemente.

select apellido,oficio,dir,fecha_alt,salario,comision,dept_no,emp_no from emple order by dept_no desc;
select apellido,oficio,dir,fecha_alt,salario,comision,dept_no,emp_no from emple Order by apellido ASC;

--8 Mostrar los datos de los empleados cuyo salario sea mayor que 2000000.

select * from emple where salario > '2000000';

-- 9 Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.

select * from emple where oficio = 'Analista';

--10 Seleccionar el apellido y oficio de los empleados del departamento número 20.

select apellido, oficio, dept_no from emple where dept_no = '20';

--11 Mostrar todos los datos de los empleados ordenados por apellido.

select * from emple order by apellido;

--12 Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos ordenados por apellido.

select * from emple where oficio = ' VENDEDOR ' order by apellido;

--13 Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea ʻANALISTAʼ. Ordenar el resultado por apellido.

select * from emple where dept_no = '10' and oficio = 'Analista ' ORDER by apellido;

--14 Mostrar los empleados que tengan un salario mayor que 200000 o que pertenezcan al departamento número 20.

select * from emple where salario > '2000000' or dept_no = '20';

--15 Ordenar los empleados por oficio, y dentro de oficio por nombre.

select * from emple order by oficio, apellido;

--16 Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por ʻAʼ.

select * from emple where apellido like 'A%';

--17 Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ.

select * from emple where apellido like '%Z';

--18 Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.

select * from emple where apellido like 'A%' and oficio like '%E%';

--19 Seleccionar los empleados cuyo salario esté entre 100000 y 200000. Utilizar el operador BETWEEN.

select * FROM `emple` WHERE salario BETWEEN '100000' and '200000';

--20 Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión superior a 100000.

select * FROM `emple` WHERE oficio = 'vendedor' and comision > '100000'

--21 Seleccionar los datos de los empleados ordenados por número de departamento, y dentro de cada departamento ordenados por apellido.

select * FROM `emple` order by dept_no, apellido

--22 Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan un salario superior a 300000.

select * FROM `emple` WHERE apellido like '%Z' and salario > '300000'

--23. Datos de los departamentos cuya localización empiece por ʻBʼ.

select * from depart where loc like 'B%';

--24. Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario superior a 100000 y pertenezcan al departamento número 10.

select * FROM emple WHERE oficio = 'empleado' and salario > '100000' and dept_no = '10'

--25. Mostrar los apellidos de los empleados que no tengan comisión.

select apellido, comision FROM `emple` WHERE comision = 'NULL'

--26. Mostrar los apellidos de los empleados que no tengan comisión y cuyo apellido empiece por ʻJʼ.

select apellido, comision FROM `emple` WHERE comision = NULL  and apellido like 'J%'

--27. Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ, ʻANALISTAʼ o ʻEMPLEADOʼ.

select apellido , oficio FROM `emple` WHERE oficio IN ('vendedor', 'analista' , 'empleado')

--28. Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni ʻEMPLEADOʼ, y además tengan un salario mayor de 200000.

select * FROM `emple` WHERE `oficio` not in ('Analista', 'Empleado') and salario > '200000'

--29 Seleccionar de la tabla EMPLE los empleados cuyo salario esté entre 2000000 y 3000000 (utilizar BETWEEN).

select * FROM `emple` WHERE salario BETWEEN '2000000' and '3000000'

--30 Seleccionar el apellido, salario y número de departamento de los empleados cuyo salario sea mayor que 200000 en los departamentos 10 ó 30.

select  apellido, salario, dept_no from emple where salario>200000  and (dept_no=10 or dept_no=30);
