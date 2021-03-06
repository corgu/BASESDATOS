-- Nueva base de datos: jardineria
1. Nombre, apellidos y email de los empleados a cargo de Alberto Soria

select Nombre, Apellido1, Apellido2, Email from Empleados where CodigoJefe = 3;
+-------------+------------+-----------+---------------------------+
| Nombre      | Apellido1  | Apellido2 | Email                     |
+-------------+------------+-----------+---------------------------+
| Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
| Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
| Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
| Emmanuel    | Magaña     | Perez     | manu@jardineria.es        |
| Francois    | Fignon     |           | ffignon@gardening.com     |
| Michael     | Bolton     |           | mbolton@gardening.com     |
| Hilary      | Washington |           | hwashington@gardening.com |
| Nei         | Nishikori  |           | nnishikori@gardening.com  |
| Amy         | Johnson    |           | ajohnson@gardening.com    |
| Kevin       | Fallmer    |           | kfalmer@gardening.com     |
+-------------+------------+-----------+---------------------------+

2. Ciudad y teléfono de las oficinas de EEUU

describe Oficinas;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| CodigoOficina   | varchar(10) | NO   | PRI | NULL    |       |
| Ciudad          | varchar(30) | NO   |     | NULL    |       |
| Pais            | varchar(50) | NO   |     | NULL    |       |
| Region          | varchar(50) | YES  |     | NULL    |       |
| CodigoPostal    | varchar(10) | NO   |     | NULL    |       |
| Telefono        | varchar(20) | NO   |     | NULL    |       |
| LineaDireccion1 | varchar(50) | NO   |     | NULL    |       |
| LineaDireccion2 | varchar(50) | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+

select Ciudad, Telefono from Oficinas where Pais = 'EEUU';
+---------------+-----------------+
| Ciudad        | Telefono        |
+---------------+-----------------+
| Boston        | +1 215 837 0825 |
| San Francisco | +1 650 219 4782 |
+---------------+-----------------+

3. Nombre, apellidos y cargo de aquellos que _no_ sean representantes de ventas

select Nombre, Apellido1, Apellido2, Puesto from Empleados where Puesto<>'Representante Ventas';
+----------+------------+-----------+-----------------------+
| Nombre   | Apellido1  | Apellido2 | Puesto                |
+----------+------------+-----------+-----------------------+
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Emmanuel | Magaña     | Perez     | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |
+----------+------------+-----------+-----------------------+

4. Cargo, nombre, apellidos y email del jefe de la empresa.

select Nombre, Apellido1, Apellido2, Email, Puesto from Empleados where Puesto = 'Director General';
+--------+-----------+-----------+----------------------+------------------+
| Nombre | Apellido1 | Apellido2 | Email                | Puesto           |
+--------+-----------+-----------+----------------------+------------------+
| Marcos | Magaña    | Perez     | marcos@jardineria.es | Director General |
+--------+-----------+-----------+----------------------+------------------+

5. Número de clientes que tiene la empresa.

 select count(NombreCliente) from Clientes;
+----------------------+
| count(NombreCliente) |
+----------------------+
|                   36 |
+----------------------+

6. Nombre de los clientes españoles.

select NombreCliente,Pais from Clientes where Pais='Spain';
+-----------------------+-------+
| NombreCliente         | Pais  |
+-----------------------+-------+
| Lasas S.A.            | Spain |
| Lasas S.A.            | Spain |
| Camunas Jardines S.L. | Spain |
| Dardena S.A.          | Spain |
+-----------------------+-------+
7. Cuántos clientes tiene cada país.
select Pais, count(*) from Clientes group by Pais;
+----------------+----------+
| Pais           | count(*) |
+----------------+----------+
| USA            |        4 |
| Spain          |        4 |
| España         |       23 |
| France         |        2 |
| Australia      |        2 |
| United Kingdom |        1 |
+----------------+----------+

8. Cuántos clientes tiene Madrid.

select count(*) from Clientes where Region='Madrid';
+----------+
| count(*) |
+----------+
|       20 |
+----------+
9. Cuántos clientes tienen las ciudades que empiezan por M.

select Region, count(NombreCliente) from Clientes where Region like 'M%' group by Region;
+--------+----------------------+
| Region | count(NombreCliente) |
+--------+----------------------+
| Miami  |                    1 |
| Madrid |                   20 |
+--------+----------------------+
10. Código de empleado y número de clientes al que atiende cada representante de ventas.

