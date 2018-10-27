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
  amount NUMERIC(7,2) NOT NULL,
  transaction_time TIMESTAMP(0),
  description VARCHAR(255)
);

-- INSERT INTO sellers (name)
--   VALUES ('Tesco');
--
-- INSERT INTO categories (name, colour)
--   VALUES ('Groceries', 'Blue');
--
-- INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description)
--   VALUES (1, 1, 22.70, '2018-10-27 16:54:00', 'Food for dinner');
--
-- INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description)
--   VALUES (1, 1, 22.70, 'now', 'Food for dinner')
