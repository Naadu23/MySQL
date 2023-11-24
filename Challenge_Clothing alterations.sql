/*Challenge: Clothing alterations
A table of clothes is created, and decided we need a price column. 
Hence there is a need for a few alterations on our table.
*/

/*Create table for clothes*/
CREATE TABLE clothes (id INTEGER PRIMARY KEY AUTO_INCREMENT, type TEXT,design TEXT);

/*Add records*/
INSERT INTO clothes (type, design)
 VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
 VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
 VALUES ("blazer", "black sequin");
 
 /*Display all records*/
 SELECT * FROM clothes;
 
 /*ALTER to add a 'price' column to the table*/ 
 ALTER TABLE clothes ADD price INTEGER;
 
 /*Display all records*/
 SELECT * FROM clothes;
 
 /*Assigning each item a price, where item 1 = 10 dollars, item 2 = 20
dollars, item 3 = 30 dollars*/
UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;

/*Display all records*/
 SELECT * FROM clothes;
 
 /*Adding a new item with all three attributes filled in, including price*/
 INSERT INTO clothes (type, design,price) 
 VALUES ("skirt","blue black",35);

/*Display all records*/
 SELECT * FROM clothes;