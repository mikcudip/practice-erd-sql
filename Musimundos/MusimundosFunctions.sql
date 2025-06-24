-- 1. Ranking canciones
-- Desde el departamento de desarrollo de Musimundos están preparando la parte de la
-- aplicación en la cual accedemos a una canción en particular. Nos comentan que
-- debajo de la imagen de la canción deberá aparecer un texto específico, y necesitan
-- nuestra ayuda. El texto tiene que ser:
-- "La canción " (nombre del tema) " fue compuesta por " (compositor del tema).
-- Hacé una consulta a nuestra base de datos que nos traiga el nombre y el compositor
-- de cada tema, sin repeticiones y agregando el texto que el equipo de desarrollo nos
-- mencionaba.
-- Ojo! Tené en cuenta los espacios dentro de los textos que nos pidieron añadir.
SELECT
  CONCAT_WS(
    ' ',
    'La canción',
    C.nombre,
    'fue compuesta por',
    C.compositor
  ) 'Frase',
  COUNT(CP.id_cancion) 'Veces agregadas a playlists'
FROM
  canciones AS C
  LEFT JOIN canciones_de_playlists AS CP ON C.id = CP.id_cancion
GROUP BY
  C.id
ORDER BY
  COUNT(CP.id_cancion) DESC;

-- 2. Facturas
-- En el departamento de Finanzas de Musimundos quieren separar las facturas
-- dependiendo del origen de las mismas, pero les dicen que encuentran que hay
-- algunas columnas con resultados nulos.
-- Hacé una consulta a la base de datos que nos traiga la primer columna no nula que
-- encuentre entre las columnas estado_o_provincia_de_facturacion,
-- pais_de_facturacion y codigo_postal_de_facturacion.
SELECT
  id,
  estado_o_provincia_de_facturacion,
  pais_de_facturacion,
  codigo_postal_de_facturacion,
  COALESCE(
    estado_o_provincia_de_facturacion,
    pais_de_facturacion,
    codigo_postal_de_facturacion
  ) AS primera_direccion_no_nula
FROM
  facturas;

-- 3. Edad empleados
-- En el departamento de Recursos Humanos de Musimundos quieren saber la edad de
-- los empleados al momento que empezaron a trabajar en la empresa.
-- Hacé una consulta la base de datos que traiga la diferencia entre su fecha de
-- nacimiento y la fecha de contratación.
-- TIP: Recordá que DATEDIFF() retorna la diferencia entre las fechas expresada en
-- DÍAS. Teniendo esto en cuenta y sabiendo que un año pretende tener 365, cómo
-- realizarías la consulta?
SELECT
  id,
  nombre,
  apellido,
  DATEDIFF(fecha_de_contratacion, fecha_nacimiento) AS edad_cuando_entro_a_la_empresa,
  FLOOR(
    DATEDIFF(fecha_de_contratacion, fecha_nacimiento) / 365
  ) AS 'anios trabajando',
  FLOOR(
    (
      DATEDIFF(fecha_de_contratacion, fecha_nacimiento) % 365
    ) / 30
  ) AS 'meses trabajando',
  (
    DATEDIFF(fecha_de_contratacion, fecha_nacimiento) % 365
  ) % 30 AS 'dias trabajando'
FROM
  empleados;

-- 4. Última factura
-- En la aplicación de Musimundos, un usuario está revisando sus últimas facturas y
-- quiere saber en qué mes fue su última factura.
-- Hacé una consulta a la base de datos que traiga todas las facturas del cliente número
-- ordenadas por su fecha y extrae el mes de la misma.
SELECT
  *,
  MONTH (fecha_factura) AS mes
FROM
  facturas
WHERE
  id_cliente = 1
ORDER BY
  fecha_factura DESC;
