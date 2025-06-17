-- 1
SELECT
  COUNT(id) AS Total
FROM
  movies;

-- 2
SELECT
  COUNT(*) AS "Entre 3 y 7 premios"
FROM
  movies
WHERE
  awards BETWEEN 3 AND 7;

-- 3
SELECT
  COUNT(*) AS "Result"
FROM
  movies
WHERE
  awards BETWEEN 3 AND 7
  AND rating > 7;

-- 4
SELECT
  genre_id,
  COUNT(*)
FROM
  movies
GROUP BY
  genre_id;

-- 5
SELECT
  genre_id,
  SUM(awards),
  COUNT(*)
FROM
  movies
GROUP BY
  genre_id
HAVING
  SUM(awards) > 5;
