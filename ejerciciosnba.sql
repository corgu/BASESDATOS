/*sacar el peso y pasarlo de kg a libras de los jugadores que pesen entre 200 y 250*/
select nombre,peso/2.20462 from jugadores where peso between 200 and 250;
/*escribir un texto*/
select nombre,peso/2.20462 as 'peso en kg'from jugadores where peso between 200 and 250;
/*sacar el maximo peso*/
select max(peso) from jugadores;
 /*sacar peso medio de jugadores*/
 select avg(peso) from jugadores where nombre_equipo=('knicks');
/*sacar jugadores que juegan en los angeles le hemos llamado j y e para que no salga tan largo. lo del and es para que no se duplique la columna*/
select j.nombre, e.nombre, e.ciudad from jugadores j, equipos e where ciudad='los angeles' and j.nombre_equipo=e.nombre;
/*jugadores de la conferencia oeste que mide mas de 8 pies*/
select j.nombre,e.nombre from jugadores j,equipos e where altura>'7-0' and j.nombre_equipo=e.nombre and e.conferencia='west';