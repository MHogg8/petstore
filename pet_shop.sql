CREATE TABLE pet_shop (
id serial4 primary key,
name VARCHAR(255),
Address VARCHAR(255),
Stock VARCHAR(255)
);

CREATE TABLE pet(
id serial4 primary key,
name VARCHAR(255),
species VARCHAR(255),
image VARCHAR(255),
shop_id INT4 references pet_shop(id)
);