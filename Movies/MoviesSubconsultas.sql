-- 1. Generar una consulta que devuelva como resultado todas las películas cuyo rating
-- esté por arriba del promedio.
SELECT
  *
FROM
  movies
WHERE
  rating >= (
    SELECT
      AVG (rating)
    FROM
      movies
  );

-- 2. Modificar la consulta anterior, agregando un filtro en el cálculo del promedio,
-- excluyendo los que tienen rating = 0.
-- Esto es para que el promedio del rating no esté afectado por los ceros.
SELECT
  *
FROM
  movies
WHERE
  rating >= (
    SELECT
      AVG (rating)
    FROM
      movies
    WHERE
      rating > 0
      AND rating IS NOT NULL
  );

-- 3. Generar una consulta que evalúe todos los actores que no han actuado en una
-- película ni tampoco en una serie.
SELECT
  A.*,
  COUNT(AE.id),
  COUNT(AM.id)
FROM
  actors AS A
  LEFT JOIN actor_episode AS AE ON A.id = AE.actor_id
  LEFT JOIN actor_movie AS AM ON A.id = AM.actor_id
GROUP BY
  A.id
HAVING
  COUNT(AE.id) = 0
  AND COUNT(AM.id) = 0;

-- Alternativa con Subconsulta
SELECT
  *
FROM
  actors AS A
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      actor_episode AS AE
    WHERE
      AE.actor_id = A.id
  )
  AND NOT EXISTS (
    SELECT
      1
    FROM
      actor_movie AS AM
    WHERE
      AM.actor_id = A.id
  );
