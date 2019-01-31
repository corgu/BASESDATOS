-- 1. Listado de clientes indicando nombre del cliente y cuántos pedidos ha efectuado.
select CodigoCliente,count(CodigoPedido) from Pedidos group by CodigoCliente;
+---------------+---------------------+
| CodigoCliente | count(CodigoPedido) |
+---------------+---------------------+
|             1 |                  11 |
|             3 |                   9 |
|             4 |                   5 |
|             5 |                   5 |
|             7 |                   5 |
|             9 |                   5 |
|            13 |                   5 |
|            14 |                   5 |
|            15 |                   5 |
|            16 |                  10 |
|            19 |                   5 |
|            23 |                   5 |
|            26 |                   5 |
|            27 |                   5 |
|            28 |                   5 |
|            30 |                  10 |
|            35 |                   5 |
|            36 |                   5 |
|            38 |                   5 |
+---------------+---------------------+
19 rows in set (0,00 sec)-- MAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAL TE PIDE EL NOMBRE NO EL CODIGO
2. Listado con los nombres de los clientes y el total pagado por cada uno de ellos.
 select p.Cantidad,c.nombreCliente from Pagos p,Clientes c where c.CodigoCliente=p.CodigoCliente;
+----------+--------------------------------+
| Cantidad | nombreCliente                  |
+----------+--------------------------------+
|  2000.00 | DGPRODUCTIONS GARDEN           |
|  2000.00 | DGPRODUCTIONS GARDEN           |
|  5000.00 | Gardening Associates           |
|  5000.00 | Gardening Associates           |
|   926.00 | Gardening Associates           |
| 20000.00 | Gerudo Valley                  |
| 20000.00 | Gerudo Valley                  |
| 20000.00 | Gerudo Valley                  |
| 20000.00 | Gerudo Valley                  |
|  1849.00 | Gerudo Valley                  |
| 23794.00 | Tendo Garden                   |
|  2390.00 | Beragua                        |
|   929.00 | Naturagua                      |
|  2246.00 | Camunas Jardines S.L.          |
|  4160.00 | Dardena S.A.                   |
|  2081.00 | Jardin de Flores               |
| 10000.00 | Jardin de Flores               |
|  4399.00 | Flores Marivi                  |
|   232.00 | Golf S.A.                      |
|   272.00 | Sotogrande                     |
| 18846.00 | Jardines y Mansiones CACTUS SL |
| 10972.00 | Jardinerías Matías SL          |
|  8489.00 | Agrojardin                     |
|  7863.00 | Jardineria Sara                |
|  3321.00 | Tutifruti S.A                  |
|  1171.00 | El Jardin Viviente S.L         |
+----------+--------------------------------+
26 rows in set (0,00 sec)

3. El nombre de los clientes que hayan hecho pedidos en 2009.
select p.FechaPedido,c.nombreCliente from Pedidos p,Clientes c where FechaPedido like '2009%';
-- CON ESTE SALEN LOS NOMBRES DE LOS CLIENTES REPETIDOS
4. El nombre del cliente y el nombre y apellido de sus representantes de los clientes de Madrid.
select c.nombreCliente,e.Nombre,e.Apellido1 from Clientes c,Empleados e where c.Ciudad='Madrid';
341 rows in set (0,00 sec)

5. Un listado de clientes con el nombre de su representante y la ciudad donde está su oficina.
select c.nombreCliente,e.Nombre,o.Ciudad from Clientes c,Empleados e,Oficinas o where CodigoEmpleadoRepVentas=CodigoEmpleado and o.Ciudad=c.Ciudad;
+--------------------------------+-----------------+---------------+
| nombreCliente                  | Nombre          | Ciudad        |
+--------------------------------+-----------------+---------------+
| DGPRODUCTIONS GARDEN           | Walter Santiago | San Francisco |
| Beragua                        | Emmanuel        | Madrid        |
| Club Golf Puerta del hierro    | Emmanuel        | Madrid        |
| Naturagua                      | Emmanuel        | Madrid        |
| DaraDistribuciones             | Emmanuel        | Madrid        |
| Madrileña de riegos            | Emmanuel        | Madrid        |
| Dardena S.A.                   | Mariano         | Madrid        |
| Jardin de Flores               | Julian          | Madrid        |
| Naturajardin                   | Julian          | Madrid        |
| AYMERICH GOLF MANAGEMENT, SL   | José Manuel     | Barcelona     |
| Jardines y Mansiones CACTUS SL | Lucio           | Madrid        |
| Jardinerías Matías SL          | Lucio           | Madrid        |
| france telecom                 | Lionel          | Paris         |
| Musée du Louvre                | Lionel          | Paris         |
| Tutifruti S.A                  | Mariko          | Sydney        |
| FLORES S.L.                    | Michael         | Madrid        |
| El Jardin Viviente S.L         | Mariko          | Sydney        |
+--------------------------------+-----------------+---------------+
17 rows in set (0,00 sec)

