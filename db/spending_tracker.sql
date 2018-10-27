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

-- INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description) VALUES (1, 1, 22.70, '27-Oct-2018 16:54', 'Food for dinner');
--
-- INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description)
--   VALUES (1, 1, 22.70, 'now', 'Food for dinner')
-- 
-- SELECT seller_id, category_id, amount, description, transaction_time, TO_CHAR(transaction_time, 'DD-Mon-YYYY HH24:MI') transaction_time_formatted FROM transactions WHERE id = $1;
