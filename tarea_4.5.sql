distinct-- BLOQUE 1

-- 1.Listar los nombres de los usuarios

select nombre from tblUsuarios;

-- 2.Calcular el saldo máximo de los usuarios de sexo "Mujer"

select max(saldo) from tblUsuarios where sexo = 'M';

-- 3.Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY

select nombre, telefono from tblUsuarios where marca in('NOKIA', 'BLACKBERRY', 'SONY');

-- 4.Contar los usuarios sin saldo o inactivos

select count(*) from tblUsuarios where not activo or saldo <= 0;

-- 5.Listar el login de los usuarios con nivel 1, 2 o 3

select usuario from tblUsuarios where nivel in(1, 2, 3);

-- 6.Listar los números de teléfono con saldo menor o igual a 300

select telefono from tblUsuarios where saldo <= 300;

-- 7.Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL

select sum(saldo) from tblUsuarios where compañia = 'NEXTEL';

-- 8.Contar el número de usuarios por compañía telefónica

select compañia,count(*) from tblUsuarios group by compañia;

-- 9.Contar el número de usuarios por nivel

select nivel, count(*) from tblUsuarios group by nivel;

-- 10.Listar el login de los usuarios con nivel 2

select usuario from tblUsuarios where nivel = 2;

-- 11.Mostrar el email de los usuarios que usan gmail

select email from tblUsuarios where email like '%gmail.com';

-- 12.Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTorOLA

select nombre, telefono from tblUsuarios where marca in('LG', 'SAMSUNG', 'MOTorOLA');

-- BLOQUE 2

-- 13.Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG

select nombre, telefono from tblUsuarios where marca not in('LG', 'SAMSUNG');

-- 14.Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL

select usuario, telefono from tblUsuarios where compañia = 'IUSACELL';

-- 15.Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL

select usuario, telefono from tblUsuarios where compañia <> "TELCEL";

-- 16.Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA

select avg(saldo) from tblUsuarios where marca = 'NOKIA';

-- 17.Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL

select usuario, telefono from tblUsuarios where compañia in('IUSACELL', 'AXEL');

-- 18.Mostrar el email de los usuarios que no usan yahoo

select email from tblUsuarios where email not like '%yahoo.com';

-- 19.Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL

select usuario, telefono from tblUsuarios where compañia not in('TELCEL', 'IUSACELL');

-- 20.Listar el login y teléfono de los usuarios con compañia telefónica UNEFON

select usuario, telefono from tblUsuarios where compañia = 'UNEFON';

-- 21.Listar las diferentes marcas de celular en orden alfabético descendentemente

select distinct marca from tblUsuarios order by marca DESC;

-- 22.Listar las diferentes compañias en orden alfabético aleatorio

select distinct compañia from tblUsuarios order by rand();

-- 23.Listar el login de los usuarios con nivel 0 o 2

select usuario from tblUsuarios where nivel in(0, 2);

-- 24.Calcular el saldo promedio de los usuarios que tienen teléfono marca LG

select avg(saldo) from tblUsuarios where marca = 'LG';

-- BLOQUE 3

-- 25.Listar el login de los usuarios con nivel 1 o 3

select usuario from tblUsuarios where nivel in(1, 3);

-- 26.Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY

select nombre, telefono from tblUsuarios where marca <> "BLACKBERRY";

-- 27.Listar el login de los usuarios con nivel 3

select usuario from tblUsuarios where nivel = 3;

-- 28.Listar el login de los usuarios con nivel 0

select usuario from tblUsuarios where nivel = 0;

-- 29.Listar el login de los usuarios con nivel 1

select usuario from tblUsuarios where nivel = 1;

-- 30.Contar el número de usuarios por sexo

select sexo, count(*) from tblUsuarios group by sexo;

-- 31.Listar el login y teléfono de los usuarios con compañia telefónica AT&T

select usuario, telefono from tblUsuarios where compañia = "AT&T";

-- 32.Listar las diferentes compañias en orden alfabético descendentemente

select distinct compañia from tblUsuarios order by compañia DESC;

-- 33.Listar el login de los usuarios inactivos

select usuario from tblUsuarios where not activo;

-- 34.Listar los números de teléfono sin saldo

select telefono from tblUsuarios where saldo <= 0;

-- 35.Calcular el saldo mínimo de los usuarios de sexo "Hombre"

select min(saldo) from tblUsuarios where sexo = 'H';

-- 36.Listar los números de teléfono con saldo mayor a 300

select telefono from tblUsuarios where saldo > 300;

-- BLOQUE 4

-- 37.Contar el número de usuarios por marca de teléfono

select marca, count(*) from tblUsuarios group by marca;

-- 38.Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG

select nombre, telefono from tblUsuarios where marca <> "LG";

-- 39.Listar las diferentes compañias en orden alfabético ascendentemente

select distinct compañia from tblUsuarios order by compañia ASC;

-- 40.Calcular la suma de los saldos de los usuarios de la compañia telefónica UNEFON

select sum(saldo) from tblUsuarios where compañia = 'UNEFON';

-- 41.Mostrar el email de los usuarios que usan hotmail

select email from tblUsuarios where email like "%hotmail.com";

-- 42.Listar los nombres de los usuarios sin saldo o inactivos

select nombre from tblUsuarios where not activo or saldo <= 0;

-- 43.Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o TELCEL

select usuario, telefono from tblUsuarios where compañia in('IUSACELL', 'TELCEL');

-- 44.Listar las diferentes marcas de celular en orden alfabético ascendentemente

select distinct marca from tblUsuarios order by marca DESC;

-- 45.Listar las diferentes marcas de celular en orden alfabético aleatorio

select DISTinCT marca from tblUsuarios order by rand();

-- 46.Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o UNEFON

select usuario, telefono from tblUsuarios where compañia in('IUSACELL', 'UNEFON');

-- 47.Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca MOTorOLA o NOKIA

select nombre, telefono from tblUsuarios where marca not in('MOTorOLA', 'NOKIA');

-- 48.Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL

select sum(saldo) from tblUsuarios where compañia = 'TELCEL';
