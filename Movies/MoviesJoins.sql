-- 2.1
SELECT
  CONCAT_WS(" ", A.first_name, A.last_name) AS "Nombres y Apellidos",
  COUNT(M.id) AS "Numero de Peliculas"
FROM
  actors AS A
  JOIN actor_movie AS AM ON A.id = AM.actor_id
  JOIN movies AS M ON AM.movie_id = M.id
GROUP BY
  A.id;

-- 2.2
SELECT
  M.title AS "Título",
  COUNT(A.id) AS "Numero de Actores"
FROM
  actors AS A
  JOIN actor_movie AS AM ON A.id = AM.actor_id
  JOIN movies AS M ON AM.movie_id = M.id
GROUP BY
  M.id;

-- 2.3
SELECT
  CONCAT_WS(" ", A.first_name, A.last_name) AS "Nombres y Apellidos",
  M.title AS "Pelicula"
FROM
  actors AS A
  LEFT JOIN actor_movie AS AM ON A.id = AM.actor_id
  LEFT JOIN movies AS M ON AM.movie_id = M.id;

-- 2.4
SELECT
  M.title AS "Título",
  COUNT(A.id) AS "Numero de Actores"
FROM
  movies AS M
  LEFT JOIN actor_movie AS AM ON M.id = AM.movie_id
  LEFT JOIN actors AS A ON AM.actor_id = A.id
GROUP BY
  M.id
HAVING
  COUNT(A.id) = 0;

-- 2.5
SELECT
  CONCAT_WS(" ", A.first_name, A.last_name) AS "Nombres y Apellidos",
  COUNT(M.id) AS "Numero de Peliculas"
FROM
  actors AS A
  LEFT JOIN actor_movie AS AM ON A.id = AM.actor_id
  LEFT JOIN movies AS M ON AM.movie_id = M.id
GROUP BY
  A.id
HAVING
  COUNT(M.id) = 0;

-- 2.6
SELECT
  CONCAT_WS(" ", A.first_name, A.last_name) AS "Nombres y Apellidos",
  COUNT(M.id) AS "Numero de Peliculas"
FROM
  actors AS A
  LEFT JOIN actor_movie AS AM ON A.id = AM.actor_id
  LEFT JOIN movies AS M ON AM.movie_id = M.id
GROUP BY
  A.id
HAVING
  COUNT(M.id) >= 2;
