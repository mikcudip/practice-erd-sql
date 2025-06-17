DROP DATABASE IF EXISTS ShoppingCart;

CREATE DATABASE IF NOT EXISTS ShoppingCart;

USE temp_store;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2),
  stock INT,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shopping_cart (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_user INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_user) REFERENCES users (id)
);

CREATE TABLE shopping_cart_items (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_shopping_cart INT,
  id_product INT,
  quantity INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_shopping_cart) REFERENCES shopping_cart (id),
  FOREIGN KEY (id_product) REFERENCES products (id),
  UNIQUE (id_shopping_cart, id_product)
);

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE products ADD id_category INT;

ALTER TABLE products ADD FOREIGN KEY (id_category) REFERENCES categories (id);

CREATE TABLE categorys (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE categorys;