select CodigoEmpleadoRepVentas, count(CodigoEmpleadoRepVentas) from Clientes group by CodigoEmpleadoRepVentas;
+-------------------------+--------------------------------+
| CodigoEmpleadoRepVentas | count(CodigoEmpleadoRepVentas) |
+-------------------------+--------------------------------+
|                       5 |                              5 |
|                       8 |                              4 |
|                       9 |                              2 |
|                      11 |                              5 |
|                      12 |                              5 |
|                      16 |                              2 |
|                      18 |                              2 |
|                      19 |                              2 |
|                      22 |                              2 |
|                      30 |                              5 |
|                      31 |                              2 |
+-------------------------+--------------------------------+
11. Cuántos clientes no tienen asignado representante de ventas.
select count(*) from Clientes where NOT EXISTS (select CodigoEmpleadoRepVentas from Clientes);
+----------+
| count(*) |
+----------+
|        0 |
+----------+

12. Cuál han sido el primer y último pagos hechos por clientes.
select min(FechaPago) from Pagos;
+----------------+
| min(FechaPago) |
+----------------+
| 2006-01-18     |
+----------------+
1 row in set (0,00 sec)

mysql> select max(FechaPago) from Pagos;
+----------------+
| max(FechaPago) |
+----------------+
| 2009-03-26     |
+----------------+
1 row in set (0,00 sec)

13. Código de cliente de los que hicieron pagos en 2008.
 select CodigoCliente from Pagos where FechaPago like'2008%';
 +---------------+
| CodigoCliente |
+---------------+
|             1 |
|             1 |
|            13 |
|            14 |
|            26 |
+---------------+

14. Qué estados distintos puede tener un pedido.
select estado from Pedidos group by estado;
+-----------+
| estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
| Pediente  |
+-----------+

15. El número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos _no_ entregados a tiempo.
select CodigoPedido,CodigoCliente,FechaEsperada,FechaEntrega from Pedidos where FechaEntrega > FechaEsperada;
+--------------+---------------+---------------+--------------+
| CodigoPedido | CodigoCliente | FechaEsperada | FechaEntrega |
+--------------+---------------+---------------+--------------+
|            9 |             1 | 2008-12-27    | 2008-12-28   |
|           13 |             7 | 2009-01-14    | 2009-01-15   |
|           16 |             7 | 2009-01-07    | 2009-01-15   |
|           17 |             7 | 2009-01-09    | 2009-01-11   |
|           18 |             9 | 2009-01-06    | 2009-01-07   |
|           22 |             9 | 2009-01-11    | 2009-01-13   |
|           28 |             3 | 2009-02-17    | 2009-02-20   |
|           31 |            13 | 2008-09-30    | 2008-10-04   |
|           32 |             4 | 2007-01-19    | 2007-01-27   |
|           38 |            19 | 2009-03-06    | 2009-03-07   |
|           39 |            19 | 2009-03-07    | 2009-03-09   |
|           40 |            19 | 2009-03-10    | 2009-03-13   |
|           42 |            19 | 2009-03-23    | 2009-03-27   |
|           43 |            23 | 2009-03-26    | 2009-03-28   |
|           44 |            23 | 2009-03-27    | 2009-03-30   |
|           45 |            23 | 2009-03-04    | 2009-03-07   |
|           46 |            23 | 2009-03-04    | 2009-03-05   |
|           49 |            26 | 2008-07-22    | 2008-07-23   |
|           55 |            14 | 2009-01-10    | 2009-01-11   |
|           60 |             1 | 2008-12-27    | 2008-12-28   |
|           68 |             3 | 2009-02-17    | 2009-02-20   |
|           92 |            27 | 2009-04-30    | 2009-05-03   |
|           96 |            35 | 2008-04-12    | 2008-04-13   |
|          103 |            30 | 2009-01-20    | 2009-01-24   |
|          106 |            30 | 2009-05-15    | 2009-05-20   |
|          112 |            36 | 2009-04-06    | 2009-05-07   |
|          113 |            36 | 2008-11-09    | 2009-01-09   |
|          114 |            36 | 2009-01-29    | 2009-01-31   |
|          115 |            36 | 2009-01-26    | 2009-02-27   |
|          123 |            30 | 2009-01-20    | 2009-01-24   |
|          126 |            30 | 2009-05-15    | 2009-05-20   |
|          128 |            38 | 2008-12-10    | 2008-12-29   |
+--------------+---------------+---------------+--------------+
32 rows in set (0,00 sec)

