-- orden para conectar el usuario root a mysqls: 
sudo mysql -u root -p
 -- desonectar de la base:
 quit
-- orden para que nos enseñe las bases:
show databases;
 -- entrar en la base:
 use nombretabla;
-- abrir version:
select version();
-- abrir fecha y hora:
select now();
 -- mostrar usuario que esta usando la base de datos:
 select user();
 -- crear un usuario dentro de una base de datos
 GRANT ALL ON nombrebasedatos.* TO 'nombreusuario'@'localhost';
 -- crear base de datos
 CREATE DATABASE nombrebase;
 -- mostrar tablas
 show tables;
 -- ver registros de tabla
 select * from nombretabla;
 -- mostrar solo una de las tablas para ver sus registros
 select nombretabla, host from nombretabla;
 -- mostrar descripcion tabla
 describe nombretabla;
 -- crear tabla
 create table nombretabla(nombrecampo tipodato(20), etc);
 -- insertar datos para rellenar la tabla
 insert into nombretabla
 ->values (rellenar datos entre comillas, separados por comas);