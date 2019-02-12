1.Crea un usuario 'creausuarios' y otórgale permisos para que pueda crear usuarios.
create user 'creausuarios'@'localhost' identified by 'Admin$2018';
GRANT ALL PRIVILEGES ON * . * TO 'creausuarios'@'localhost';
2.Conecta como 'creausuarios' crea un nuevo usuario 'usujardineria'.
sudo mysql -u creausuarios -p
create user 'usujardineria'@'localhost' identified by 'Admin$2018';
3.Conecta como 'root', otórgale permisos al usuario 'usujardineria' para que pueda crear tablas en jardineria.
sudo mysql -u root -p
GRANT select,create,insert ON jardineria.* TO 'usujardineria'@'localhost';
4.Conecta como 'usujardineria' comprueba que dispone de los permisos creando una tabla de árboles en jardineria. La tabla debe tener código, nombre, altura máxima y edad de vida media.
sudo mysql -u usujardineria -p
create table arboles (codigo int (10) not null, nombre varchar(20),altura_maxima decimal(20),edad_media int (3), primary key (codigo));
5.Conecta como 'root', muestra los permisos que tiene el usuario 'usujardineria'.
show grants for 'usujardineria'@'localhost';

+-------------------------------------------------------------------------------+
| Grants for usujardineria@localhost                                            |
+-------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `usujardineria`@`localhost`                             |
| GRANT SELECT, INSERT, CREATE ON `jardineria`.* TO `usujardineria`@`localhost` |
+-------------------------------------------------------------------------------+
2 rows in set (0,04 sec)
6.Conecta como 'usujardineria' muestra los permisos que posee y comprueba que son los mismos a los de la orden anterior.
show grants;

+-------------------------------------------------------------------------------+
| Grants for usujardineria@localhost                                            |
+-------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `usujardineria`@`localhost`                             |
| GRANT SELECT, INSERT, CREATE ON `jardineria`.* TO `usujardineria`@`localhost` |
+-------------------------------------------------------------------------------+
2 rows in set (0,00 sec)

7.Conecta como 'root' otorga permiso de creación y borrado, así como de ejecución al usuario 'usujardineria' sobre una base de datos creada previamente.
create database ordenadores;
GRANT create,drop,execute ON ordenadores.* TO 'usujardineria'@'localhost';
8.Conecta como 'root' crea un usuario de nombre 'creartablasnba' que tenga permisos para crear, borrar y modificar tablas de nba.
create user 'creartablasnba'@'localhost' identified by 'Admin$2018';
GRANT create,drop,insert,alter ON nba.* TO 'creartablasnba'@'localhost';
9.Conecta como 'creartablasnba' crea un tabla sencilla de al menos dos columnas.
create table lesionados (codigo int (10) not null, nombre varchar(20));
10.Conecta como 'root' crea un usuario de nombre 'soloconsulta' que pueda realizar operaciones de consulta sobre todas las tablas de todas las bases de datos.
create user 'soloconsulta'@'localhost' identified by 'Admin$2018';
GRANT select ON *.* TO 'soloconsulta'@'localhost';
11.Añade a 'soloconsulta' el permiso de insertar en la tabla jugadores de nba.
GRANT insert ON nba.jugadores TO 'soloconsulta'@'localhost';
12.Conecta como 'soloconsulta' añade una fila a la tabla arboles creada anteriormente. Intenta borrar la fila creada. Describe la respuesta obtenida.
ERROR 1142 (42000): INSERT command denied to user 'soloconsulta'@'localhost' for table 'arboles'
13.Conecta como 'root' crea un usuario de nombre 'localaccess' que pueda seleccionar todas las tablas de la base de datos jardineria.
create user 'localaccess'@'localhost' identified by 'Admin$2018';
GRANT select ON jardineria.* TO 'localaccess'@'localhost';
14.Conecta como 'root' crea un usuario de nombre 'limitedaccess' que pueda realizar operaciones de inserción, actualización y consulta sobre la primera columna de la tabla creada previamente (arboles).
create user 'limitedaccess'@'localhost' identified by 'Admin$2018';
15.Conéctate como 'limitedaccess' y comprueba que tienes los permisos ejecutando las órdenes SQL SELECT, UPDATE e INSERT.
No tengo permiso para acceder ni modificar ninguna base de datos:
ERROR 1044 (42000): Access denied for user 'limitedaccess'@'localhost' to database 'jardineria'
16.Comprueba qué permisos tienes con el usuario actual.
show grants;
+---------------------------------------------------+
| Grants for limitedaccess@localhost                |
+---------------------------------------------------+
| GRANT USAGE ON *.* TO `limitedaccess`@`localhost` |
+---------------------------------------------------+
1 row in set (0,01 sec)
