-- Ejercicios Jardinería DML
-- 1. Insertar una oficina con sede en Tarazona.--
insert into Oficinas values ('TRZ-ES','Tarazona','España','Zaragoza',50500,+345335353,'Iglesias 34','');
-- 2. Insertar un empleado para la oficina de Tarazona que sea representante de ventas.
insert into Empleados values (32,'Marcos','gonzalez','albericio','3211','marcosg@jardineria.es','TRZ-ES',29,'Representante Ventas');
-- 3. Insertar un cliente cuyo representante de ventas sea el insertado previamente en el ejercicio 2.
insert into Clientes values (39,'Floristeria Aznar','Pilar calvo','Sonia','5232523','53252','marrodan 15',NULL,'Tarazona','Zgz','España','50500',32,3000);
-- 4. Insertar un pedido del cliente anterior.
insert into Pedidos values (129,'2019-01-12','2019-01-31','2019-01-31','Entregado','Pagado a plazos',39);
-- 5. Modifica el código del cliente del ejercicio 4 y verifica si se han producido cambios en las otras tablas.
update Clientes set CodigoCliente=40 where codigoCliente=39;-- Seria asi pero no puede cambiarse el codigo
-- 6. Elimina el cliente del ejercicio 4 y verifica si se han producido cambios.
delete from Clientes where NombreCliente='Floristeria Aznar';-- No deja borrarlo
-- Mediante subconsultas
-- 1. Elimina los clientes que no tengan pedidos.
delete from Clientes where CodigoCliente not in (select CodigoPedido from Pedidos);
-- 2. Incrementa un 20% el precio de los productos que no tengan pedidos.
update Productos set PrecioVenta=PrecioVenta*1.20 where CodigoProducto not in (select CodigoProducto from DetallePedidos);
-- 3. Borra los pagos del cliente con menor límite de crédito.
delete from Pagos where CodigoCliente in(select min(LimiteCredito) from Clientes);
-- 4. Sitúa a 0 el límite de crédito del cliente que menos unidades haya pedido del producto 'OR-179'.
update Clientes set LimiteCredito=0 where (select min(Cantidad) from DetallePedidos where CodigoProducto='OR-179');