6. Nombre, apellidos, oficina y cargo de los empleados que no son reprentantes de ventas.
select Nombre,Apellido1,CodigoOficina,Puesto from Empleados where Puesto !='Representante Ventas';
+----------+------------+---------------+-----------------------+
| Nombre   | Apellido1  | CodigoOficina | Puesto                |
+----------+------------+---------------+-----------------------+
| Marcos   | Magaña     | TAL-ES        | Director General      |
| Ruben    | López      | TAL-ES        | Subdirector Marketing |
| Alberto  | Soria      | TAL-ES        | Subdirector Ventas    |
| Maria    | Solís      | TAL-ES        | Secretaria            |
| Carlos   | Soria      | MAD-ES        | Director Oficina      |
| Emmanuel | Magaña     | BCN-ES        | Director Oficina      |
| Francois | Fignon     | PAR-FR        | Director Oficina      |
| Michael  | Bolton     | SFC-USA       | Director Oficina      |
| Hilary   | Washington | BOS-USA       | Director Oficina      |
| Nei      | Nishikori  | TOK-JP        | Director Oficina      |
| Amy      | Johnson    | LON-UK        | Director Oficina      |
| Kevin    | Fallmer    | SYD-AU        | Director Oficina      |
+----------+------------+---------------+-----------------------+
12 rows in set (0,00 sec)

7. Número de empleados de cada oficina y ciudad donde está situada.
select o.CodigoOficina,o.ciudad,count(e.CodigoEmpleado) from Empleados e inner join Oficinas o on o.CodigoOficina=e.CodigoOficina group by CodigoOficina; 
+---------------+----------------------+-------------------------+
| CodigoOficina | ciudad               | count(e.CodigoEmpleado) |
+---------------+----------------------+-------------------------+
| BCN-ES        | Barcelona            |                       4 |
| BOS-USA       | Boston               |                       3 |
| LON-UK        | Londres              |                       3 |
| MAD-ES        | Madrid               |                       4 |
| PAR-FR        | Paris                |                       3 |
| SFC-USA       | San Francisco        |                       2 |
| SYD-AU        | Sydney               |                       3 |
| TAL-ES        | Talavera de la Reina |                       6 |
| TOK-JP        | Tokyo                |                       3 |
+---------------+----------------------+-------------------------+
9 rows in set (0,00 sec)

8. Listado con el nombre de los empleados y el nombre de sus jefes.
select E.nombre,J.nombre from Empleados E inner join Empleados J on E.CodigoJefe=J.CodigoEmpleado;
+-----------------+----------+
| nombre          | nombre   |
+-----------------+----------+
| Ruben           | Marcos   |
| Alberto         | Ruben    |
| Maria           | Ruben    |
| Felipe          | Alberto  |
| Juan Carlos     | Alberto  |
| Carlos          | Alberto  |
| Mariano         | Carlos   |
| Lucio           | Carlos   |
| Hilario         | Carlos   |
| Emmanuel        | Alberto  |
| José Manuel     | Emmanuel |
| David           | Emmanuel |
| Oscar           | Emmanuel |
| Francois        | Alberto  |
| Lionel          | Francois |
| Laurent         | Francois |
| Michael         | Alberto  |
| Walter Santiago | Michael  |
| Hilary          | Alberto  |
| Marcus          | Hilary   |
| Lorena          | Hilary   |
| Nei             | Alberto  |
| Narumi          | Nei      |
| Takuma          | Nei      |
| Amy             | Alberto  |
| Larry           | Amy      |
| John            | Amy      |
| Kevin           | Alberto  |
| Julian          | Kevin    |
| Mariko          | Kevin    |
+-----------------+----------+
30 rows in set (0,01 sec)

