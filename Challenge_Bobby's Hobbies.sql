/*Challenge: Bobby's Hobbies
A table for people and hobbies is created, and each row in hobbies is related to a
row in persons via the person_id.*/

/*Create table for persons*/
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age
INTEGER);

/*Add records*/
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("Jerry Jay", 9);

/*Create table for hobbies*/
CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
 name TEXT);
 
 /*Add records*/
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
INSERT INTO hobbies (person_id, name) VALUES (5, "hunting");

/*Display records*/
SELECT * FROM persons;
SELECT * FROM hobbies;

/*Add more records*/
INSERT INTO persons (name, age) VALUES ("Merry May", 29);
INSERT INTO hobbies (person_id, name) VALUES (7, "coding");

/*Join the tables to display each person's name next to their hobby*/
SELECT persons.name, hobbies.name AS hobbies FROM persons
	JOIN hobbies 
		ON persons.id = hobbies.person_id;
        
/*Display only records of Bobby McBobbyFace*/
SELECT persons.name, hobbies.name AS hobbies FROM persons
	JOIN hobbies 
		ON persons.id = hobbies.person_id
			WHERE persons.name = "Bobby McBobbyFace";
        
