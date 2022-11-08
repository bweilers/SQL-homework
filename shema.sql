DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS mechant_category CASCADE;
DROP TABLE IF EXISTS mechant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- Create card_holder table and insert values
CREATE TABLE card_holder (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255)
);

-- Create credit_card table and insert values
CREATE TABLE credit_card (
  card INT PRIMARY KEY NOT NULL,
  cardholder_id INTEGER, --OR SHOULD THIS BE FOREIGN KEY?
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);


-- Create mechant_category table and insert values
CREATE TABLE mechant_category (
  id INT PRIMARY KEY NOT NULL,
  category_name VARCHAR(255)
);

-- Create mechant table and insert values
CREATE TABLE mechant (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  mechant_category INTEGER,
  FOREIGN KEY (mechant_category) REFERENCES mechant_category(id)
);

-- Create transaction table and insert values
CREATE TABLE transaction (
  id INT PRIMARY KEY NOT NULL,
  date VARCHAR(255),
  amount INTEGER,
  card INTEGER,
  id_merchant INTEGER,
  FOREIGN KEY (card) REFERENCES credit_card(card),
  FOREIGN KEY (id_merchant) REFERENCES mechant(id)
);


select * from card_holder;
select * from credit_card;
select * from mechant_category;
select * from mechant;
select * from transaction;