9. Media de unidades en stock de los productos agrupados por gama de producto.
select Nombre,avg(CantidadEnStock) from Productos group by Nombre; 
+-------------------------------------------------------------+----------------------+
| Nombre                                                      | avg(CantidadEnStock) |
+-------------------------------------------------------------+----------------------+
| Sierra de Poda 400MM                                        |              15.0000 |
| Pala                                                        |              15.0000 |
| Rastrillo de Jardín                                         |              15.0000 |
| Azadón                                                      |              15.0000 |
| Ajedrea                                                     |             140.0000 |
| Lavándula Dentata                                           |             140.0000 |
| Mejorana                                                    |             140.0000 |
| Melissa                                                     |             140.0000 |
| Mentha Sativa                                               |             140.0000 |
| Petrosilium Hortense (Peregil)                              |             140.0000 |
| Salvia Mix                                                  |             140.0000 |
| Thymus Citriodra (Tomillo limón)                            |             140.0000 |
| Thymus Vulgaris                                             |             140.0000 |
| Santolina Chamaecyparys                                     |             140.0000 |
| Expositor Cítricos Mix                                      |              15.0000 |
| Limonero 2 años injerto                                     |              15.0000 |
| Nectarina                                                   |             225.0000 |
| Nogal                                                       |              50.0000 |
| Olea-Olivos                                                 |              50.0000 |
| Peral                                                       |              50.0000 |
| Limonero 30/40                                              |              15.0000 |
| Kunquat                                                     |              15.0000 |
| Kunquat  EXTRA con FRUTA                                    |              15.0000 |
| Calamondin Mini                                             |              15.0000 |
| Calamondin Copa                                             |              15.0000 |
| Calamondin Copa EXTRA Con FRUTA                             |              15.0000 |
| Rosal bajo 1Âª -En maceta-inicio brotación                  |              15.0000 |
| ROSAL TREPADOR                                              |             225.0000 |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |             225.0000 |
| Naranjo -Plantón joven 1 año injerto                        |              15.0000 |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |             225.0000 |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |             225.0000 |
| Pitimini rojo                                               |             225.0000 |
| Rosal copa                                                  |             400.0000 |
| Albaricoquero Corbato                                       |             400.0000 |
| Albaricoquero Moniqui                                       |             400.0000 |
| Albaricoquero Kurrot                                        |             400.0000 |
| Cerezo Burlat                                               |             400.0000 |
| Cerezo Picota                                               |             400.0000 |
| Cerezo Napoleón                                             |             400.0000 |
| Naranjo 2 años injerto                                      |              15.0000 |
| Ciruelo R. Claudia Verde                                    |             400.0000 |
| Ciruelo Santa Rosa                                          |             400.0000 |
| Ciruelo Golden Japan                                        |             400.0000 |
| Ciruelo Friar                                               |             400.0000 |
| Ciruelo Reina C. De Ollins                                  |             400.0000 |
| Ciruelo Claudia Negra                                       |             400.0000 |
| Granado Mollar de Elche                                     |             400.0000 |
| Higuera Napolitana                                          |             400.0000 |
| Higuera Verdal                                              |             400.0000 |
| Higuera Breva                                               |             400.0000 |
| Naranjo calibre 8/10                                        |              15.0000 |
| Manzano Starking Delicious                                  |             400.0000 |
| Manzano Reineta                                             |             400.0000 |
| Manzano Golden Delicious                                    |             400.0000 |
| Membrillero Gigante de Wranja                               |             400.0000 |
| Melocotonero Spring Crest                                   |             400.0000 |
| Melocotonero Amarillo de Agosto                             |             400.0000 |
| Melocotonero Federica                                       |             400.0000 |
| Melocotonero Paraguayo                                      |             400.0000 |
| Nogal Común                                                 |             400.0000 |
| Parra Uva de Mesa                                           |             400.0000 |
| Mandarino -Plantón joven                                    |              15.0000 |
| Peral Castell                                               |             400.0000 |
| Peral Williams                                              |             400.0000 |
| Peral Conference                                            |             400.0000 |
| Peral Blanq. de Aranjuez                                    |             400.0000 |
| Níspero Tanaca                                              |             400.0000 |
| Olivo Cipresino                                             |             400.0000 |
| Kaki Rojo Brillante                                         |             400.0000 |
| Albaricoquero                                               |             200.0000 |
| Mandarino 2 años injerto                                    |              15.0000 |
| Cerezo                                                      |             102.1429 |
| Mandarino calibre 8/10                                      |              15.0000 |
| Ciruelo                                                     |              50.0000 |
| Granado                                                     |              50.0000 |
| Higuera                                                     |              50.0000 |
| Limonero -Plantón joven                                     |              15.0000 |
| Kaki                                                        |              50.0000 |
| Manzano                                                     |              50.0000 |
| Limonero calibre 8/10                                       |              15.0000 |
| Níspero                                                     |              50.0000 |
| Melocotonero                                                |              50.0000 |
| Membrillero                                                 |              50.0000 |
| Arbustos Mix Maceta                                         |              25.0000 |
| Mimosa Injerto CLASICA Dealbata                             |             100.0000 |
| Expositor Mimosa Semilla Mix                                |             100.0000 |
| Mimosa Semilla Bayleyana                                    |             100.0000 |
| Mimosa Semilla Bayleyana                                    |             100.0000 |
| Mimosa Semilla Cyanophylla                                  |             100.0000 |
| Mimosa Semilla Espectabilis                                 |             100.0000 |
| Mimosa Semilla Longifolia                                   |             100.0000 |
| Mimosa Semilla Floribunda 4 estaciones                      |             100.0000 |
| Abelia Floribunda                                           |             100.0000 |
| Callistemom (Mix)                                           |             100.0000 |
| Corylus Avellana "Contorta"                                 |             100.0000 |
| Escallonia (Mix)                                            |             120.0000 |
| Evonimus Emerald Gayeti                                     |             120.0000 |
| Evonimus Pulchellus                                         |             120.0000 |
| Forsytia Intermedia "Lynwood"                               |             120.0000 |
| Hibiscus Syriacus  "Diana" -Blanco Puro                     |             120.0000 |
| Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |             120.0000 |
| Hibiscus Syriacus "Pink Giant" Rosa                         |             120.0000 |
| Laurus Nobilis Arbusto - Ramificado Bajo                    |             120.0000 |
| Lonicera Nitida                                             |             120.0000 |
| Lonicera Nitida "Maigrum"                                   |             120.0000 |
| Lonicera Pileata                                            |             120.0000 |
| Philadelphus "Virginal"                                     |             120.0000 |
| Prunus pisardii                                             |             100.0000 |
| Viburnum Tinus "Eve Price"                                  |             120.0000 |
| Weigelia "Bristol Ruby"                                     |             120.0000 |
| Camelia japonica                                            |              50.0000 |
| Camelia japonica ejemplar                                   |              50.0000 |
| Callistemom COPA                                            |              50.0000 |
| Leptospermum formado PIRAMIDE                               |              50.0000 |
| Leptospermum COPA                                           |              50.0000 |
| Nerium oleander-CALIDAD "GARDEN"                            |              50.0000 |
| Nerium Oleander Arbusto GRANDE                              |             100.0000 |
| Nerium oleander COPA  Calibre 6/8                           |             100.0000 |
| Nerium oleander ARBOL Calibre 8/10                          |             100.0000 |
| Solanum Jazminoide                                          |             100.0000 |
| Wisteria Sinensis  azul, rosa, blanca                       |             100.0000 |
| Wisteria Sinensis INJERTADAS DECÃ“                          |             100.0000 |
| Bougamvillea Sanderiana Tutor                               |             100.0000 |
| Bougamvillea Sanderiana Espaldera                           |             100.0000 |
| Bougamvillea roja, naranja                                  |             100.0000 |
| Bougamvillea Sanderiana, 3 tut. piramide                    |             100.0000 |
| Expositor Árboles clima continental                         |             100.0000 |
| Expositor Árboles clima mediterráneo                        |             100.0000 |
| Expositor Árboles borde del mar                             |             100.0000 |
| Acer Negundo                                                |             100.0000 |
| Acer platanoides                                            |             100.0000 |
| Acer Pseudoplatanus                                         |             100.0000 |
| Brachychiton Acerifolius                                    |             100.0000 |
| Brachychiton Discolor                                       |             100.0000 |
| Brachychiton Rupestris                                      |             100.0000 |
| Cassia Corimbosa                                            |             100.0000 |
| Cassia Corimbosa                                            |             100.0000 |
| Chitalpa Summer Bells                                       |              80.0000 |
| Erytrina Kafra                                              |              80.0000 |
| Eucalyptus Citriodora                                       |              80.0000 |
| Eucalyptus Ficifolia                                        |              80.0000 |
| Eucalyptus Ficifolia                                        |              80.0000 |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |              80.0000 |
| Lagunaria Patersonii                                        |              80.0000 |
| Lagunaria Patersonii                                        |              80.0000 |
| Lagunaria patersonii  calibre 8/10                          |              80.0000 |
| Morus Alba                                                  |              80.0000 |
| Morus Alba  calibre 8/10                                    |              80.0000 |
| Platanus Acerifolia                                         |              80.0000 |
| Robinia Pseudoacacia Casque Rouge                           |              80.0000 |
| Salix Babylonica  Pendula                                   |              80.0000 |
| Sesbania Punicea                                            |              80.0000 |
| Tamarix  Ramosissima Pink Cascade                           |              80.0000 |
| Tecoma Stands                                               |              80.0000 |
| Tecoma Stands                                               |              80.0000 |
| Tipuana Tipu                                                |              80.0000 |
| Pleioblastus distichus-Bambú enano                          |              80.0000 |
| Sasa palmata                                                |              80.0000 |
| Phylostachys aurea                                          |              80.0000 |
| Phylostachys Bambusa Spectabilis                            |              80.0000 |
| Phylostachys biseti                                         |              80.0000 |
| Pseudosasa japonica (Metake)                                |              80.0000 |
| Pseudosasa japonica (Metake)                                |              80.0000 |
| Cedrus Deodara                                              |              80.0000 |
| Cedrus Deodara "Feeling Blue" Novedad                       |              80.0000 |
| Juniperus chinensis "Blue Alps"                             |              80.0000 |
| Juniperus Chinensis Stricta                                 |              80.0000 |
| Juniperus horizontalis Wiltonii                             |              80.0000 |
| Juniperus squamata "Blue Star"                              |              80.0000 |
| Juniperus x media Phitzeriana verde                         |              80.0000 |
| Pinus Canariensis                                           |              80.0000 |
| Pinus Halepensis                                            |              80.0000 |
| Pinus Pinea -Pino Piñonero                                  |              80.0000 |
| Thuja Esmeralda                                             |              80.0000 |
| Tuja Occidentalis Woodwardii                                |              80.0000 |
| Tuja orientalis "Aurea nana"                                |              80.0000 |
| Archontophoenix Cunninghamiana                              |              80.0000 |
| Beucarnea Recurvata                                         |               3.5000 |
| Bismarckia Nobilis                                          |               4.0000 |
| Brahea Armata                                               |              50.0000 |
| Brahea Edulis                                               |             100.0000 |
| Butia Capitata                                              |             100.0000 |
| Chamaerops Humilis                                          |             100.0000 |
| Chamaerops Humilis "Cerifera"                               |             100.0000 |
| Chrysalidocarpus Lutescens -ARECA                           |             100.0000 |
| Cordyline Australis -DRACAENA                               |             100.0000 |
| Cycas Revoluta                                              |             100.0000 |
| Dracaena Drago                                              |               1.6667 |
| Jubaea Chilensis                                            |             100.0000 |
| Livistonia Australis                                        |              50.0000 |
| Livistonia Decipiens                                        |              50.0000 |
| Phoenix Canariensis                                         |              50.0000 |
| Rhaphis Excelsa                                             |              50.0000 |
| Rhaphis Humilis                                             |              50.0000 |
| Sabal Minor                                                 |              50.0000 |
| Trachycarpus Fortunei                                       |              26.0000 |
| Washingtonia Robusta                                        |              15.0000 |
| Yucca Jewel                                                 |              15.0000 |
| Zamia Furfuracaea                                           |              15.0000 |
| Mimosa DEALBATA Gaulois Astier                              |             100.0000 |
+-------------------------------------------------------------+----------------------+
201 rows in set (0,02 sec)
10. Clientes que residen en ciudades donde hay oficina, indicando dirección de la oficina.
select c.NombreCliente,c.ciudad,o.LineaDireccion1 from Clientes c,Oficinas o where c.ciudad=o.ciudad;
+--------------------------------+---------------+------------------------------+
| NombreCliente                  | ciudad        | LineaDireccion1              |
+--------------------------------+---------------+------------------------------+
| DGPRODUCTIONS GARDEN           | San Francisco | 100 Market Street            |
| Beragua                        | Madrid        | Bulevar Indalecio Prieto, 32 |
| Club Golf Puerta del hierro    | Madrid        | Bulevar Indalecio Prieto, 32 |
| Naturagua                      | Madrid        | Bulevar Indalecio Prieto, 32 |
| DaraDistribuciones             | Madrid        | Bulevar Indalecio Prieto, 32 |
| Madrileña de riegos            | Madrid        | Bulevar Indalecio Prieto, 32 |
| Dardena S.A.                   | Madrid        | Bulevar Indalecio Prieto, 32 |
| Jardin de Flores               | Madrid        | Bulevar Indalecio Prieto, 32 |
| Naturajardin                   | Madrid        | Bulevar Indalecio Prieto, 32 |
| AYMERICH GOLF MANAGEMENT, SL   | Barcelona     | Avenida Diagonal, 38         |
| Jardines y Mansiones CACTUS SL | Madrid        | Bulevar Indalecio Prieto, 32 |
| Jardinerías Matías SL          | Madrid        | Bulevar Indalecio Prieto, 32 |
| france telecom                 | Paris         | 29 Rue Jouffroy d'abbans     |
| Musée du Louvre                | Paris         | 29 Rue Jouffroy d'abbans     |
| Tutifruti S.A                  | Sydney        | 5-11 Wentworth Avenue        |
| FLORES S.L.                    | Madrid        | Bulevar Indalecio Prieto, 32 |
| El Jardin Viviente S.L         | Sydney        | 5-11 Wentworth Avenue        |
+--------------------------------+---------------+------------------------------+
17 rows in set (0,00 sec)

