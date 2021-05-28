--Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.

drop table if exists clientes;
drop table if exists provincias;

-- 1. Borramos las tablas si existen y procedemos a crearlas.

drop table if exists clientes;
drop table if exists provincias;

 create table clientes (
  codigo int unsigned,
  nombre varchar(30),
  domicilio varchar(30) not null,
  ciudad varchar(20) not null,
  codigoprovincia tinyint unsigned not null,
  telefono varchar(11)
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint unsigned,
  nombre varchar(20),
  primary key (codigo)
 );

-- 2. Cargamos una serie de registros en las tablas.



INSERT INTO clientes VALUES (1,"Lopez Marcos","Colon 111","Cordoba",1,null);
INSERT INTO clientes VALUES (2,"Perez Ana","San Martin 222","Cruz del Eje",1,4578585);
INSERT INTO clientes VALUES (3,"Garcia Juan","Rivadavia 333","Villa Maria",1,4578445);
INSERT INTO clientes VALUES (4,"Perez Luis","Sarmiento 444","Rosario",2,NULL);
INSERT INTO clientes VALUES (5,"Pereyra Lucas","San Martin 555","Cruz del Eje",1,4253685);
INSERT INTO clientes VALUES (6,"Gomez Ines","San Martin 666","Santa Fe",2,0345252525);
INSERT INTO clientes VALUES (7,"Torres Fabiola","Alem 777","Villa del Rosario",1,4554455);
INSERT INTO clientes VALUES (8,"Lopez Carlos","Irigoyen 888","Cruz del Eje",1,NULL);
INSERT INTO clientes VALUES (9,"Ramos Betina ","San Martin 999","Cordoba",1,4223366);
INSERT INTO clientes VALUES (10,"Lopez Lucas","San Martin 1010","Posadas",4,0457858745);

INSERT INTO provincias VALUES (1,"Cordoba");
INSERT INTO provincias VALUES (2,"Santa Fe");
INSERT INTO provincias VALUES (3,"Corrientes");
INSERT INTO provincias VALUES (4,"Misiones");
INSERT INTO provincias VALUES (5,"Salta");
INSERT INTO provincias VALUES (6,"Buenos Aires");
INSERT INTO provincias VALUES (7,"Neuquen");


-- 3. Crearemos un procedimiento almacenado que le enviemos como parámetro los nombres de dos provincias y genere como resultado la cantidad de clientes que tenemos en cada una de dichas provincias. Dentro del procedimiento almacenado definimos dos variables locales llamadas 'canti1' y 'canti2' que almacenan en forma temporal la cantidad de clientes que hay en cada una de las dos provincias consultadas.

drop procedure if exists cantidad_clientes;

DELIMITER //
create procedure cantidad_clientes (
    in provincia1 VARCHAR(20),
    in provincia2 VARCHAR(20),
    out canti1 INT,
    out canti2 INT,
    out resultado INT
)
BEGIN
    declare canti1, canti2, suma int;
    SELECT COUNT(clientes.codigo) FROM clientes JOIN provincias ON clientes.codigoprovincia = provincias.codigo WHERE provincias.nombre = provincia1 into canti1;
    SELECT COUNT(clientes.codigo) FROM clientes JOIN provincias ON clientes.codigoprovincia = provincias.codigo WHERE provincias.nombre = provincia2 into canti2;
    set suma = canti1 + canti2;
    SELECT suma;
END //
DELIMITER ;

-- 4. Llamamos luego al procedimiento almacenado pasando dos provincias que queremos conocer la cantidad de clientes en forma independiente.

 call pa_cantidad_clientes_provincias('Corrientes','Buenos Aires'); 