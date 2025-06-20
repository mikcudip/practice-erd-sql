DROP DATABASE Restaurant;

CREATE DATABASE Restaurant;

USE Restaurant;

CREATE TABLE restaurants (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  img_url VARCHAR(100),
  direction VARCHAR(100),
  openning_hours VARCHAR(25),
  calification INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  description VARCHAR(100)
);

CREATE TABLE dishes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  restaurant_id INT NOT NULL,
  category_id INT NOT NULL,
  name VARCHAR(50),
  description VARCHAR(100),
  img_url VARCHAR(100),
  price DECIMAL(10, 2),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id),
  FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE ingredients (
  id INT PRIMARY KEY AUTO_INCREMENT,
  dish_id INT NOT NULL,
  name VARCHAR(50),
  description VARCHAR(100),
  FOREIGN KEY (dish_id) REFERENCES dishes (id)
);

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  phone VARCHAR(25) NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  password_changed_at VARCHAR(100) NOT NULL,
  direction VARCHAR(100),
  door varchar(2),
  department varchar(2),
  notes VARCHAR(100),
  is_deactived BOOLEAN DEFAULT FALSE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  dish_id INT,
  order_datetime TIMESTAMP,
  quantity INT,
  price DECIMAL(10, 2),
  total DECIMAL(14, 2),
  notes VARCHAR(100),
  direction VARCHAR(100),
  shipping_datetime TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (dish_id) REFERENCES dishes (id)
);

CREATE TABLE user_type (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10)
);

CREATE TABLE renovation (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  user_type_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  expired_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (user_type_id) REFERENCES user_type (id)
);

SELECT
  *
FROM
  categories
WHERE
  name = "Estudent";

INSERT INTO
  restaurants (name)
VALUES
  ('Pizzaland'),
  ('Burger Town'),
  ('Sushi Place');

INSERT INTO
  categories (name)
VALUES
  ('Pizza'),
  ('Burger'),
  ('Sushi');

INSERT INTO
  dishes (restaurant_id, category_id, name, price)
VALUES
  (1, 1, 'Margarita', 10.50),
  (1, 1, 'Pepperoni', 12.00),
  (2, 2, 'Cheeseburger', 8.00),
  (3, 3, 'California Roll', 13.50);

DELETE FROM categories
WHERE
  name LIKE "%Estudent";

SELECT
  *
FROM
  categories
LIMIT
  5
OFFSET
  5;

SELECT
  *
FROM
  categories AS storbo
ORDER BY
  name;