11. Clientes que residen en ciudades donde no hay oficina, indicando la ciudad en la que viven
select c.NombreCliente,c.ciudad from Clientes c where ciudad not in(select ciudad from Oficinas);
+-----------------------+--------------------------+
| NombreCliente         | ciudad                   |
+-----------------------+--------------------------+
| Gardening Associates  | Miami                    |
| Gerudo Valley         | New York                 |
| Tendo Garden          | Miami                    |
| Lasas S.A.            | Fuenlabrada              |
| Lasas S.A.            | Fuenlabrada              |
| Camunas Jardines S.L. | San Lorenzo del Escorial |
| Flores Marivi         | Fuenlabrada              |
| Flowers, S.A          | Montornes del valles     |
| Golf S.A.             | Santa cruz de Tenerife   |
| Aloha                 | Canarias                 |
| El Prat               |  Barcelona               |
| Sotogrande            | Sotogrande               |
| Vivero Humanes        | Humanes                  |
| Fuenla City           | Fuenlabrada              |
| Agrojardin            | Getafe                   |
| Top Campo             | Humanes                  |
| Jardineria Sara       | Fenlabrada               |
| Campohermoso          | Fuenlabrada              |
| THE MAGIC GARDEN      | London                   |
+-----------------------+--------------------------+
19 rows in set (0,00 sec)

