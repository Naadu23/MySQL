/* Challenge: Book List
Make a list of your favorite books.
Create a database table to store them in.
Create a table to store your list of books.
Include columns for id, name, and rating.
*/

/*Creating a new database*/
CREATE DATABASE challenge;

/*Create a table*/
CREATE TABLE books (id INTEGER PRIMARY KEY, name VARCHAR(255), rating FLOAT);

/*Adding records*/
INSERT INTO books (id,name,rating) 
	VALUES 
		(1, 'Alchemy of Souls', 5),
		(2, 'The Uncanny Counters', 4),
		(3, "Tyler's Gem", 5),
		(4, 'Hacking: The Art of Exploitation', 4),
		(5, 'Think Like a Man', 4),
		(6, 'Storm and Silence', 5),
		(7, 'The Midnight Library', 5),
		(8, 'No Sweetness Here', 4),
		(9, 'Doctor Lawyer', 4),
		(10, 'Pride and Prejudice', 4),
		(11,'The Alchemist', 5),
		(12,'Shannara Chronicles',4),
		(13, 'The Hobbit', 4.28),
		(14, "The Hunger Games", 4.34),
		(15, "A Game of Thrones", 4.4),
		(16, "The Fault in Our Stars", 4.21),
		(17,'Pompeii',4),
		(18,'Brave New World', 4),
		(19, 'The Secret Garden', 4.14),
		(20, 'The Goldfinch', 3.89),
		(21, 'Moby-Dick', 3.51),
		(22, 'The Shining', 4.21),
		(23,'A Song of Ice and Fire', 4.7),
		(24,'The Odyssey', 3.75),
		(25,'The Divine Fury', 4),
		(26,'The Purpose Driven Life',4),
		(27,'Pearls of Wisdom',4),
		(28,'Crash Landing On You',3),
		(29,'True Beauty',4),
		(30,'Believe',3)
		;

/*Display records*/
SELECT * FROM books;