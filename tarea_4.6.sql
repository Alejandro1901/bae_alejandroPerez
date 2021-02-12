--1. Averigua el DNI de todos los clientes.

select dni from cliente;

--2. Consulta todos los datos de todos los programas.

select * from programa;

--3. Obtén un listado con los nombres de todos los programas.

select nombre from programa;

--4. Genera una lista con todos los comercios.

select * from comercio;

--5. Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (utiliza distinct).

select distinct ciudad from comercio, distribuye where comercio.cif = distribuye.cif;

--6. Obtén una lista con los nombres de programas, sin que aparezcan valores duplicados (utiliza distinct).

select distinct nombre from programa;

--7. Obtén el DNI más 4 de todos los clientes.

select dni+4 from cliente;

--8. Haz un listado con los códigos de los programas multiplicados por 7.

select codigo * 7 from programa;

--9 ¿Cuáles son los programas cuyo código es inferior o igual a 10?

select * from programa where codigo <= 10;

--10. ¿Cuál es el programa cuyo código es 11?

select * from programa where codigo = 11;

--11. ¿Qué fabricantes son de Estados Unidos?

select * from fabricante where pais = "Estados Unidos";

--12. ¿Cuáles son los fabricantes no españoles? Utilizar el operador in.

select * from fabricante where pais not in ("España");

--13. Obtén un listado con los códigos de las distintas versiones de Windows.

select version from programa where nombre = "Windows";

--14. ¿En qué ciudades comercializa programas El Corte inglés?

select ciudad from comercio where nombre = "El Corte inglés";

--15. ¿Qué otros comercios hay, además de El Corte inglés? Utilizar el operador in.

select nombre from comercio where nombre not in ("El Corte inglés");

--16. Genera una lista con los códigos de las distintas versiones de Windows y Access. Utilizar el operador in.

select codigo from programa where nombre in ("Access", "Windows");

--17. Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con between y otra sin between.

select nombre from cliente where (edad between 10 and 25) or edad >= 50;

--18. Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados.

select distinct nombre from comercio where ciudad in ("Sevilla", "Madrid");

--19. ¿Qué clientes terminan su nombre en la letra “o”?

select * from cliente where nombre  like "%o";

--20. ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?

select * from cliente where nombre like "%O" and edad > 30;

--21. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A o por una W.

select * from programa where version like "%i" or nombre like "A%" or nombre like "W%";

--22. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S.

select nombre, version from programa where version like "%i" or nombre like "A%S";

--23. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, y cuyo nombre no comience por una A.

select nombre, version from programa where version like "%i" and nombre not like "A%";

--24. Obtén una lista de empresas por orden alfabético ascendente.

select * from comercio order by nombre ASC;

--25. Genera un listado de empresas por orden alfabético descendente.

select nombre from comercio order by nombre desc;

--26. Obtén un listado de programas por orden de versión.

select * from programa order by version;

--27. Genera un listado de los programas que desarrolla oracle.

select programa.* from fabricante, desarrolla, programa where fabricante.id_fab=desarrolla.id_fab and desarrolla.codigo=programa.codigo and fabricante.nombre="orACLE";

--28. ¿Qué comercios distribuyen Windows?

select comercio.nombre from comercio, distribuye, programa where comercio.cif = distribuye.cif and distribuye.codigo = programa.codigo and programa.nombre = "Windows";


--29. Genera un listado de los programas y cantidades que se han distribuido a El Corte inglés de Madrid.

select programa.nombre,distribuye.cantidad from comercio, distribuye, programa where comercio.cif = distribuye.cif and distribuye.codigo = programa.codigo and comercio.nombre="El Corte inglés";

--30. ¿Qué fabricante ha desarrollado Freddy Hardest?

select fabricante.nombre from fabricante,desarrolla,programa where fabricante.id_fab = desarrolla.id_fab and desarrolla.codigo = programa.codigo and programa.nombre="Freddy Hardest";

--31. Selecciona el nombre de los programas que se registran por internet.

select distinct programa.nombre from programa, registra where programa.codigo = registra.codigo and medio = "internet";

--32. ¿Qué medios ha utilizado para registrarse Pepe Pérez?

select cliente.nombre from cliente, registra where cliente.dni = registra.dni and medio = "inTERNET";

--33. ¿Qué usuarios han optado por internet como medio de registro?

