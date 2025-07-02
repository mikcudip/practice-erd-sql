-- 5. Desde el departamento de finanzas necesitan un reporte.
-- Este reporte debe contener lo siguiente:
-- Columnas:
-- Octubre Noviembre Diciembre
-- Filas:
-- Total facturado
-- Cantidad total de
-- facturas
-- Solo para los meses de octubre, noviembre y diciembre del año 2010.
-- Resolver primero la consulta con los datos de Total facturado y luego con Cantidad de
-- facturas.
SELECT
  Metrica,
  SUM(Octubre),
  SUM(Noviembre),
  SUM(Diciembre)
FROM
  (
    SELECT
      "Total Facturado" AS Metrica,
      SUM(total) AS Octubre,
      0 AS Noviembre,
      0 AS Diciembre
    FROM
      facturas
    WHERE
      MONTH (fecha_factura) = 10
      AND YEAR(fecha_factura) = 2010
    GROUP BY
      MONTH (fecha_factura)
    UNION ALL
    SELECT
      "Total Facturado" AS Metrica,
      0 AS Octubre,
      SUM(total) AS Noviembre,
      0 AS Diciembre
    FROM
      facturas
    WHERE
      MONTH (fecha_factura) = 11
      AND YEAR(fecha_factura) = 2010
    GROUP BY
      MONTH (fecha_factura)
    UNION ALL
    SELECT
      "Total Facturado" AS Metrica,
      0 AS Octubre,
      0 AS Noviembre,
      SUM(total) AS Diciembre
    FROM
      facturas
    WHERE
      MONTH (fecha_factura) = 12
      AND YEAR(fecha_factura) = 2010
    GROUP BY
      MONTH (fecha_factura)
  ) AS `Total Facturado`
UNION ALL
SELECT
  Metrica,
  SUM(Octubre),
  SUM(Noviembre),
  SUM(Diciembre)
FROM
  (
    SELECT
      "Cantidad de Facturas" AS Metrica,
      COUNT(id) AS Octubre,
      0 AS Noviembre,
      0 AS Diciembre
    FROM
      facturas
    WHERE
      MONTH (fecha_factura) = 10
      AND YEAR(fecha_factura) = 2010
    GROUP BY
      MONTH (fecha_factura)
    UNION ALL
    SELECT
      "Cantidad de Facturas" AS Metrica,
      0 AS Octubre,
      COUNT(id) AS Noviembre,
      0 AS Diciembre
    FROM
      facturas
    WHERE
      MONTH (fecha_factura) = 11
      AND YEAR(fecha_factura) = 2010
    GROUP BY
      MONTH (fecha_factura)
    UNION ALL
    SELECT
      "Cantidad de Facturas" AS Metrica,
      0 AS Octubre,
      0 AS Noviembre,
      COUNT(id) AS Diciembre
    FROM
      facturas
    WHERE
      MONTH (fecha_factura) = 12
      AND YEAR(fecha_factura) = 2010
    GROUP BY
      MONTH (fecha_factura)
  ) AS `Total Facturas`;