16. Cuántos productos existen en cada línea de pedido.
select count(*) from Pedidos where CodigoPedido;
+----------+
| count(*) |
+----------+
|      115 |
+----------+
1 row in set (0,00 sec)

17. Listar los 20 códigos de productos más pedidos ordenando por cantidad pedida.
select CodigoProducto, Cantidad from DetallePedidos order by Cantidad Desc limit 20;
+----------------+----------+
| CodigoProducto | Cantidad |
+----------------+----------+
| AR-008         |      450 |
| FR-17          |      423 |
| AR-009         |      290 |
| AR-009         |      250 |
| AR-009         |      231 |
| OR-214         |      212 |
| FR-57          |      203 |
| AR-006         |      180 |
| AR-009         |      159 |
| OR-247         |      150 |
| OR-177         |      150 |
| 30310          |      143 |
| FR-29          |      120 |
| FR-48          |      120 |
| OR-157         |      113 |
| AR-002         |      110 |
| OR-139         |       80 |
| OR-247         |       80 |
| FR-106         |       80 |
| AR-001         |       80 |
+----------------+----------+
20 rows in set (0,00 sec)

18. Número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha requerida.extraescolares
select CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega from Pedidos where FechaEntrega<=FechaEsperada-2;
+--------------+---------------+---------------+--------------+
| CodigoPedido | CodigoCliente | FechaEsperada | FechaEntrega |
+--------------+---------------+---------------+--------------+
|            2 |             5 | 2007-10-28    | 2007-10-26   |
|           24 |            14 | 2008-07-31    | 2008-07-25   |
|           30 |            13 | 2008-09-03    | 2008-08-31   |
|           36 |            14 | 2008-12-15    | 2008-12-10   |
|           53 |            13 | 2008-11-15    | 2008-11-09   |
|           89 |            35 | 2007-12-13    | 2007-12-10   |
|           91 |            27 | 2009-03-29    | 2009-03-27   |
|           93 |            27 | 2009-05-30    | 2009-05-17   |
+--------------+---------------+---------------+--------------+
8 rows in set (0,00 sec)

19. Nombre y apellidos del empleado y nombre y apellidos de su jefe.
select E.nombre, E.apellido1,J.nombre,J.apellido1 from Empleados E inner join Empleados J on E.CodigoJefe=J.CodigoEmpleado;
+-----------------+------------+----------+------------+
| nombre          | apellido1  | nombre   | apellido1  |
+-----------------+------------+----------+------------+
| Ruben           | López      | Marcos   | Magaña     |
| Alberto         | Soria      | Ruben    | López      |
| Maria           | Solís      | Ruben    | López      |
| Felipe          | Rosas      | Alberto  | Soria      |
| Juan Carlos     | Ortiz      | Alberto  | Soria      |
| Carlos          | Soria      | Alberto  | Soria      |
| Mariano         | López      | Carlos   | Soria      |
| Lucio           | Campoamor  | Carlos   | Soria      |
| Hilario         | Rodriguez  | Carlos   | Soria      |
| Emmanuel        | Magaña     | Alberto  | Soria      |
| José Manuel     | Martinez   | Emmanuel | Magaña     |
| David           | Palma      | Emmanuel | Magaña     |
| Oscar           | Palma      | Emmanuel | Magaña     |
| Francois        | Fignon     | Alberto  | Soria      |
| Lionel          | Narvaez    | Francois | Fignon     |
| Laurent         | Serra      | Francois | Fignon     |
| Michael         | Bolton     | Alberto  | Soria      |
| Walter Santiago | Sanchez    | Michael  | Bolton     |
| Hilary          | Washington | Alberto  | Soria      |
| Marcus          | Paxton     | Hilary   | Washington |
| Lorena          | Paxton     | Hilary   | Washington |
| Nei             | Nishikori  | Alberto  | Soria      |
| Narumi          | Riko       | Nei      | Nishikori  |
| Takuma          | Nomura     | Nei      | Nishikori  |
| Amy             | Johnson    | Alberto  | Soria      |
| Larry           | Westfalls  | Amy      | Johnson    |
| John            | Walton     | Amy      | Johnson    |
| Kevin           | Fallmer    | Alberto  | Soria      |
| Julian          | Bellinelli | Kevin    | Fallmer    |
| Mariko          | Kishi      | Kevin    | Fallmer    |
+-----------------+------------+----------+------------+
30 rows in set (0,01 sec)