select medio from registra, cliente where registra.dni = cliente.dni and nombre = "Pepe Pérez";


--34. ¿Qué programas han recibido registros por tarjeta postal?

select cliente.nombre from cliente, registra where cliente.dni = registra.dni and medio = "internet";

--35. ¿En qué localidades se han vendido productos que se han registrado por internet?

select programa.nombre from programa, registra where programa.codigo = registra.codigo and medio = "tarjeta postal";

--36. Obtén un listado de los nombres de las personas que se han registrado por internet, junto al nombre de los programas para los que ha efectuado el registro.

select comercio.ciudad from comercio, distribuye, programa, registra where comercio.cif = distribuye.cif and distribuye.codigo = programa.codigo and programa.codigo =registra.codigo and registra.medio = "inTERNET";

--37. Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.

select cliente.nombre, programa.nombre from cliente, registra, programa where cliente.dni = registra.dni and registra.codigo = programa.codigo and registra.medio = "inTERNET";

--38. Genera un listado con las ciudades en las que se pueden obtener los productos de oracle.

select cliente.nombre, programa.nombre, programa.version, registra.medio, comercio.nombre, comercio.ciudad from cliente, registra, programa, distribuye, comercio where cliente.dni = registra.dni and registra.codigo = programa.codigo and programa.codigo = distribuye.codigo and distribuye.cif = comercio.cif;

--39. Obtén el nombre de los usuarios que han registrado Access XP.

select distinct comercio.ciudad from comercio, distribuye, programa, desarrolla, fabricante where comercio.cif=distribuye.cif and distribuye.codigo = programa.codigo and programa.codigo = desarrolla.codigo and desarrolla.id_fab = fabricante.id_fab and fabricante.nombre = "orACLE";

--40. Nombre de aquellos fabricantes cuyo país es el mismo que ʻoracleʼ. (Subconsulta).

select cliente.nombre from cliente, registra, programa where cliente.dni = registra.dni and registra.codigo = programa.codigo and programa.nombre = "Access" and programa.version = "XP";

--41. Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta).

select nombre from fabricante where pais = (select pais from fabricante where nombre = "orACLE");

--42. Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta).

select nombre from cliente where edad = (select edad from cliente where nombre = "Pepe Pérez");


--43. Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta).

select nombre from comercio where ciudad = (select ciudad from comercio where nombre = "FNAC");

--44. Obtener el número de programas que hay en la tabla programas. 46 Calcula el número de clientes cuya edad es mayor de 40 años.

select distinct cliente.nombre from cliente, registra where cliente.dni = registra.dni and medio in (select distinct medio from cliente, registra where cliente.dni = registra.dni and cliente.nombre = "Pepe Pérez");

--45. Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1.

select count(codigo) from programa;

--46. Calcula la media de programas que se venden cuyo código es 7.

select count(dni) from cliente where edad > 40;

--47. Calcula la mínima cantidad de programas de código 7 que se ha vendido

select sum(cantidad) from distribuye where cif = 1;

--48. Calcula la máxima cantidad de programas de código 7 que se ha vendido.

select max(cantidad) from distribuye,programa where distribuye.codigo = programa.codigo and programa.codigo = 7;

--49. ¿En cuántos establecimientos se vende el programa cuyo código es 7?

select count(comercio.cif) from comercio,distribuye where distribuye.cif = comercio.cif and distribuye.codigo = 7;

--50. Calcular el número de registros que se han realizado por internet.

select count(dni) from registra where medio="INTERNET";

--51. Obtener el número total de programas que se han vendido en ʻSevillaʼ.

select sum(distribuye.cantidad) from comercio,distribuye where comercio.cif=distribuye.cif and comercio.ciudad="SEVILLA";

--52. Calcular el número total de programas que han desarrollado los fabricantes cuyo país es ʻEstados Unidosʼ.

select count(programa.codigo) from fabricante, desarrolla, programa where fabricante.id_fab=desarrolla.id_fab and desarrolla.codigo=programa.codigo and fabricante.pais="Estados Unidos";

--53. Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la consulta debe aparecer también la longitud de la cadena nombre.

select upper(nombre), LENGTH(nombre) from cliente;

--54. Con una consulta concatena los campos nombre y versión de la tabla PROGRAMA.

select concat (nombre," ",version) FROM programa;
