/* The Playlist maker challenge
A database is created with songs and artists, and we'll make a Pop playlists from them in this challenge.
Using queries we'll decide what songs to sing.
*/
/*Create table for the artists*/
CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    country TEXT,
    genre TEXT);

    /*Add records*/
INSERT INTO artists (name, country, genre)
    VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artists (name, country, genre)
    VALUES ("Queen", "UK", "Rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Rihanna", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Bob Marley", "Jamaica", "Reggae");
    
/*Create table for the songs*/
CREATE TABLE songs2 (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    artist TEXT,
    title TEXT);
    
    /*Add records*/
INSERT INTO songs2 (artist, title)
    VALUES ("Taylor Swift", "Shake it off");
INSERT INTO songs2 (artist, title)
    VALUES ("Rihanna", "Stay");
INSERT INTO songs2 (artist, title)
    VALUES ("Celine Dion", "My heart will go on");
INSERT INTO songs2 (artist, title)
    VALUES ("Celine Dion", "A new day has come");
INSERT INTO songs2 (artist, title)
    VALUES ("Shania Twain", "Party for two");
INSERT INTO songs2 (artist, title)
    VALUES ("Gloria Estefan", "Conga");
INSERT INTO songs2 (artist, title)
    VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO songs2 (artist, title)
    VALUES ("ABBA", "Mamma mia");
INSERT INTO songs2 (artist, title)
    VALUES ("Queen", "Bicycle Race");
INSERT INTO songs2 (artist, title)
    VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO songs2 (artist, title)
    VALUES ("Guns N' Roses", "Don't cry");
    
/*Display records*/
    SELECT * FROM songs2;
    SELECT * FROM artists;
    
/*Display title of all the songs by the artist named 'Queen'*/
   SELECT title FROM songs2 WHERE artist ="Queen";
   
/*Making a 'Pop' playlist.
   Display the name of all of the artists from the'Pop' genre.*/
   SELECT name FROM artists WHERE genre ="Pop";
   
/*Select the title of all the songs from the 'Pop' artists.*/
      SELECT title FROM songs2 
       WHERE artist 
        IN (
         SELECT name FROM artists 
          WHERE genre ="Pop");
