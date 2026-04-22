-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- 1. Mostrar todos los clientes registrados(victor)


-- 2. Mostrar todos los productos disponibles (bea)


-- 3. Mostrar todas las ventas realizadas (diego)


-- 4. Mostrar solo nombre y email de clientes (alexander)


-- 5. Mostrar solo nombre y precio de productos (javi)
SELECT nombre, precio
FROM productos;


-- 6. Productos con precio mayor a 50000 (victor)


-- 7. Ventas realizadas el 2026-04-02 (bea)


-- 8. Productos ordenados de mayor a menor precio (diego)


-- 9. Clientes ordenados por nombre (alexander)


-- 10. Detalles de venta con cantidad >= 2 (javi)

SELECT id_venta, id_detalle, id_producto, cantidad
FROM detalle_venta
WHERE cantidad >= 2
ORDER BY id_venta ;


-- 11. Total de clientes (victor)


-- 12. Total de productos (bea)


-- 13. Total de ventas (diego)


-- 14. Precio promedio de productos (alexander)


-- 15. Suma total de precios de productos (javi)
SELECT SUM(precio) FROM productos;
-- O también se puede escribir como (asi queda mas claro el resultado y el nombre de la columna):
SELECT sum(precio) AS total_precio FROM productos;



-- 16. Mostrar venta + nombre del cliente + fecha (victor)


-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad(bea)


-- 18. Mostrar nombre del cliente + id de venta + fecha  (alexander)


-- 19. Mostrar nombre del producto + cantidad vendida + id de venta (javi)
SELECT p.nombre, dv.cantidad, dv.id_venta
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto;

-- 20. Mostrar cuántas ventas ha realizado cada cliente (diego)


-- 21. Mostrar solo los clientes con más de una venta (victor)


-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta(bea)


-- 23. Mostrar solo los productos que aparecen más de una vez (diego)


-- 24. Mostrar las ventas que tienen más de un producto asociado (alexander)


-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2 (javi)

SELECT c.nombre, SUM(dv.cantidad) AS total_unidades
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY c.id_cliente, c.nombre
HAVING SUM(dv.cantidad) > 2;

-- 26. Consulta trampa que no devuelva resultados
-- Explicar por qué el resultado vacío es correcto  (todos juntos rojo)