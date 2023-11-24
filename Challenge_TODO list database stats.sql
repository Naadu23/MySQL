/* The TODO List Challenge
A table is created to store a TODO list with the number of minutes it will take to complete
each item. 
We are to find the SUM of minutes it will take to do all of the items on our TODO list using one SELECT statement.
*/

/*Create table for a todo list*/
CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);

/*add records*/
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on BA", 30);

/*display records*/
SELECT * FROM todo_list;

/*add record*/
INSERT INTO todo_list VALUES (4, "Practice MySQL on DataCamp", 50);

/*Total minutes to complete all task*/
SELECT SUM(minutes) AS "Total duration(mins)" FROM todo_list;

/*display records*/
SELECT * FROM todo_list;