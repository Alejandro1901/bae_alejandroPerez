-- Un comercio guarda la información de sus ventas en una tabla llamada "facturas".

-- 1- Elimine la tabla si existe.

Drop table if exists facturas;

-- 2- Cree la tabla con la siguiente estructura:

CREATE table facturas(
    numero int(10) unsigned zerofill not null auto_increment,
    numeroitem smallint unsigned not null,
    descripcion varchar(30) null,
    precioporunidad decimal(5,2) unsigned null,
    cantidad tinyint unsigned null,
    CONSTRAINT facturas PRIMARY KEY (numero, numeroitem)
);

-- 3- Ingrese algunos los siguientes registros:

insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(100,1,'escuadra 20 cm.',2.50,20);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(100,2,'escuadra 50 cm.',5,30);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(100,3,'goma lapiz-tinta',0.35,100);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(102,1,'lapices coloresx6',4.40,50);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(102,2,'lapices coloresx12',8,60);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(255,1,'lapices coloresx24',12.35,100);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(567,1,'compas plastico',12,50);
 insert into facturas (numero,numeroitem,descripcion,precioporunidad,cantidad)
  values(567,2,'compas metal',18.90,80);

--4- Se quiere guardar la siguiente información en una tabla denominada "montofacturas":
 -- + numero: número de factura,
 -- + total: total en dinero de todos los items de cada factura (precioporunidad x cantidad).

 create table montofacturas(
  numero int(10) zerofill,
  total decimal(9,2) unsigned,
  primary key(numero)
 );

-- 5- Elimine la tabla "montofacturas" si existe.

DROP TABLE IF EXISTS montofacturas;

-- 6- Realice una consulta de la tabla "facturas", agrupando por "numero", en la cual aparezca el 
-- número de factura y el monto total de todos sus items:

   select numero,
   sum(precioporunidad*cantidad) as total
   from facturas
   group by numero;

-- 7- Cree la tabla "montofacturas" a partir de la consulta anterior:

 create table montofacturas
  select numero,
   sum(precioporunidad*cantidad) as total
   from facturas
   group by numero;

-- 8- Muestre todos los registros de la tabla "montofacturas".

show table montofacturas;

-- 9- Visualice la estructura de la nueva tabla creada.

Show table from montofacturas;