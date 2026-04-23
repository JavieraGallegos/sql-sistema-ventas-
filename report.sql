-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- 1. Mostrar todos los clientes registrados(victor)
SELECT *
FROM clientes;

-- 2. Mostrar todos los productos disponibles (bea)
select nombre from productos;


-- 3. Mostrar todas las ventas realizadas (diego)
select c.nombre, p.nombre ,dv.cantidad, p.precio, (p.precio * dv.cantidad ) as Total 
from  ventas v
join clientes c on v.id_cliente = c.id_cliente
join detalle_venta dv on dv.id_venta = v.id_venta
join productos p on p.id_producto = dv.id_producto;

-- 4. Mostrar solo nombre y email de clientes (alexander)
SELECT nombre, email
FROM clientes;

-- 5. Mostrar solo nombre y precio de productos (javi)
SELECT nombre, precio
FROM productos;


-- 6. Productos con precio mayor a 50000 (victor)
SELECT id_producto, nombre, precio
FROM productos
WHERE precio > 50000;

-- 7. Ventas realizadas el 2026-04-02 (bea)
SELECT *
FROM ventas
WHERE fecha = '2026-04-02';

-- 8. Productos ordenados de mayor a menor precio (diego)
select nombre, precio 
from productos
order by precio desc;


-- 9. Clientes ordenados por nombre (alexander)
select nombre 
from clientes
order by nombre desc;

-- 10. Detalles de venta con cantidad >= 2 (javi)

SELECT id_venta, id_detalle, id_producto, cantidad
FROM detalle_venta
WHERE cantidad >= 2
ORDER BY id_venta ;


-- 11. Total de clientes (victor)
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- 12. Total de productos (bea)
SELECT COUNT(*) AS total_productos
FROM productos;

-- 13. Total de ventas (diego)
select SUM(p.precio * dv.cantidad ) as total_ventas
from  ventas v
left join clientes c on v.id_cliente = c.id_cliente
left join detalle_venta dv on dv.id_venta = v.id_venta
left join productos p on p.id_producto = dv.id_producto;


-- 14. Precio promedio de productos (alexander)
SELECT AVG(PRECIO) AS AveragePrice
FROM PRODUCTOS;


-- 15. Suma total de precios de productos (javi)
SELECT SUM(precio) FROM productos;
-- O también se puede escribir como (asi queda mas claro el resultado y el nombre de la columna):
SELECT sum(precio) AS total_precio FROM productos;



-- 16. Mostrar venta + nombre del cliente + fecha (victor)
SELECT v.id_venta,
c.nombre AS nombre_cliente,
v.fecha
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente;


-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad(bea)
    SELECT 
    dv.id_venta,
    p.nombre AS producto,
    dv.cantidad
    FROM detalle_venta dv
    JOIN productos p ON dv.id_producto = p.id_producto;

-- 18. Mostrar nombre del cliente + id de venta + fecha  (alexander)
SELECT 
    id_cliente, 
    id_venta, 
    fecha
FROM ventas;


-- 19. Mostrar nombre del producto + cantidad vendida + id de venta (javi)
SELECT p.nombre, dv.cantidad, dv.id_venta
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto;

-- 20. Mostrar cuántas ventas ha realizado cada cliente (diego)
-- tuve que pedir ayuda a claudio
select c.nombre, sum(p.precio * dv.cantidad) as TOTAL_VENTA
from ventas v
join clientes c on v.id_cliente = c.id_cliente 
join detalle_venta dv on dv.id_venta = v.id_venta 
join productos p on p.id_producto = dv.id_producto 
group by c.id_cliente, c.nombre;


-- 21. Mostrar solo los clientes con más de una venta (victor)
SELECT c.nombre AS nombre_cliente,
COUNT(v.id_venta) AS total_ventas
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(v.id_venta) > 1
ORDER BY total_ventas;

-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta(bea)
    SELECT 
    p.nombre AS producto,
    COUNT(*) AS veces_aparece
    FROM detalle_venta dv
    JOIN productos p ON dv.id_producto = p.id_producto
    GROUP BY p.nombre;


-- 23. Mostrar solo los productos que aparecen más de una vez (diego)
select p.nombre, count(*) as VECES_VENDIDO
from detalle_venta dv 
join productos p on p.id_producto = dv.id_producto 
group by p.id_producto, p.nombre 
HAVING COUNT(*) > 1;


-- 24. Mostrar las ventas que tienen más de un producto asociado (alexander)
SELECT 
    v.id_venta, 
    v.fecha, 
    v.id_cliente
FROM ventas v
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY 
    v.id_venta, 
    v.fecha, 
    v.id_cliente
HAVING COUNT(dv.id_producto) > 1;

-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2 (javi)

SELECT c.nombre, SUM(dv.cantidad) AS total_unidades
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY c.id_cliente, c.nombre
HAVING SUM(dv.cantidad) > 2;

-- 26. Consulta trampa que no devuelva resultados
SELECT id_producto, nombre, precio
FROM productos
WHERE nombre = 'PlayStation 3' ;
-- Da vacio porque no hay ningun producto con el nombre PlayStation 3
 

-- Explicar por qué el resultado vacío es correcto  (todos juntos rojo)