12. Número de clientes asignados a cada representante de ventas.
select e.CodigoEmpleado,e.Nombre,count(c.CodigoEmpleadoRepVentas) as 'nº clientes'from Empleados inner join Clientes on e.CodigoEmpleado = c.CodigoEmpleadoRepVentas group by c.CodigoEmpleadoRepVentas;
+----------------+-----------------+--------------+
| CodigoEmpleado | Nombre          | nº clientes  |
+----------------+-----------------+--------------+
|              5 | Felipe          |            5 |
|              8 | Mariano         |            4 |
|              9 | Lucio           |            2 |
|             11 | Emmanuel        |            5 |
|             12 | José Manuel     |            5 |
|             16 | Lionel          |            2 |
|             18 | Michael         |            2 |
|             19 | Walter Santiago |            2 |
|             22 | Lorena          |            2 |
|             30 | Julian          |            5 |
|             31 | Mariko          |            2 |
+----------------+-----------------+--------------+
11 rows in set (0,02 sec)

13. Listado con el precio total de cada pedido.
select CodigoPedido, sum(Cantidad * PrecioUnidad) as 'precio sin iva' from DetallePedidos group by CodigoPedido;
+--------------+----------------+
| CodigoPedido | precio sin iva |
+--------------+----------------+
|            1 |        1567.00 |
|            2 |        7113.00 |
|            3 |       10850.00 |
|            4 |        2624.00 |
|            8 |        1065.00 |
|            9 |        2535.00 |
|           10 |        2920.00 |
|           11 |         820.00 |
|           12 |         290.00 |
|           13 |         738.00 |
|           14 |         829.00 |
|           15 |         214.00 |
|           16 |         234.00 |
|           17 |         375.00 |
|           18 |         116.00 |
|           19 |         333.00 |
|           20 |         292.00 |
|           21 |         182.00 |
|           22 |           6.00 |
|           23 |        1640.00 |
|           24 |         287.00 |
|           25 |        1455.00 |
|           26 |         675.00 |
|           27 |         504.00 |
|           28 |        2052.00 |
|           29 |        1324.00 |
|           30 |         711.00 |
|           31 |         244.00 |
|           32 |        3089.00 |
|           33 |       73226.00 |
|           34 |        1532.00 |
|           35 |        1718.00 |
|           36 |         311.00 |
|           37 |        2284.00 |
|           38 |          98.00 |
|           39 |         108.00 |
|           40 |          12.00 |
|           41 |          10.00 |
|           42 |           4.00 |
|           43 |           9.00 |
|           44 |           5.00 |
|           45 |          10.00 |
|           46 |          84.00 |
|           47 |         164.00 |
|           48 |        6398.00 |
|           49 |         625.00 |
|           50 |        3506.00 |
|           51 |        7750.00 |
|           53 |         141.00 |
|           54 |         669.00 |
|           55 |        1569.00 |
|           56 |         377.00 |
|           57 |         773.00 |
|           58 |        4775.00 |
|           74 |        3562.00 |
|           75 |        1048.00 |
|           76 |        2223.00 |
|           77 |         588.00 |
|           78 |        4660.00 |
|           79 |         300.00 |
|           80 |        5773.00 |
|           81 |         120.00 |
|           82 |        2176.00 |
|           83 |         120.00 |
|           89 |         710.00 |
|           90 |          41.00 |
|           91 |        1384.00 |
|           92 |        2906.00 |
|           93 |         882.00 |
|           94 |        5759.00 |
|           95 |         605.00 |
|           96 |         660.00 |
|           97 |         322.00 |
|           98 |        1024.00 |
|           99 |        2070.00 |
|          100 |         800.00 |
|          101 |         209.00 |
|          102 |         660.00 |
|          103 |         304.00 |
|          104 |        1760.00 |
|          105 |        1506.00 |
|          106 |        1077.00 |
|          107 |        3216.00 |
|          108 |         660.00 |
|          109 |         553.00 |
|          110 |         149.00 |
|          116 |         264.00 |
|          117 |         154.00 |
|          128 |          51.00 |
+--------------+----------------+
89 rows in set (0,02 sec)

