/*Challenge: Sequels in SQL
A table is created with all the 'Harry Potter' movies, with a sequel_id column that
matches the id of the sequel for each movie. We are to show the title of each
movie next to its sequel's title (or NULL if it doesn't have a sequel).*/

/*Create table for movies*/
CREATE TABLE moviess (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);

/*aad records*/
INSERT INTO moviess VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO moviess VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO moviess VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO moviess VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO moviess VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO moviess VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO moviess VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO moviess VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011,NULL);

/*Display records*/
SELECT * FROM moviess;

/*Issue a  SELECT that will show the title of each movie next to its 
sequel's title (or NULL if it doesn't have a sequel).*/
SELECT moviess.title AS "movie_title", sequel.title AS "sequel_title"
FROM moviess
LEFT OUTER JOIN moviess sequel
ON moviess.sequel_id = sequel.id;

