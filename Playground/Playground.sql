CREATE SCHEMA IF NOT EXISTS Playground;

USE Playground;

DROP DATABASE IF EXISTS Playground;

CREATE DATABASE IF NOT EXISTS Playground;

USE Playground;

CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(100) NOT NULL,
  lastname VARCHAR(100) NOT NULL,
  email VARCHAR(200) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  id_category INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_category) REFERENCES categories (id)
);

CREATE TABLE major (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  description TEXT
);

ALTER TABLE users ADD id_major INT;

ALTER TABLE users ADD FOREIGN KEY (id_major) REFERENCES major (id);

ALTER TABLE users
DROP FOREIGN KEY users_ibfk_1;

ALTER TABLE users
DROP COLUMN id_category;

ALTER TABLE users
DROP FOREIGN KEY users_ibfk_2;

ALTER TABLE users
DROP COLUMN id_major;

ALTER TABLE users ADD id_category INT;

ALTER TABLE users ADD FOREIGN KEY (id_category) REFERENCES categories (id);

CREATE TABLE user_major (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_user INT NOT NULL,
  id_major INT NOT NULL,
  inscription_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_user) REFERENCES users (id),
  FOREIGN KEY (id_major) REFERENCES major (id)
);
