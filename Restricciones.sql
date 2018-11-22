-- restriccion a nivel de tabla
create table empleados(
	cedula int(8), 
    nombre varchar(30),
    apellido varchar(30),
    cargo varchar(30),
    tiempo_servicio int,
    primary key(cedula)
);
-- crear varios datos a la vez 
insert into empleados values 
(5352523,'joseluis','fernandez','mantenimiento',3),
(356363,'marco','asensio','administracion',6),
(543543,'lucas','fernandez','gestion',2);
-- INT AUTO INCREMENT sirve para rellenar automaticamente el campo con el siguiente numero entero
CREATE TABLE proveedores(
codigo INT AUTO_INCREMENT,
nombre VARCHAR(20),
direccion VARCHAR(50),
pago FLOAT,
primary key(CODIGO)
);
-- Cuando un atributo de una tabla, correspone a la clave primaria de otra table, se una esto
CREATE TABLE nombretabla (codigonombre INT AUTO_INCREMENT, codigo_provee INT, nombre VARCHAR(40), precio FLOAT, disponible INT,
primary key(codigonombre),foreign key(codigo_provee) REFERENCES proveedores(codigo));
-- Añadimos on delete cascate on update cascade para que cuanto corrijamos un dato en una de las tablas, se corrija en la otra
-- enlazada
CREATE TABLE nombretabla (codigop INT AUTO_INCREMENT, codigo_provee INT, nombre VARCHAR(40), precio FLOAT, disponible INT, 
primary key(codigonombre),foreign key(codigo_provee) REFERENCES proveedores(codigo) ON DELETE CASCADE ON UPDATE CASCADE);
-- eliminar restricciones de una tabla
alter table nombretabla drop foreign key nombretabla_ibfk_1;
-- añadir restricciones de una tabla
alter table nombretabla add foreign key (codigo_nombre) references nombretabla(codigo) ON DELETE CASCADE ON UPDATE CASCADE;
-- Eliminar todos los datos de una tabla
truncate table nombretabla;
-- Muestra que registro es NULL
select*from nombretabla where nombrecampo is null;
-- Muestra que registro es = a un registro
select*from nombretabla where nombrecampo=dato;
-- para que no acepte valores nulos poniendo not null
CREATE TABLE coral2(
codigo INT auto_increment,
nombre varchar(20) NOT NULL,
direccion varchar (50),
pago float,
primary key(codigo));
-- ejemplo para no permitir que existan numeros negativos UNSIGNED en numeros enteros
create table campos( 
codigo int unsigned, 
edad bigint unsigned, 
goles smallint unsigned, 
faltas bigint unsigned, 
jugadores tinyint unsigned);
-- ejemplo de diferentes tipos de fechas
create table fechas( 
actual date NOT NULL,
 final timestamp NOT NULL,
 cierre time NOT NULL, 
 apertura datetime NOT NULL,
 inauguracion year NOT NULL, 
 fundacion year(4) NOT NULL);
-- usar default por defecto
create table farmacia(
codigo int default 123, 
fecha date default '2018-11-13', 
empleados smallint default 7, 
gerente char(1) default 'N' , 
calle varchar(20) default 'poligono');
-- zerofill sirve para que si no cubres el cupo de 6(en este caso), te lo rellena con 6
create table ventas(
codigo int(6) zerofill auto_increment,
cod_empleado varchar(40) not null,
cod_producto varchar (30),
precio decimal (5,2) unsigned,
cantidad smallint zerofill,
fecha_hora datetime,
primary key(codigo));