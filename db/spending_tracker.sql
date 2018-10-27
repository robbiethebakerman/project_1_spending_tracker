DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS categories;

CREATE TABLE sellers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE categories (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  colour VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  seller_id INT4 REFERENCES sellers(id),
  category_id INT4 REFERENCES categories(id),
  amount NUMERIC(7,2),
  transaction_time DATETIME,
  desciption VARCHAR(255)
);
