-- creating tables
CREATE TABLE users(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

CREATE TABLE carts(
   id SERIAL PRIMARY KEY,
   user_id INT NOT NULL, 
   CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);	

CREATE TABLE items(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   price Int
);

CREATE TABLE cart_item( 
   	cart_id INT,
	item_id INT,
	PRIMARY KEY (cart_id, item_id),
	CONSTRAINT fk_cart FOREIGN KEY(cart_id) REFERENCES carts(id) ON DELETE CASCADE,
	CONSTRAINT fk_item FOREIGN KEY(item_id) REFERENCES items(id)
);
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	created_at DATE NOT NULL DEFAULT CURRENT_DATE,
	CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE item_order( 
	item_id INT,
	order_id INT,
	PRIMARY KEY (item_id, order_id),
	CONSTRAINT fk_item FOREIGN KEY(item_id) REFERENCES items(id),
	CONSTRAINT fk_cart FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE
);


-- inserting test data

-- insert items
INSERT INTO items (name, price) VALUES('Samsung Galaxy A32', 21990);
INSERT INTO items (name, price) VALUES('Samsung Galaxy A23', 17990);
INSERT INTO items (name, price) VALUES('Samsung Galaxy S22 Ultra', 98990);
INSERT INTO items (name, price) VALUES('HUAWEI P50 Pocket', 99990);
INSERT INTO items (name, price) VALUES('HUAWEI nova 9 SE', 20990);
INSERT INTO items (name, price) VALUES('Xiaomi Redmi Note 11s', 22990);
INSERT INTO items (name, price) VALUES('Xiaomi 12T Pro', 54990);
INSERT INTO items (name, price) VALUES('Xiaomi Redmi Note 10S', 14990);
INSERT INTO items (name, price) VALUES('Xiaomi Redmi Note 11', 17990);
INSERT INTO items (name, price) VALUES('Xiaomi Redmi Note 11s', 22990);
INSERT INTO items (name, price) VALUES('Apple iPhone 14', 77990);
INSERT INTO items (name, price) VALUES('Apple iPhone 14 Plus', 116990);
INSERT INTO items (name, price) VALUES('Apple iPhone 13 Pro Max', 149990);

-- insert users
INSERT INTO users ("name") VALUES('Oleg');
INSERT INTO users ("name") VALUES('Evgenyi');
INSERT INTO users ("name") VALUES('Sergey');
INSERT INTO users ("name") VALUES('Konstantin');
INSERT INTO users ("name") VALUES('Olga');
INSERT INTO users ("name") VALUES('Yuryi');
INSERT INTO users ("name") VALUES('Natalia');


-- insert carts
INSERT INTO carts (user_id) VALUES(1);
INSERT INTO carts (user_id) VALUES(4);
INSERT INTO carts (user_id) VALUES(5);

-- insert cart_item
INSERT INTO cart_item (cart_id,item_id) VALUES(1, 1);
INSERT INTO cart_item (cart_id,item_id) VALUES(1, 2);
INSERT INTO cart_item (cart_id,item_id) VALUES(1, 7);
INSERT INTO cart_item (cart_id,item_id) VALUES(2, 11);

-- insert orders
INSERT INTO orders (user_id) VALUES(2);
INSERT INTO orders (user_id) VALUES(2);
INSERT INTO orders (user_id) VALUES(2);
INSERT INTO orders (user_id) VALUES(6);
INSERT INTO orders (user_id) VALUES(7);
INSERT INTO orders (user_id) VALUES(3);
INSERT INTO orders (user_id) VALUES(3);
INSERT INTO orders (user_id) VALUES(2);

-- insert item_order

INSERT INTO item_order (item_id, order_id) VALUES(2, 1);
INSERT INTO item_order (item_id, order_id) VALUES(3, 1);
INSERT INTO item_order (item_id, order_id) VALUES(10, 2);
INSERT INTO item_order (item_id, order_id) VALUES(4, 3);
INSERT INTO item_order (item_id, order_id) VALUES(2, 3);
INSERT INTO item_order (item_id, order_id) VALUES(2, 3);
INSERT INTO item_order (item_id, order_id) VALUES(5, 3);
INSERT INTO item_order (item_id, order_id) VALUES(6, 4);
INSERT INTO item_order (item_id, order_id) VALUES(9, 4);
INSERT INTO item_order (item_id, order_id) VALUES(10, 5);
INSERT INTO item_order (item_id, order_id) VALUES(13, 6);
INSERT INTO item_order (item_id, order_id) VALUES(12, 7);
INSERT INTO item_order (item_id, order_id) VALUES(1, 8);
INSERT INTO item_order (item_id, order_id) VALUES(11, 8);

-- запрос для вывода одной таблицы, которая содержит эти данные:
-- users.id , users.name , orders.id , items.id, items.name, orders.created_at
SELECT users.id, users.name, 
	orders.id AS order_id, orders.created_at, 
	items.id AS item_id, items.name AS item_name
FROM users
LEFT JOIN orders ON users.id = orders.user_id
LEFT JOIN item_order ON orders.id = item_order.order_id
LEFT JOIN items ON items.id = item_order.item_id
ORDER BY users.id, order_id

-- DELETE FROM users WHERE id = 1;


