CREATE DATABASE almacenes;
use almacenes;

CREATE TABLE almacenes (
id_almacen int not null primary key auto_increment,
lugar varchar(100) not null,
capacidad int not null
);

CREATE TABLE cajas (
num_referencia varchar(5) not null primary key,
contenido varchar(100) not null, 
valor decimal(6,2) not null,
id_almacen int not null
);

INSERT INTO almacenes(lugar, capacidad) VALUES ('Barcelona', 100), ('Cornellà', 5), ('Hospitalet', 20), ('Badalona', 3);
INSERT INTO CAJAS (num_referencia, contenido, valor, id_almacen) VALUES
('TECL1', "teclados", 100, 1),('RAT1', "ratones", 200, 2),('TECL2', "teclados", 100, 4),('RAT2', "ratones", 200, 4);


-- 1
SELECT * FROM almacenes;

-- 2
SELECT * FROM cajas WHERE valor > 150;

-- 3
SELECT distinct contenido FROM cajas;

-- 4
SELECT AVG(valor) FROM cajas;

-- 5
SELECT id_almacen, AVG(valor)
FROM cajas
GROUP BY id_almacen;

-- 6
SELECT id_almacen, AVG(valor)
FROM cajas
GROUP BY id_almacen
HAVING AVG(valor) > 150;

-- 7
SELECT c.num_referencia, a.lugar
FROM almacenes a
natural join cajas c;

-- 8
SELECT id_almacen, COUNT(id_almacen)
FROM cajas
GROUP BY id_almacen;

SELECT a.id_almacen, COUNT(a.id_almacen)
FROM almacenes a
LEFT JOIN cajas c
ON a.id_almacen = c.id_almacen
GROUP BY a.id_almacen;