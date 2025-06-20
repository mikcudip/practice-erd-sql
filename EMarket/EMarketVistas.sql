CREATE VIEW REPORTE_FACTURAS AS
SELECT
  F.FacturaID,
  F.ClienteID,
  C.Contacto,
  FechaFactura,
  ProductoNombre,
  FD.PrecioUnitario,
  Cantidad,
  Descuento,
  ROUND(FD.PrecioUnitario * Cantidad * (1 - Descuento), 2) AS Venta
FROM
  Facturas AS F
  JOIN FacturaDetalle AS FD ON F.FacturaID = FD.FacturaID
  JOIN Productos AS P ON FD.ProductoID = P.ProductoID
  JOIN Clientes AS C ON C.ClienteID = F.ClienteID;
