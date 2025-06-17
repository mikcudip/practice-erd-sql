DESCRIBE Clientes;

SELECT
  Pais,
  ciudad,
  COUNT(DISTINCT ClienteID)
FROM
  Clientes
GROUP BY
  Pais,
  ciudad;

SELECT
  productoID,
  SUM(PrecioUnitario * Cantidad) as Total
FROM
  FacturaDetalle
GROUP BY
  productoID;

SELECT
  Pais,
  COUNT(DISTINCT ClienteID) AS Total
FROM
  Clientes
GROUP BY
  Pais
HAVING
  Total >= 10;

SELECT
  productoID,
  COUNT(facturaID),
  SUM(PrecioUnitario * Cantidad) as Total
FROM
  FacturaDetalle
GROUP BY
  productoID
HAVING
  COUNT(FacturaID) >= 5;

SELECT
  *
FROM
  Facturas
  INNER JOIN FacturaDetalle ON Facturas.FacturaID = FacturaDetalle.FacturaID
  INNER JOIN Productos ON FacturaDetalle.ProductoID = Productos.ProductoID;

SELECT
  *
FROM
  Facturas
  INNER JOIN FacturaDetalle ON Facturas.FacturaID = FacturaDetalle.FacturaID
  INNER JOIN Productos ON FacturaDetalle.ProductoID = Productos.ProductoID;
