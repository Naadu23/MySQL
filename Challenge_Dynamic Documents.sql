/*Challenge: Dynamic Documents
A table is created for a documents app, with rows for each document with its title,
content, and author.
*/

/*Create a table for document*/
CREATE table documents (id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT,content
TEXT,author TEXT);

/*Add records*/
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
 VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
 INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
 VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates,
heights.");

 /* UPDATE to change the author to 'Jackie Draper' for all records with 'Jackie Paper'*/
 SELECT * FROM documents WHERE author = "Jackie Paper";
 UPDATE documents SET author = "Jackie Draper" WHERE id IN (3,4,5);
 
 /*OR*/
UPDATE documents
SET author ="Jackie Draper"
WHERE author = "Jackie Paper";

/*Display records*/
 SELECT * FROM documents;
 
 /*Delete records where title is 'Things I'm Afraid Of'*/ 
 SELECT * FROM documents WHERE title = "Things I'm Afraid Of";
 DELETE FROM documents WHERE id = 5;
 
 /*OR*/
 DELETE FROM documents WHERE title = "Things I'm Afraid Of";

/*Display records*/
 SELECT * FROM documents;