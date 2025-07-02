SELECT DISTINCT
  nombre,
  compositor,
  CONCAT_WS(
    " ",
    "La canción",
    nombre,
    "fue compuesta por",
    compositor
  ) AS Respuesta
FROM
  canciones;