14. Clientes que hayan hecho pedidos en 2008 por importe superior a 2000 euros.
select c.NombreCliente from Clientes c,Pedidos p,Pagos pa where FechaPedido like'2008%' and pa.Cantidad>2000 group by c.NombreCliente;
+--------------------------------+
| NombreCliente                  |
+--------------------------------+
| DGPRODUCTIONS GARDEN           |
| Gardening Associates           |
| Gerudo Valley                  |
| Tendo Garden                   |
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| AYMERICH GOLF MANAGEMENT, SL   |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones CACTUS SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Top Campo                      |
| Jardineria Sara                |
| Campohermoso                   |
| france telecom                 |
| Musée du Louvre                |
| Tutifruti S.A                  |
| FLORES S.L.                    |
| THE MAGIC GARDEN               |
| El Jardin Viviente S.L         |
+--------------------------------+
35 rows in set, 1 warning (0,03 sec)

15. Cuántos pedidos tiene cada cliente en cada estado.
select CodigoCliente, Estado, count(Estado) as 'nº pedidos' from Pedidos group by Estado, CodigoCliente order by 1 asc;
+---------------+-----------+-------------+
| CodigoCliente | Estado    | nº pedidos  |
+---------------+-----------+-------------+
|             1 | Pendiente |           4 |
|             1 | Entregado |           5 |
|             1 | Rechazado |           2 |
|             3 | Rechazado |           2 |
|             3 | Entregado |           5 |
|             3 | Pendiente |           2 |
|             4 | Entregado |           2 |
|             4 | Rechazado |           2 |
|             4 | Pendiente |           1 |
|             5 | Entregado |           2 |
|             5 | Rechazado |           2 |
|             5 | Pendiente |           1 |
|             7 | entregado |           4 |
|             7 | rechazado |           1 |
|             9 | entregado |           2 |
|             9 | pendiente |           2 |
|             9 | rechazado |           1 |
|            13 | Pendiente |           1 |
|            13 | Entregado |           2 |
|            13 | Rechazado |           2 |
|            14 | Pendiente |           1 |
|            14 | Rechazado |           1 |
|            14 | Entregado |           3 |
|            15 | Rechazado |           1 |
|            15 | Entregado |           3 |
|            15 | Pendiente |           1 |
|            16 | Pendiente |           2 |
|            16 | Entregado |           6 |
|            16 | Rechazado |           2 |
|            19 | Entregado |           3 |
|            19 | Pendiente |           1 |
|            19 | Rechazado |           1 |
|            23 | Pendiente |           2 |
|            23 | Entregado |           2 |
|            23 | Rechazado |           1 |
|            26 | Entregado |           3 |
|            26 | Pendiente |           2 |
|            27 | Pendiente |           2 |
|            27 | Entregado |           3 |
|            28 | Entregado |           3 |
|            28 | Pendiente |           1 |
|            28 | Rechazado |           1 |
|            30 | Entregado |           4 |
|            30 | Rechazado |           2 |
|            30 | Pendiente |           4 |
|            35 | Entregado |           4 |
|            35 | Pediente  |           1 |
|            36 | Entregado |           2 |
|            36 | Pendiente |           2 |
|            36 | Rechazado |           1 |
|            38 | Entregado |           3 |
|            38 | Rechazado |           2 |
+---------------+-----------+-------------+
52 rows in set (0,03 sec)

