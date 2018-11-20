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
