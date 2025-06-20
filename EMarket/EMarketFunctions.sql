SELECT
  Contacto,
  SUBSTRING_INDEX(Contacto, " ", 1) Nombre,
  SUBSTRING_INDEX(Contacto, " ", -1) Apellido,
  Ciudad,
REPLACE
  (Ciudad, "?", "é")
FROM
  Clientes;

SELECT
  CONCAT_WS(" ", Apellido, Nombre) "Nombre Completo",
  Nombre,
  LEFT (Nombre, 4),
  RIGHT (Nombre, 4),
  LENGTH(Nombre)
FROM
  Empleados;

SELECT
  FacturaID,
  FechaFactura,
  YEAR(FechaFactura),
  MONTH (FechaFactura),
  MONTH (FechaFactura),
  DAY (FechaFactura),
  DATE_ADD(FechaFactura, INTERVAL 1 YEAR),
  DATEDIFF(FechaEnvio, FechaFactura),
  DATEDIFF(CURDATE(), FechaEnvio),
  CURDATE(),
  FechaEnvio
FROM
  Facturas;