16. Los clientes que hayan pedido más de 200 unidades de cualquier producto.
select c.NombreCliente,d.Cantidad from DetallePedidos d,Clientes c where Cantidad >200;
+--------------------------------+----------+
| NombreCliente                  | Cantidad |
+--------------------------------+----------+
| DGPRODUCTIONS GARDEN           |      450 |
| Gardening Associates           |      450 |
| Gerudo Valley                  |      450 |
| Tendo Garden                   |      450 |
| Lasas S.A.                     |      450 |
| Beragua                        |      450 |
| Club Golf Puerta del hierro    |      450 |
| Naturagua                      |      450 |
| DaraDistribuciones             |      450 |
| Madrileña de riegos            |      450 |
| Lasas S.A.                     |      450 |
| Camunas Jardines S.L.          |      450 |
| Dardena S.A.                   |      450 |
| Jardin de Flores               |      450 |
| Flores Marivi                  |      450 |
| Flowers, S.A                   |      450 |
| Naturajardin                   |      450 |
| Golf S.A.                      |      450 |
| AYMERICH GOLF MANAGEMENT, SL   |      450 |
| Aloha                          |      450 |
| El Prat                        |      450 |
| Sotogrande                     |      450 |
| Vivero Humanes                 |      450 |
| Fuenla City                    |      450 |
| Jardines y Mansiones CACTUS SL |      450 |
| Jardinerías Matías SL          |      450 |
| Agrojardin                     |      450 |
| Top Campo                      |      450 |
| Jardineria Sara                |      450 |
| Campohermoso                   |      450 |
| france telecom                 |      450 |
| Musée du Louvre                |      450 |
| Tutifruti S.A                  |      450 |
| FLORES S.L.                    |      450 |
| THE MAGIC GARDEN               |      450 |
| El Jardin Viviente S.L         |      450 |
| DGPRODUCTIONS GARDEN           |      290 |
| Gardening Associates           |      290 |
| Gerudo Valley                  |      290 |
| Tendo Garden                   |      290 |
| Lasas S.A.                     |      290 |
| Beragua                        |      290 |
| Club Golf Puerta del hierro    |      290 |
| Naturagua                      |      290 |
| DaraDistribuciones             |      290 |
| Madrileña de riegos            |      290 |
| Lasas S.A.                     |      290 |
| Camunas Jardines S.L.          |      290 |
| Dardena S.A.                   |      290 |
| Jardin de Flores               |      290 |
| Flores Marivi                  |      290 |
| Flowers, S.A                   |      290 |
| Naturajardin                   |      290 |
| Golf S.A.                      |      290 |
| AYMERICH GOLF MANAGEMENT, SL   |      290 |
| Aloha                          |      290 |
| El Prat                        |      290 |
| Sotogrande                     |      290 |
| Vivero Humanes                 |      290 |
| Fuenla City                    |      290 |
| Jardines y Mansiones CACTUS SL |      290 |
| Jardinerías Matías SL          |      290 |
| Agrojardin                     |      290 |
| Top Campo                      |      290 |
| Jardineria Sara                |      290 |
| Campohermoso                   |      290 |
| france telecom                 |      290 |
| Musée du Louvre                |      290 |
| Tutifruti S.A                  |      290 |
| FLORES S.L.                    |      290 |
| THE MAGIC GARDEN               |      290 |
| El Jardin Viviente S.L         |      290 |
| DGPRODUCTIONS GARDEN           |      423 |
| Gardening Associates           |      423 |
| Gerudo Valley                  |      423 |
| Tendo Garden                   |      423 |
| Lasas S.A.                     |      423 |
| Beragua                        |      423 |
| Club Golf Puerta del hierro    |      423 |
| Naturagua                      |      423 |
| DaraDistribuciones             |      423 |
| Madrileña de riegos            |      423 |
| Lasas S.A.                     |      423 |
| Camunas Jardines S.L.          |      423 |
| Dardena S.A.                   |      423 |
| Jardin de Flores               |      423 |
| Flores Marivi                  |      423 |
| Flowers, S.A                   |      423 |
| Naturajardin                   |      423 |
| Golf S.A.                      |      423 |
| AYMERICH GOLF MANAGEMENT, SL   |      423 |
| Aloha                          |      423 |
| El Prat                        |      423 |
| Sotogrande                     |      423 |
| Vivero Humanes                 |      423 |
| Fuenla City                    |      423 |
| Jardines y Mansiones CACTUS SL |      423 |
| Jardinerías Matías SL          |      423 |
| Agrojardin                     |      423 |
| Top Campo                      |      423 |
| Jardineria Sara                |      423 |
| Campohermoso                   |      423 |
| france telecom                 |      423 |
| Musée du Louvre                |      423 |
| Tutifruti S.A                  |      423 |
| FLORES S.L.                    |      423 |
| THE MAGIC GARDEN               |      423 |
| El Jardin Viviente S.L         |      423 |
| DGPRODUCTIONS GARDEN           |      212 |
| Gardening Associates           |      212 |
| Gerudo Valley                  |      212 |
| Tendo Garden                   |      212 |
| Lasas S.A.                     |      212 |
| Beragua                        |      212 |
| Club Golf Puerta del hierro    |      212 |
| Naturagua                      |      212 |
| DaraDistribuciones             |      212 |
| Madrileña de riegos            |      212 |
| Lasas S.A.                     |      212 |
| Camunas Jardines S.L.          |      212 |
| Dardena S.A.                   |      212 |
| Jardin de Flores               |      212 |
| Flores Marivi                  |      212 |
| Flowers, S.A                   |      212 |
| Naturajardin                   |      212 |
| Golf S.A.                      |      212 |
| AYMERICH GOLF MANAGEMENT, SL   |      212 |
| Aloha                          |      212 |
| El Prat                        |      212 |
| Sotogrande                     |      212 |
| Vivero Humanes                 |      212 |
| Fuenla City                    |      212 |
| Jardines y Mansiones CACTUS SL |      212 |
| Jardinerías Matías SL          |      212 |
| Agrojardin                     |      212 |
| Top Campo                      |      212 |
| Jardineria Sara                |      212 |
| Campohermoso                   |      212 |
| france telecom                 |      212 |
| Musée du Louvre                |      212 |
| Tutifruti S.A                  |      212 |
| FLORES S.L.                    |      212 |
| THE MAGIC GARDEN               |      212 |
| El Jardin Viviente S.L         |      212 |
| DGPRODUCTIONS GARDEN           |      203 |
| Gardening Associates           |      203 |
| Gerudo Valley                  |      203 |
| Tendo Garden                   |      203 |
| Lasas S.A.                     |      203 |
| Beragua                        |      203 |
| Club Golf Puerta del hierro    |      203 |
| Naturagua                      |      203 |
| DaraDistribuciones             |      203 |
| Madrileña de riegos            |      203 |
| Lasas S.A.                     |      203 |
| Camunas Jardines S.L.          |      203 |
| Dardena S.A.                   |      203 |
| Jardin de Flores               |      203 |
| Flores Marivi                  |      203 |
| Flowers, S.A                   |      203 |
| Naturajardin                   |      203 |
| Golf S.A.                      |      203 |
| AYMERICH GOLF MANAGEMENT, SL   |      203 |
| Aloha                          |      203 |
| El Prat                        |      203 |
| Sotogrande                     |      203 |
| Vivero Humanes                 |      203 |
| Fuenla City                    |      203 |
| Jardines y Mansiones CACTUS SL |      203 |
| Jardinerías Matías SL          |      203 |
| Agrojardin                     |      203 |
| Top Campo                      |      203 |
| Jardineria Sara                |      203 |
| Campohermoso                   |      203 |
| france telecom                 |      203 |
| Musée du Louvre                |      203 |
| Tutifruti S.A                  |      203 |
| FLORES S.L.                    |      203 |
| THE MAGIC GARDEN               |      203 |
| El Jardin Viviente S.L         |      203 |
| DGPRODUCTIONS GARDEN           |      250 |
| Gardening Associates           |      250 |
| Gerudo Valley                  |      250 |
| Tendo Garden                   |      250 |
| Lasas S.A.                     |      250 |
| Beragua                        |      250 |
| Club Golf Puerta del hierro    |      250 |
| Naturagua                      |      250 |
| DaraDistribuciones             |      250 |
| Madrileña de riegos            |      250 |
| Lasas S.A.                     |      250 |
| Camunas Jardines S.L.          |      250 |
| Dardena S.A.                   |      250 |
| Jardin de Flores               |      250 |
| Flores Marivi                  |      250 |
| Flowers, S.A                   |      250 |
| Naturajardin                   |      250 |
| Golf S.A.                      |      250 |
| AYMERICH GOLF MANAGEMENT, SL   |      250 |
| Aloha                          |      250 |
| El Prat                        |      250 |
| Sotogrande                     |      250 |
| Vivero Humanes                 |      250 |
| Fuenla City                    |      250 |
| Jardines y Mansiones CACTUS SL |      250 |
| Jardinerías Matías SL          |      250 |
| Agrojardin                     |      250 |
| Top Campo                      |      250 |
| Jardineria Sara                |      250 |
| Campohermoso                   |      250 |
| france telecom                 |      250 |
| Musée du Louvre                |      250 |
| Tutifruti S.A                  |      250 |
| FLORES S.L.                    |      250 |
| THE MAGIC GARDEN               |      250 |
| El Jardin Viviente S.L         |      250 |
| DGPRODUCTIONS GARDEN           |      231 |
| Gardening Associates           |      231 |
| Gerudo Valley                  |      231 |
| Tendo Garden                   |      231 |
| Lasas S.A.                     |      231 |
| Beragua                        |      231 |
| Club Golf Puerta del hierro    |      231 |
| Naturagua                      |      231 |
| DaraDistribuciones             |      231 |
| Madrileña de riegos            |      231 |
| Lasas S.A.                     |      231 |
| Camunas Jardines S.L.          |      231 |
| Dardena S.A.                   |      231 |
| Jardin de Flores               |      231 |
| Flores Marivi                  |      231 |
| Flowers, S.A                   |      231 |
| Naturajardin                   |      231 |
| Golf S.A.                      |      231 |
| AYMERICH GOLF MANAGEMENT, SL   |      231 |
| Aloha                          |      231 |
| El Prat                        |      231 |
| Sotogrande                     |      231 |
| Vivero Humanes                 |      231 |
| Fuenla City                    |      231 |
| Jardines y Mansiones CACTUS SL |      231 |
| Jardinerías Matías SL          |      231 |
| Agrojardin                     |      231 |
| Top Campo                      |      231 |
| Jardineria Sara                |      231 |
| Campohermoso                   |      231 |
| france telecom                 |      231 |
| Musée du Louvre                |      231 |
| Tutifruti S.A                  |      231 |
| FLORES S.L.                    |      231 |
| THE MAGIC GARDEN               |      231 |
| El Jardin Viviente S.L         |      231 |
+--------------------------------+----------+
252 rows in set (0,00 sec)

17. Cliente que hizo el pedido de mayor cuantía e importe.
select c.NombreCliente,p.Cantidad from Clientes c,Pagos p order by Cantidad DESC LIMIT 1;
+---------------+----------+
| NombreCliente | Cantidad |
+---------------+----------+
| Lasas S.A.    | 23794.00 |
+---------------+----------+
1 row in set (0,00 sec)

18. Cliente que hizo el pedido de menor cuantía e importe.
select c.NombreCliente,p.Cantidad from Clientes c,Pagos p order by Cantidad ASC LIMIT 1;
+---------------+----------+
| NombreCliente | Cantidad |
+---------------+----------+
| Lasas S.A.    |   232.00 |
+---------------+----------+
1 row in set (0,00 sec)
