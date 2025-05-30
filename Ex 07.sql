CREATE DATABASE ejercicio_07;
USE ejercicio_07;

CREATE TABLE provincias (
cod_pro char(2) not null primary key,
nombre_provincia varchar(50)
);
CREATE TABLE pueblos (
cod_pue char(3) not null primary key,
nombre_pueblo varchar(50),
cod_pro char(2) not null
);
CREATE TABLE clientes (
cod_cli int not null primary key auto_increment,
nombre_cliente varchar(100) not null,
direccion_cli varchar(100) not null,
codpostal_cli char(5),
cod_pue char(3)
);
CREATE TABLE vendedores (
cod_ven int not null primary key auto_increment,
nombre_vendedor varchar(100) not null,
direccion_ven varchar(100) not null,
codpostal_ven char(5),
cod_pue char(3)
);
CREATE TABLE articulos (
cod_art int not null primary key auto_increment,
descripcion_art varchar(100) not null,
precio_art decimal(8,2),
stock_art int,
stock_min int
);
CREATE TABLE facturas (
cod_fac int not null primary key auto_increment,
fecha_fac datetime,
cod_ven int,
cod_cli int,
iva int,
descuento_fac decimal(5,2)
);
CREATE TABLE lineas_fac (
cod_lin_fac int not null primary key auto_increment,
cod_fac int,
cant_lin decimal(8,2),
cod_art int,
precio decimal(8,2),
descuento_lin decimal(5,2)
);
insert into provincias (cod_pro, nombre_provincia) VALUES
("BA", "Barcelona"), ("GI", "Girona"), ("TA", "Tarragona"), ("LL", "Lleida");
SELECT nombre_provincia FROM provincias;


/*



Nota: L as claves foráneas en los modelos relacionales presentes en este documento se representan en cursiva y
negrita. 
 1. Mostrar las provincias 
2. Nombre y código de las provincias. 
3. Mostrar el código de los arYculos y el doble del precio de cada arYculo. 
4. Mostrar el código de la factura, número de línea e importe de cada línea (sin considerar impuestos 
ni descuentos. 
5. Mostrar los dis8ntos 8pos de IVA aplicados en las facturas. 
8
hps://docs.google.com/document/d/1YUW3DyXscHNKV5iszTRJ -vnKDElzEYDQh7IyV8lqEp4/edit#heading=h.45xqg0sz9w7c
6. Mostrar el código y nombre de aquellas provincias cuyo código es menor a 20. 
7. Mostrar los dis8ntos 8pos de descuento de aplicados por los vendedores que cuyos códigos no 
superan el valor 50. 
 
8. Mostrar el código y descripción de aquellos arYculos cuyo stock es igual o supera los 50 unidades. 
9. Mostrar el código y fechas de las facturas con IVA 16 y que pertenecen al cliente de código 100. 
10. Mostrar el código y fechas de las facturas con IVA 16 o con descuento 20 y que pertenecen al 
cliente de código 100. 
11. Mostrar el código de la factura y el número de línea de las facturas cuyas líneas superan 100 Bs sin 
considerar descuentos ni impuestos. 
12. Importe medio por factura, sin considerar descuentos ni impuestos. El importe de una factura se 
calcula sumando el producto de la can8dad por el precio de sus líneas. 
13. Stock medio, máximo, y mínimo de los arYculos que con8enen la letra A en la segunda posición 
de su descripción y cuyo stock mínimo es superior a la mitad de su stock actual. 
14. Número de facturas para cada año. Junto con el año debe aparecer el número de facturas de ese 
año. 
15. Número de facturas de cada cliente, pero sólo se deben mostrar aquellos clientes que 8enen más 
de 15 facturas. 
16. Can8dades totales vendidas para cada arYculo cuyo código empieza por “F”. La can8dad total 
vendida de un arYculo se calcula sumando las can8dades de todas sus líneas de factura. 
17. Código de aquellos arYculos de los que se ha facturado más de 6000 euros. 
 
18. Número de facturas de cada uno de los clientes cuyo código está entre 241 y 250, con cada IVA 
dis8nto que se les ha aplicado. En cada línea del resultado se debe mostrar un código de cliente, 
un IVA y el número de facturas de ese cliente con ese IVA. 
19. Vendedores y clientes cuyo nombre coincide (vendedores que a su vez han comprado algo a la 
empresa) 
 
20. Creación de una vista que muestre únicamente los códigos postales de los clientes que inicien con 
el número 12. 
21. Mostrar el código y el nombre de los clientes de Castellón (posee código 12) que han realizado 
facturas con vendedores de más de dos provincias dis8ntas. El resultado debe quedar ordenado 
ascendentemente respecto del nombre del cliente.
*/