-- 1
CREATE VIEW ACTORES AS
SELECT
  A.id,
  A.first_name,
  A.last_name,
  COUNT(AM.id) AS "Numeros de películas en las que participó"
FROM
  actors AS A
  JOIN actor_movie AS AM ON A.id = AM.actor_id
GROUP BY
  A.id;

-- 2
CREATE VIEW PELICULAS_ACTORES AS
SELECT
  M.*,
  COUNT(AM.id) AS "# actors"
FROM
  movies AS M
  JOIN actor_movie AS AM ON M.id = AM.movie_id
GROUP BY
  M.id
HAVING
  COUNT(AM.id) > 1;

-- 3
CREATE VIEW ACTORES_CON_SIN_PELICULA AS
SELECT
  A.id,
  A.first_name,
  A.last_name,
  M.title
FROM
  actors AS A
  LEFT JOIN actor_movie AS AM ON A.id = AM.actor_id
  LEFT JOIN movies AS M ON AM.movie_id = M.id;

-- 4
CREATE VIEW PELICULAS_SIN_ACTORES AS
SELECT
  M.id,
  M.title,
  AM.movie_id,
  AM.actor_id
FROM
  movies AS M
  LEFT JOIN actor_movie AS AM ON M.id = AM.movie_id
WHERE
  AM.actor_id IS NULL;

-- 5
CREATE VIEW ACTORES_SIN_PELICULAS AS
SELECT
  A.id,
  A.first_name,
  A.last_name,
  AM.movie_id,
  AM.actor_id
FROM
  actors AS A
  LEFT JOIN actor_movie AS AM ON A.id = AM.actor_id
WHERE
  AM.movie_id IS NULL;

-- 6
CREATE VIEW ACTORES_EN_2_O_MAS_PELICULAS AS
SELECT
  A.id,
  A.first_name,
  A.last_name,
  COUNT(AM.movie_id) AS "Peliculas en las que participó"
FROM
  actors AS A
  JOIN actor_movie AS AM ON A.id = AM.actor_id
GROUP BY
  A.id
HAVING
  COUNT(AM.movie_id) >= 2;
