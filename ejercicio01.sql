-- crear base de datos
create database productos character set utf8 collate utf8_spanish_ci;
-- crear tabla
create table productos(id int,nombre varchar(20), descripcion varchar(60), stock int,fecha_alta date, proveedor varchar(20), nacional set('Y','N'));
-- rellenar datos con cinco productos
insert into productos
values ('2784', 'vodka', 'este producto es para mayores de 18','785', '2018-04-13', 'marcos','Y');
insert into productos
values ('9456', 'compresas', 'este producto es el mas solicitado hasta el momento','905', '2018-11-15', 'julen','N');
insert into productos
values ('2046', 'lechuga', 'este producto esta a punto de caducar','578', '2018-11-17', 'pepa','Y');
insert into productos
values ('947', 'sacaleches', 'este producto es optimo para embarazadas','132', '2008-11-13', 'joselu','N');
insert into productos
values ('385', 'galletas', 'este producto esta en buen estado','345', '2017-04-13', 'marc','Y');
-- mostrar tablas de la base de datos
show tables;
-- borrar la base de datos creada
DROP DATABASE productos;