1. Crea una copia de seguridad de la estructura y contenido actual de la BD Jardineria.

   mysqldump -u root -p jardineria > jardineria.sql

2. Modifica la tabla DetallePedido para insertar una columna para el IVA de tipo numérico. Mediante una transacción establece el valor de dicho campo a 18 para aquellos registros cuyo pedido tenga fecha a partir del 1 de Julio de 2010. A continuación, actualiza el resto de pedidos estableciendo el IVA a 21.

   alter table DetallePedidos add (IVA float(20));

   start transaction;
   update DetallePedidos set IVA=18 where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido >= '2008-06-01');
   commit;

3. Modifica la tabla DetallePedido para incorporar una columna llamada pvp_linea de tipo numérico, y actualiza todos sus registros para calcular su valor con la fórmula pvp_linea = PrecioUnidad * Cantidad*IVA/100.

   alter table DetallePedidos add (PVP float(20));

   update DetallePedidos set PVP=PrecioUnidad*Cantidad*IVA/100;

4. Borra el cliente que posea el límite de crédito más bajo. ¿Es posible borrarlo con solo una consulta? Justifica tu respuesta.

   delete from Clientes where min(LimiteCredito);
   
   ERROR 1111 (HY000): Invalid use of group function
(Aparece error porque el programa intenta conservar la integridad diferencial)

5. Inserta dos clientes nuevos para un empleado cualquiera que sea representante de ventas. A continuación inserta mediante transacciones un pedido que tenga al menos 3 líneas de detalle.

    insert into Clientes values (1000, 'Jose', 'Martinez', 'Perez', '7535353', '4884747447', 'Cinco villas', NULL, 'Madrid', 'madrid', 'España', '28080',3, 1000000);
    insert into Clientes values (1001, 'Oscar', 'Lapuente', 'Sanchez', '555324', '152525', 'Colinas', NULL, 'Zaragoza', 'Zaragoza', 'España', '50028', 3, 1000000);

	start transaction;
     insert into Pedidos values (180, '2019-02-21', '2019-02-21', '2019-02-21', 'Entregado', NULL, 1000);

     insert into DetallePedidos values (180, 'OR-150', 13, 20, 10, 11,13.13),
      (180, 'OR-151', 13, 5, 1, 11,31.41),
      (180, 'OR-152', 13, 3, 2, 11, 42.52);
     commit;

6. Modifica el precio de los artículos con precio superior a 200€ rebajándolos un 5%.

   update Productos set PrecioVenta=PrecioVenta*0.95 where PrecioVenta>200;

7. Crea una vista que devuelva el cliente que más dinero ha gastado en total. LLámala cliente_top.

create view cliente_top as select c.CodigoCliente, c.NombreCliente from Clientes inner join Pedidos on
c.CodigoCliente=p.CodigoCliente inner join DetallePedidos on p.CodigoPedido=Dp.CodigoPedido where 
Dp.PVP = (select max(PVP) from DetallePedidos);
