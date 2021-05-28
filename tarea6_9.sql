/*Una empresa tiene registrados sus clientes en una tabla llamada `clientes`, también tiene una tabla `provincias` donde registra los nombres de las 
provincias.*/

/*1. Borramos las tablas si existen y procedemos a crearlas*/

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

/*2. Cargamos una serie de registros en las tablas.*/


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


/*3. Crear un procedimiento almacenado que le enviemos como parámetro los nombres de dos provincias y genere como resultado el nombre de la provincia 
que tiene más clientes y su cantidad, en caso de tener la misma cantidad mostrar las dos provincias y la cantidad. Dentro del procedimiento almacenado 
definimos dos variables locales llamadas 'canti1' y 'canti2' que almacenan en forma temporal la cantidad de clientes que hay en cada una de las dos 
provincias consultadas.*/


drop procedure if exists pa_mas_clientes_provincias;

delimiter //
 create procedure pa_mas_clientes_provincias(
   in provincia1 varchar(20),
   in provincia2 varchar(20))
 begin
   declare canti1 int;
   declare canti2 int;
   select count(*) into canti1 from clientes as cli
     join provincias as pro 
     on pro.codigo=cli.codigoprovincia
     where pro.nombre=provincia1;
   select count(*) into canti2 from clientes as cli
     join provincias as pro 
     on pro.codigo=cli.codigoprovincia
     where pro.nombre=provincia2;     
   case  
     when canti1>canti2 then
       select provincia1,canti1;
     when canti2>canti1 then
       select provincia2,canti2;
     else
       select provincia1,provincia2,canti1;
   end case;  
 end //
 delimiter ;


/*4. Llamamos luego al procedimiento almacenado pasando dos provincias*/

call pa_mas_clientes_provincias('Buenos Aires','Santa Fe');