-- name: movies
INSERT INTO
  users (
    created_at,
    updated_at,
    title,
    rating,
    awards,
    release_date,
    lenght,
    genre_id
  )
VALUES
  (
    now(),
    now(),
    "Ferrari",
    0,
    0,
    Cast("2023-01-01" AS DATETIME),
    0,
    1
  )
RETURNING
  id,
  created_at;

CREATE TABLE Categoria_Producto (
  id_categoria INT PRIMARY KEY,
  nombre varchar(100),
  fecha_creacion timestamp
);

ALTER TABLE productos
ADD categoria int;

ALTER TABLE productos
ADD constraint `fk` FOREIGN KEY (`Categoria`) REFERENCES `categoria_producto` (`id_categoria`)
