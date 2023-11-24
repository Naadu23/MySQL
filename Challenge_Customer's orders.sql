/*Challenge: Customer's orders
A database for customers and their orders is created. Not all of the customers have
made orders, however. We have to list the name and email of every
customer followed by the item and price of orders they've made. As well as 
the total amount of money they've spent on orders.*/

/*Create table for customers*/
CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email
TEXT);

/*Add records to the customers' table*/
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

/*Create table for orders*/
CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item
TEXT,price REAL);

/*Add records to the table for orders*/
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
 VALUES (1, "TARDIS", 1000000.00);
 
 /*Display records from both tables*/
 SELECT * FROM customers;
 SELECT * FROM orders;
 
 /*Displaying all customers and order details- (with or without orders)*/
SELECT customers.name, customers.email, orders.item, orders.price FROM customers 
	LEFT OUTER JOIN orders 
		ON customers.id = orders.customer_id;
        
/*Show each customer, with their name, email, and total amount of money 
they've spent on orders.Sort by most spent to the least spent*/
SELECT customers.name, customers.email, SUM(orders.price) AS "total_price" 
 FROM customers 
	LEFT OUTER JOIN orders 
		ON customers.id = orders.customer_id
			GROUP BY customers.name, customers.email
				ORDER BY total_price DESC;
