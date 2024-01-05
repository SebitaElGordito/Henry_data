USE adventureworks

-- Ejercicio 1

DELIMITER $$
DROP PROCEDURE IF EXISTS fecha_compras;
CREATE PROCEDURE fecha_compras(IN Fecha DATE)
BEGIN
	SELECT COUNT(SalesOrderID) 
    FROM salesorderheader
    WHERE DATE(OrderDate) = Fecha;
    
END $$
DELIMITER ;

CALL fecha_compras("2001-07-13");



-- Ejercicio 2

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS margenBruto;

DELIMITER $$
CREATE FUNCTION margenBruto(precio DECIMAL(15,3), margen DECIMAL (9,2)) RETURNS DECIMAL (15,3)
BEGIN
	DECLARE margenBruto DECIMAL (15,3);
    
    SET margenBruto = precio * margen;
    
    RETURN margenBruto;
END$$

DELIMITER ;

Select margenBruto(100.50, 1.2);


-- Ejercicio 3
-- Obtner un listado de productos en orden alfabético que muestre cuál debería ser el valor de precio de lista, si se quiere aplicar un margen bruto del 20%, 
-- utilizando la función creada en el punto 2, sobre el campo StandardCost. Mostrando tambien el campo ListPrice y la diferencia con el nuevo campo creado.


SELECT ProductID, Name, ROUND(ListPrice, margenBruto(StandardCost, 1.2)) AS ListPrice_2, ROUND((ListPrice - (margenBruto(StandardCost, 1.2))), 2) AS Diferencia_Price
FROM product
WHERE ListPrice != 0
ORDER BY Name ASC;



-- Ejercicio 4
--  Crear un procedimiento que reciba como parámetro una fecha desde y una hasta, 
-- y muestre un listado con los Id de los diez Clientes que más costo de transporte tienen entre esas fechas (campo Freight).

DROP PROCEDURE IF EXISTS gastoTransporte;
DELIMITER $$
CREATE PROCEDURE gastoTransporte(IN fechaDesde DATE, IN fechaHasta DATE)
BEGIN
	SELECT CustomerID, SUM(Freight) AS TotalTransporte
	FROM salesorderheader
	WHERE OrderDate BETWEEN fechaDesde AND fechaHasta
    GROUP BY CustomerID
    ORDER BY TotalTransporte DESC
    LIMIT 10;
END $$

DELIMITER ;

CALL gastoTransporte('2002-01-01','2002-01-31');


-- 5)
DROP PROCEDURE IF EXISTS cargarShipmethod;

DELIMITER $$
CREATE PROCEDURE cargarShipmethod(IN nombre VARCHAR(50), IN base DOUBLE, IN rate DOUBLE)
BEGIN
    INSERT INTO shipmethod (Name, ShipBase, ShipRate, ModifiedDate)
	VALUES (nombre,base,rate,NOW());
END $$
DELIMITER ;

CALL cargarShipmethod('Prueba', 1.5, 3.5);

SELECT * FROM shipmethod;