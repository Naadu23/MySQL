/*Challenge: FriendBook
A database is created for a friend networking site, with a table storing data on each person,
a second table on each person's hobbies, and a last table for friend connections between the people.*/

/*DROP TABLE persons, hobbies;*/

/*Create table for persons*/
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, fullname TEXT, age
INTEGER);

/*Add records to persons*/
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

/*Create table for hobbies*/
CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
name TEXT);

/*Add records to hobbies*/
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

/*Create table for friends*/
CREATE table friends (id INTEGER PRIMARY KEY AUTO_INCREMENT, person1_id INTEGER,
person2_id INTEGER);

/*Add records to friends*/
INSERT INTO friends (person1_id, person2_id)
VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
VALUES (2, 3);

/*Display records*/
SELECT * FROM persons;
SELECT * FROM hobbies;
SELECT * FROM friends;

/*Display a table showing people's names with their hobbies*/
SELECT persons.fullname AS person, hobbies.name AS hobbies 
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

/*Show the names of each pair of friends, based on the data in the friends table.*/
SELECT person1.fullname AS "friend1", person2.fullname AS "friend2"
FROM friends
JOIN persons person1
ON friends.person1_id = person1.id
JOIN persons person2
ON friends.person2_id = person2.id;

/*OR 
SELECT p1.fullname AS "person_1", p2.fullname AS "person_2" FROM friends
JOIN persons AS p1
ON friends.person1_id = p1.id
JOIN persons AS p2
ON friends.person2_id = p2.id;
*/