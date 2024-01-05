USE adventureworks;

-- 1. Obtener un listado contactos que hayan ordenado productos de la subcategoría "Mountain Bikes", entre los años 2000 y 2003, cuyo método de envío sea "CARGO TRANSPORT 5".

SELECT DISTINCT ct.ContactID,
        CONCAT(ct.FirstName," ", ct.MiddleName," ", ct.LastName) AS Nombre_contacto,
        ps.Name AS Subcategoría
FROM salesorderheader sh
JOIN customer cu
    ON sh.CustomerID = cu.CustomerID
JOIN contact ct
    ON sh.ContactID = ct.ContactID
JOIN shipmethod sm
    ON sh.shipmethodID = sm.shipmethodID
JOIN salesorderdetail sd
    ON sh.SalesOrderID =  sd.SalesOrderID
JOIN product pd
    ON sd.ProductID=pd.ProductID
JOIN productsubcategory ps
    ON pd.ProductSubcategoryID=ps.ProductSubcategoryID
WHERE (sh.OrderDate BETWEEN '2000-01-01' AND '2003-12-31') AND ps.ProductSubcategoryID=1 AND sm.ShipMethodID=5;


-- 2. Obtener un listado contactos que hayan ordenado productos de la subcategoría "Mountain Bikes", entre los años 2000 y 2003 
-- con la cantidad de productos adquiridos y ordenado por este valor, de forma descendente.

SELECT 
        ct.ContactID,
        CONCAT(ct.FirstName," ",ct.MiddleName," ",ct.LastName) AS Nombre_contacto,
        SUM(sd.OrderQty) AS Cantidad_Productos,
        ps.Name AS Subcategoría
FROM salesorderheader sh
JOIN contact ct
    ON sh.ContactID=ct.ContactID
JOIN salesorderdetail sd
    ON sh.SalesOrderID=sd.SalesOrderID
JOIN product pd
    ON sd.ProductID=pd.ProductID
JOIN productsubcategory ps
    ON pd.ProductSubcategoryID=ps.ProductSubcategoryID
WHERE (year(sh.OrderDate) BETWEEN 2000 and 2003) AND ps.ProductSubcategoryID=1 
GROUP BY ct.ContactID
ORDER BY Cantidad_Productos DESC;


-- 3. Obtener un listado de cual fue el volumen de compra (cantidad) por año y método de envío.

SELECT SUM(sd.OrderQty) AS Cantidad_Productos, sm.name, YEAR(sh.orderdate)
FROM salesorderheader sh
JOIN salesorderdetail sd
    ON sh.SalesOrderID=sd.SalesOrderID
JOIN shipmethod sm
    ON sh.shipmethodID = sm.shipmethodID
GROUP BY YEAR(sh.orderdate), sm.name;


-- 4 Obtener un listado por categoría de productos, con el valor total de ventas y productos vendidos.

SELECT
        pc.name AS Categoria_producto,
        ROUND(SUM(sd.LineTotal), 2) AS Total_ventas,
        SUM(sd.OrderQty) AS Cantidad_productos
FROM salesorderdetail sd
JOIN product pd
    ON pd.productID=sd.productID
JOIN productsubcategory ps
    ON ps.productsubcategoryID=pd.productsubcategoryID
JOIN productcategory pc
    ON ps.productcategoryID=pc.productcategoryID
GROUP BY pc.productcategoryID;

-- 5 Obtener un listado por país (según la dirección de envío), con el valor total de ventas y productos vendidos, sólo para aquellos países donde se enviaron más de 15 mil productos.

SELECT
        cr.Name AS pais_enviado,
        SUM(sd.LineTotal) AS Total_ventas,
        SUM(sd.OrderQty) AS Cantidad_productos
FROM salesorderheader sh
JOIN salesterritory st
    ON sh.TerritoryID=st.TerritoryID
JOIN countryregion cr
    ON st.CountryRegionCode=cr.CountryRegionCode
JOIN salesorderdetail sd
    ON sh.SalesOrderID=sd.SalesOrderID
JOIN address ad
    ON sh.ShiptoAddressID=ad.AddressID
GROUP BY cr.Name
HAVING Cantidad_productos>15000;