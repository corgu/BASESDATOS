1. Localiza los índices ya presentes en la BD employees. ¿Cuáles son y a qué campos afectan?

show index from employees;
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employees |          0 | PRIMARY         |            1 | emp_no      | A         |      299246 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employees |          1 | employees_birth |            1 | birth_date  | A         |        4816 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,02 sec)


2. Explica brevemente la utilidad de introducir índices en la BD.

Los índices nos permiten optimizar las consultas en una base de datos. De ésta manera, reduciríamos
bastante el tiempo de ejecución de la consulta. Ésta reducción de tiempo, la podríamos observar claramente
en las tablas que ocupen gran tamaño, en tablas pequenias no se notaría gran diferencia, ya que 
se tardaría lo mismo en acceder al índice, como en acceder a la tabla.

Gracias a los índices podremos encontrar las filas que contienen los valores específicos de las columnas
que empleamos en la consulta rápidamente, en lugar de que MYSQL vaya fila por fila buscando las filas
que cumplen los requisitos de la consulta.

La configuración de índices en nuestra base de datos es esencial a la hora de ofrecer un buen servicio.

3. Indica cómo mejorarías el rendimiento de consultas de empleados por apellidos.

Después de analizar los diferente índices que se pueden crear y las condiciones que deben cumplir cada
uno de ellos, para mejorar el rendimiento de las consultas de empleados con un único campo (apellidos),
utilizaríamos el tipo de índice FULLTEXT para mejorar el rendimiento de consultas, el cual se emplea para 
realizar búsquedas de char, varchar y text.

Está compuestos por todas las palabras que hay en la columna que contiene el índice, además de no aplicar
restricciones. Mejora el tiempo de ejecución de las consultas.

Al emplear el índice mencionado, podremos encontrar filas que cumplan la condición WHERE; recuperaremos las filas
de otras tablas cuando se emplean operaciones de tipo JOIN; disminuiremos el tiempo de ejecución de las
consultas con ORDER BY o GROUP BY si todas las columnas presentes forman parte de un índice; si la consulta emplea una condición
indexada, las filas serán recuperadas a partir del índice, sin pasar a consultar tabla.

