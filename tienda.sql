CREATE DATABASE tienda;
USE tienda;

CREATE TABLE productos (
id_producto int auto_increment primary key,
nombre_producto varchar(50) not null,
precio decimal(8, 2) not null,
stock_actual int not null,
ventas_producto int not null,
id_proveedor int not null
);

ALTER TABLE productos
MODIFY COLUMN ventas_producto int DEFAULT 0;

CREATE TABLE proveedores (
id_proveedor int auto_increment primary key,
nombre_proveedor varchar(50) not null
);

CREATE TABLE clientes (
id_cliente int auto_increment primary key, 
nombre_cliente varchar(50) not null,
apellido_cliente varchar(100) not null,
id_pais int
);

CREATE TABLE paises (
id_pais int auto_increment primary key, 
nombre_pais varchar(50)
);

CREATE TABLE facturas (
id_factura int auto_increment primary key,
id_cliente int not null,
id_producto int not null,
cantidad int not null, 
fecha_compra datetime default current_timestamp
);

DROP PROCEDURE IF EXISTS insertar_productos;

DELIMITER $$
CREATE PROCEDURE insertar_productos (
p_nombre_producto VARCHAR(50),
p_precio decimal(8,2),
p_stock int,
p_nombre_proveedor VARCHAR (50) )
BEGIN
-- Variable para guardar el id del proveedor si existe
DECLARE v_id_proveedor int;
DECLARE v_id_producto int;

SELECT id_proveedor INTO v_id_proveedor
FROM proveedores WHERE nombre_proveedor = p_nombre_proveedor;

IF v_id_proveedor IS NULL THEN
	INSERT INTO proveedores (nombre_proveedor) VALUES (p_nombre_proveedor);
    SELECT id_proveedor INTO v_id_proveedor
	FROM proveedores WHERE nombre_p = p_nombre_producto;
END IF;

SELECT id_producto INTO v_id_producto
FROM productos WHERE nombre_producto = p_nombre_producto;
IF v_id_producto IS NULL THEN
-- Si v_id_producto es nulo significa que no estaba 
-- y por eso hay que añadir el producto a la tabla
	INSERT INTO productos(nombre_producto, precio, stock_actual, id_proveedor)
    VALUES (p_nombre_producto, p_precio, p_stock, v_id_proveedor);
    SELECT concat_ws(" ", "Producto", p_nombre_producto, "añadido a la tabla");
ELSE 
	UPDATE productos set precio = p_precio, stock_actual = stock_actual + p_stock
    WHERE id_producto = v_id_producto;
    SELECT concat_ws(" ", "Producto", p_nombre_producto, "actualizado");
END IF;
END $$
DELIMITER ;

CALL insertar_productos("Iphone 27", 5000.75, 2, "Apple");
CALL insertar_productos("Iphone 27", 6000.75, 3, "Apple");
CALL insertar_productos("S35", 1000, 5, "Samsung");


