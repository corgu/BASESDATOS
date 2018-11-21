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
