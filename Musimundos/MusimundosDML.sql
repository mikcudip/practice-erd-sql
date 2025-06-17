-- 1
SELECT
  COUNT(*)
FROM
  clientes
WHERE
  pais = "Brazil";

-- 2
SELECT
  id_genero,
  COUNT(id)
FROM
  canciones
GROUP BY
  id_genero;

-- 3
SELECT
  id_cliente,
  SUM(total)
FROM
  facturas
GROUP BY
  id_cliente;

-- 4
SELECT
  id_album,
  AVG(milisegundos)
FROM
  canciones
GROUP BY
  id_album;

-- 5
SELECT
  MIN(bytes)
FROM
  canciones;

-- 6
SELECT
  id_cliente,
  SUM(total) AS Total
FROM
  facturas
GROUP BY
  id_cliente
HAVING
  Total > 45;
