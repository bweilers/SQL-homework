DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- Create card_holder table and insert values
CREATE TABLE card_holder (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255)
);

-- Create credit_card table and insert values
CREATE TABLE credit_card (
  card VARCHAR(255) PRIMARY KEY NOT NULL,
  cardholder_id INTEGER, --OR SHOULD THIS BE FOREIGN KEY?
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);


-- Create merchant_category table and insert values
CREATE TABLE merchant_category (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255) --CORRECTED FOR CONVENTION FROM category_name
);

-- Create merchant table and insert values
CREATE TABLE merchant (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  id_merchant_category INTEGER,
  FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

-- Create transaction table and insert values
CREATE TABLE transaction (
  id INT PRIMARY KEY NOT NULL,
  date TIMESTAMP NOT NULL,
  amount FLOAT,
  card VARCHAR(255),
  id_merchant INTEGER,
  FOREIGN KEY (card) REFERENCES credit_card(card),
  FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);

select * from card_holder;
select * from credit_card;
select * from merchant_category;
select * from merchant;
select * from transaction;