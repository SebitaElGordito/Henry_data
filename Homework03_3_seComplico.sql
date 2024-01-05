USE adventureworks;

-- 1er intento
/*SELECT 
    YEAR(sh.OrderDate) AS Año,
    sm.Name,
    SUM(sd.OrderQty) AS Cantidad_total,
    (SELECT SUM(sd2.OrderQty) FROM salesorderdetail sd2 JOIN salesorderheader sh2 ON sh2.SalesOrderID=sd2.SalesOrderID WHERE YEAR(sh2.OrderDate) = YEAR(sh.OrderDate)) AS Total_cantidad_anio
FROM salesorderdetail sd
JOIN salesorderheader sh
    ON sh.SalesOrderID=sd.SalesOrderID
JOIN shipmethod sm
    ON sh.ShipMethodID=sm.ShipMethodID
GROUP BY 1,2;

-- 2do intento
SELECT 
    Año,
    Name,
    Cantidad_total,
    Total_cantidad_anio_2001,
    Total_cantidad_anio_2002,
    Total_cantidad_anio_2003,
    Total_cantidad_anio_2004,
    (Cantidad_total * 100.0 / Total_cantidad_anio_2001) AS Porcentaje_del_total_2001,
    (Cantidad_total * 100.0 / Total_cantidad_anio_2002) AS Porcentaje_del_total_2002,
    (Cantidad_total * 100.0 / Total_cantidad_anio_2003) AS Porcentaje_del_total_2003,
    (Cantidad_total * 100.0 / Total_cantidad_anio_2004) AS Porcentaje_del_total_2004
FROM (
    SELECT 
        YEAR(sh.OrderDate) AS Año,
        sm.Name,
        SUM(sd.OrderQty) AS Cantidad_total, 
        (SELECT SUM(sd2.OrderQty) FROM salesorderdetail sd2 JOIN salesorderheader sh2 ON sh2.SalesOrderID=sd2.SalesOrderID WHERE YEAR(sh2.OrderDate) = "2001") AS Total_cantidad_anio_2001,
        (SELECT SUM(sd2.OrderQty) FROM salesorderdetail sd2 JOIN salesorderheader sh2 ON sh2.SalesOrderID=sd2.SalesOrderID WHERE YEAR(sh2.OrderDate) = "2002") AS Total_cantidad_anio_2002,
        (SELECT SUM(sd2.OrderQty) FROM salesorderdetail sd2 JOIN salesorderheader sh2 ON sh2.SalesOrderID=sd2.SalesOrderID WHERE YEAR(sh2.OrderDate) = "2003") AS Total_cantidad_anio_2003,
        (SELECT SUM(sd2.OrderQty) FROM salesorderdetail sd2 JOIN salesorderheader sh2 ON sh2.SalesOrderID=sd2.SalesOrderID WHERE YEAR(sh2.OrderDate) = "2004") AS Total_cantidad_anio_2004
	FROM salesorderheader sh
	JOIN salesorderdetail sd
		ON sh.SalesOrderID=sd.SalesOrderID
	JOIN shipmethod sm
		ON sh.ShipMethodID=sm.ShipMethodID
	GROUP BY YEAR(sh.OrderDate), sm.Name
    ) AS Subconsulta;
*/
-- intento ventanas
SELECT 
    Año,
    Name,
    Cantidad_total,
    Total_cantidad_anio,
    (Cantidad_total * 100.0 / SUM(Cantidad_total) OVER (PARTITION BY Año)) AS Porcentaje_del_total
FROM (
    SELECT 
        YEAR(sh.OrderDate) AS Año,
        sm.Name,
        SUM(sd.OrderQty) AS Cantidad_total,
        SUM(SUM(sd.OrderQty)) OVER (PARTITION BY YEAR(sh.OrderDate)) AS Total_cantidad_anio
    FROM salesorderheader sh
    JOIN salesorderdetail sd
        ON sh.SalesOrderID=sd.SalesOrderID
    JOIN shipmethod sm
        ON sh.ShipMethodID=sm.ShipMethodID
    GROUP BY 1,2
) AS subconsulta;


-- 3er intento
/*SELECT 
        YEAR(sh.OrderDate) AS Año,
        sm.Name,
        SUM(sd.OrderQty) AS Cantidad_total_prod,
        (SELECT 
        SUM(sd.OrderQty) AS Cantidad_total
		FROM salesorderheader sh
		JOIN salesorderdetail sd
        ON sh.SalesOrderID=sd.SalesOrderID
GROUP BY año) AS Cantidad_total
FROM salesorderheader sh
JOIN salesorderdetail sd
        ON sh.SalesOrderID=sd.SalesOrderID
JOIN shipmethod sm
        ON sh.ShipMethodID=sm.ShipMethodID
GROUP BY 1,2;

SELECT 
        YEAR(sh.OrderDate) AS anio,
        SUM(sd.OrderQty) AS Cantidad_total
FROM salesorderheader sh
JOIN salesorderdetail sd
        ON sh.SalesOrderID=sd.SalesOrderID
GROUP BY anio;
*/

