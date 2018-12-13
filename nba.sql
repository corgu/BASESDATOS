/*antes de nada poner*/
sudo mysql -u root -p
/*importar archivos al terminal*/
mysql -h -root -p nombrequequieresponerle<ejemplo: fichero.sql>
/*ver registros de la tabla*/
select * from nombretabla;
/*seleccionar una de las columnas*/
select nombrecolumna from nombretabla;
/*seleccionar las filas en las que ponga esa palabra*/
select nombrecolumna from nombretabla where nombrecolumna='nombre';
/*nos cuenta el numero de filas que hay */
select count(*) from nombretabla where nombrecolumna='nombre';
/*nos busca los datos que sean mayores que el dato que hemos escrito*/
select nombrecolumna from nombre where nombrecolumna>numerodato;
/*nos busca los jugadores que tengan la procedencia de uno de esos paises*/
select nombrecolumna from nombretabla where nombrecolumna in ('spain','germany','china');
/*mostrar el dato maximo maxima*/
select max(nombrecolumna) from nombretabla;
/*nos ordena del mayor a menor altura*/
select nombretabla from nombretabla order by nombretabla desc;
/*personas con esa palabra en su nombre*/
select * from jugadores where nombre like '%john%';
