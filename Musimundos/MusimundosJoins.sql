-- 1
SELECT
  C.nombre "Nombre",
  G.nombre "Género"
FROM
  canciones C
  JOIN generos G ON C.id_genero = G.id
WHERE
  G.nombre = "Rock";

-- 2
SELECT
  AL.titulo "Álbum",
  AR.nombre "Artista"
FROM
  albumes AL
  JOIN artistas AR ON AL.id_artista = AR.id
WHERE
  AR.nombre = "Deep Purple";

-- 3
SELECT
  C.nombre,
  T.nombre
FROM
  canciones C
  JOIN tipos_de_medio T ON C.id_tipo_de_medio = T.id
WHERE
  T.nombre = "MPEG audio file";

-- 4
SELECT
  P.nombre "Playlist",
  C.nombre "Canción"
FROM
  playlists P
  JOIN canciones_de_playlists CP ON P.id = CP.id_playlist
  JOIN canciones C ON CP.id_cancion = C.id;

-- 5
SELECT
  P.nombre "Playlist",
  C.nombre "Canción"
FROM
  canciones C
  JOIN canciones_de_playlists CP ON C.id = CP.id_cancion
  JOIN playlists P ON CP.id_playlist = P.id;

-- 5
SELECT
  C.nombre "Canción",
  COUNT(P.id)
FROM
  canciones C
  JOIN canciones_de_playlists CP ON C.id = CP.id_cancion
  JOIN playlists P ON CP.id_playlist = P.id
GROUP BY
  C.id
ORDER BY
  COUNT(P.id) DESC;
