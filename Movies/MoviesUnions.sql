-- Entretenimiento
-- Generar un resultado que combine los nombres de las películas y los nombres de las series.
-- Adicionalmente debe contener el género de la película o serie. Y una columna adicional que
-- sea “Tipo de entretenimiento” con los valores de película o serie.
SELECT
  title,
  G.name AS "género",
  "película" AS "Tipo de entretenimiento"
FROM
  movies AS M
  JOIN genres AS G ON M.genre_id = G.id
UNION ALL
SELECT
  title,
  G.name AS "género",
  "series" AS "Tipo de entretenimiento"
FROM
  series AS S
  JOIN genres AS G ON S.genre_id = G.id;

-- Movies
-- El administrador de la base de datos creó una nueva tabla para los inserts nuevos de
-- películas. Para esto te adjunta el script de creación de la tabla más los datos en el siguiente
-- link: Movies_2020.
-- Cómo resultado, debemos crear una query que consolide los nombres de las películas de la
-- tabla de Movies y Movies_2020.
-- ¿Qué sucede si en vez de Union all empleamos Union?
SELECT
  *
FROM
  movies
UNION
SELECT
  *
FROM
  movies_2020;
