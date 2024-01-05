USE `checkpoint_m2`;

-- 1) ¿Cuál es el canal de ventas con menor cantidad de ventas registradas? 1-Online 2-Telefónica 3-Presencial

SELECT venta.Idcanal, count(venta.idcanal) AS Ventas_por_canal, canal_venta.canal
FROM venta
INNER JOIN canal_venta
ON venta.idcanal = canal_venta.idcanal
GROUP BY Idcanal
ORDER BY 2 ASC
LIMIT 1;
-- El canal de ventas con menor cantidad de ventas registradas es Venta Telefónica, con 11582 ventas.


-- 2) ¿Cuál es el canal de ventas con menos venta (Venta = Precio * Cantidad) 1-Online 2-Telefónica 3-Presencial

SELECT venta.idcanal, SUM(venta.precio * venta.cantidad) AS ventas_total, canal_venta.canal
FROM venta
INNER JOIN canal_venta
ON venta.idcanal = canal_venta.idcanal
GROUP BY Idcanal
ORDER BY 2 ASC
LIMIT 1;
-- El canal de ventas con menor venta fue Presencial con 54.207.375,88 pesos en ventas.


-- 3) La dirección desea saber que tipo de producto tiene la segunda mayor venta en 2015 (Tabla 'producto', campo 'Tipo' = Tipo de producto). 1. INFORMATICA 2. ESTUCHERIA 3. AUDIO 4. IMPRESION 5. GABINETES 6. GRABACION 7. BASES 8. GAMING

SELECT SUM(venta.precio * venta.cantidad) AS venta_total, count(producto.tipo), producto.tipo, producto.idproducto
FROM venta
INNER JOIN producto
ON venta.idproducto = producto.idproducto
WHERE venta.fecha LIKE "2018%"
GROUP BY producto.tipo
ORDER BY venta_total asc;
-- El tipo producto que tiene la segunda mayor venta en 2015 es Estucheria.


-- 4) Se define el tiempo de entrega como el tiempo en dias transcurrido entre que se realiza la compra y se efectua la entrega. Para analizar mejoras en el servicio, la direccion desea saber: ¿Cuál es el año con el promedio mas alto de este tiempo de entrega? (Fecha = Fecha de venta; Fecha_Entrega = Fecha de entrega)

SELECT YEAR(Fecha) AS Año, avg(timestampdiff(DAY, fecha, fecha_entrega)) as tiempo_entrega, idventa
FROM venta
WHERE Año LIKE "2018%"
GROUP BY idventa
HAVING tiempo_entrega > 5
-- El año con el promedio mas alto de este tiempo de entrega es el año 2020


-- 5) ¿Cuántos productos poseen un tipo que comienza con la letra "I"?

SELECT count(tipo) AS Cantidad_productos
FROM producto
WHERE tipo LIKE "i%"