-- intento final

SELECT
        Año,
        Name,
        Cantidad_total_prod,
        Cantidad_total,
        Cantidad_total_prod*100/Cantidad_total AS Porcentaje
FROM (SELECT 
        YEAR(sh.OrderDate) AS Año,
        sm.Name,
        SUM(sd.OrderQty) AS Cantidad_total_prod
FROM salesorderheader sh
JOIN salesorderdetail sd
        ON sh.SalesOrderID=sd.SalesOrderID
JOIN shipmethod sm
        ON sh.ShipMethodID=sm.ShipMethodID
GROUP BY 1,2) AS subconsulta
JOIN (SELECT 
        YEAR(sh.OrderDate) AS anio,
        SUM(sd.OrderQty) AS Cantidad_total
FROM salesorderheader sh
JOIN salesorderdetail sd
        ON sh.SalesOrderID=sd.SalesOrderID
GROUP BY anio) AS j
    ON subconsulta.Año =j.anio
;

-- Comparación de la Demora de las Consultas
-- Para comparar la demora de las consultas, necesitarías ejecutar ambas consultas en tu sistema de base de datos y medir el tiempo que tarda cada una. Esto dependerá del sistema de base de datos específico que estés utilizando. Algunos sistemas de base de datos tienen herramientas incorporadas para medir el tiempo de ejecución de las consultas. Si tu sistema de base de datos no tiene una herramienta de este tipo, puedes medir el tiempo manualmente utilizando un cronómetro.
-- Por lo general, las funciones de ventana suelen ser más rápidas que las subconsultas, especialmente en grandes conjuntos de datos, ya que las subconsultas requieren que la base de datos realice múltiples pasadas sobre los datos. Sin embargo, la diferencia de tiempo puede variar dependiendo de la estructura específica de tu base de datos y de cómo esté optimizada.


-- Ejercicio 2 
-- Obtener un listado por categoría de productos, con el valor total de ventas y productos vendidos, mostrando para ambos, su porcentaje respecto del total.

SELECT
        pc.Name,
        ROUND(SUM(sd.LineTotal), 2) AS Total_ventas,
        SUM(sd.OrderQty) AS Cantidad_productos,
        SUM(sd.OrderQty)/(SELECT SUM(OrderQty) FROM salesorderdetail)*100 AS porcetaje_total_cantidad,
        ROUND(SUM(sd.LineTotal)/(SELECT SUM(LineTotal) FROM salesorderdetail)*100,2) AS porcetaje_total_monto
FROM salesorderheader sh
JOIN customer cu
    ON sh.CustomerID=cu.CustomerID
JOIN contact ct
    ON sh.ContactID=ct.ContactID
JOIN shipmethod sm
    ON sh.shipmethodID=sm.shipmethodID
JOIN salesorderdetail sd
    ON sh.SalesOrderID=sd.SalesOrderID
JOIN product pd
    ON sd.ProductID=pd.ProductID
JOIN productsubcategory ps
    ON pd.ProductSubcategoryID=ps.ProductSubcategoryID
JOIN productcategory pc
    ON ps.ProductCategoryID=pc.ProductCategoryID
GROUP BY pc.Name;



-- Ejercicio 3
-- Obtener un listado por país (según la dirección de envío), con el valor total de ventas y productos vendidos, mostrando para ambos, su porcentaje respecto del total.

SELECT
		cr.Name AS Pais, 
		SUM(sd.OrderQty) AS Cantidad, 
		SUM(sd.LineTotal) AS Total_Ventas,
        SUM(sd.OrderQty)/(SELECT SUM(OrderQty) FROM salesorderdetail)*100 AS porcetaje_total_cantidad,
        ROUND(SUM(sd.LineTotal)/(SELECT SUM(LineTotal) FROM salesorderdetail)*100,2) AS porcetaje_total_monto
FROM salesorderdetail sd 
JOIN salesorderheader sh
		ON (sd.SalesOrderID = sh.SalesOrderID) 
JOIN address a
		ON (a.AddressID = sh.ShipToAddressID) 
JOIN stateprovince sp
		ON (a.StateProvinceID = sp.StateProvinceID) 
JOIN countryregion cr
		ON (cr.CountryRegionCode = sp.CountryRegionCode) 
GROUP BY 1
HAVING SUM(sd.OrderQty) > 15000
ORDER BY 1;


-- Ejercicio 4
-- Obtener por ProductID, los valores correspondientes a la mediana de las ventas (LineTotal), sobre las ordenes realizadas. Investigar las funciones FLOOR() y CEILING()


SELECT 	ProductID, 
		AVG(LineTotal) as Mediana
FROM (SELECT ProductID, LineTotal,
    ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY LineTotal) AS RowAsc,
    ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY LineTotal DESC) AS RowDesc
    FROM SalesOrderDetail) Med
WHERE RowAsc IN (RowDesc, RowDesc - 1, RowDesc + 1)
GROUP BY ProductID
