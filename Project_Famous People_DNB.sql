/*Project: Famous people
			BY DONNA N. BOTCHWAY
In this project, a table with a small set of “famous people” in data analytics is created.
More tables about things related to them are created to be joined producing nice human readable lists.
Tables created include the data experts table,consisting of the famous data analysts'
personal information consisting of their biography and year of birth.
A table for achievements and another for books and publications of the data experts.
 */

/*Create database for famous people */
	CREATE DATABASE famous_people;

	/*Create a table for data experts*/
	CREATE TABLE data_experts (
		id INT PRIMARY KEY AUTO_INCREMENT,
		full_name VARCHAR(255),
		birth_year INTEGER,
		nationality VARCHAR(255),
		biography TEXT
	);

/*Adding records to data experts table*/
	INSERT INTO data_experts (full_name, birth_year, nationality, biography)
		VALUES 
			('Nate Silver', 1978, 'US', 'Statistician, author, and founder of FiveThirtyEight.'),
			('D.J. Patil', 1974, 'US', 'Former U.S. Chief Data Scientist and a key figure in data science.'),
			('DJ Kaggle', 1985, 'India', 'Notable data scientist and a Kaggle competitions expert.'),
			('Hilary Mason', 1979, 'US', 'Data scientist, entrepreneur, and founder of Fast Forward Labs.'),
			('Andrew Ng', 1976, 'UK', 'Co-founder of Google Brain and an AI and machine learning educator.'),
			('Cassie Kozyrkov', 1983, 'US', 'Chief Decision Scientist at Google and a data science advocate.'),
			('Kirk Borne', 1956, 'US', 'Astrophysicist and data scientist known for his work in data analytics.'),
			('Monica Rogati', 1976, 'Italy', 'Data scientist, AI researcher, and tech executive.'),
			('Hans Rosling', 1948, 'Sweden', 'Public health expert who used data to tell compelling stories.'),
			('Carla Gentry', 1972, 'US', 'Data scientist and social media influencer in the data analytics field.');

        
/*Create a table for notable achievements by the data experts*/
	CREATE TABLE achievements (
		id INT PRIMARY KEY AUTO_INCREMENT,
		expert_id INT,
		honor TEXT,
		year INT
	);

/*Adding records to the achievements table*/
	INSERT INTO achievements (expert_id, honor, year)
		VALUES 
			(1, 'Predicted the outcomes of U.S. elections using statistical analysis.', 2008),
			(2, 'Pioneered the use of data analytics in the public sector.', 2015),
			(3, 'Top Kaggle competitor with numerous competition wins.', 2019),
			(4, 'Contributed to advances in natural language processing and AI.', 2016),
			(5, 'Co-founded Google Brain, an influential AI research lab.', 2011),
			(6, 'Advocates for data-driven decision-making and decision science.', 2017),
			(7, 'Prominent data scientist and educator in various fields.', 2010),
			(8, 'Leading AI and data science expert in the tech industry.', 2014),
			(9, 'Used data visualization to communicate global health trends.', 2010),
			(10, 'Prominent figure in the field of data science and analytics.', 2015);


/*Create table for books and publications by the data experts*/
	CREATE TABLE publications (
		id INT PRIMARY KEY AUTO_INCREMENT,
		expert_id INT,
		title VARCHAR(255),
		publication_year INT,
		description TEXT
	);

/*Adding records to the books and publications table*/
	INSERT INTO publications (expert_id, title, publication_year, description)
		VALUES 
			(1, 'The Signal and the Noise: Why So Many Predictions Fail—But Some Don''t', 2012, 
			'Explains the art of predictions and the role of data in it.'),
			(2, 'Building Data Science Teams', 2011, 
			'Provides insights into building successful data science teams.'),
			(1, 'Keep Your Eye on the Ball: A Discussion on Data Science', 2014, 
			'A collection of essays and discussions on data science and its applications'),
			(3, 'Kaggle Competitions: A Learning Guide for Data Science', 2020, 
			'A guide on how to succeed in Kaggle competitions.'),
			(4, 'Big Data: A Revolution That Will Transform How We Live, Work, and Think', 2012, 
			'Explores the impact of big data on society.'),
			(5, 'Machine Learning Yearning', 2020, 
			'A practical guide to understanding and mastering machine learning.'),
			(2, 'Data Jujitsu: The Art of Turning Data into Product', 2012, 
			'Discusses the practical aspects of data analysis and product development'),
			(6, 'Decision Intelligence', 2019, 
			'Explores decision-making using data and decision intelligence.'),
			(7, 'Astronomy and Big Data', 2014, 
			'Discusses the role of data analytics in astronomy.'),
			(8, 'Understanding Machine Learning: From Theory to Algorithms', 2014, 
			'An educational resource on machine learning.'),
			(9, 'Factfulness: Ten Reasons We''re Wrong About the World—and Why Things Are Better Than You Think', 2018, 
			'Uses data to challenge misconceptions about global health.'),
			(3, 'Data Science for Business: Winning Data Competitions', 2018, 
			'Focuses on strategies for competing in data science challenges and competitions'),
			(4, 'Data-Driven Strategies: Shaping the Future of Customer Engagement', 2016, 
			'Discusses data-driven approaches to customer engagement'),
			(6, 'The Chief Decision Scientist', 2020, 
			'Discusses the role of the Chief Decision Scientist in organizations'),
			(7, 'Data Science: The Smart Guide', 2015, 
			'An introductory guide to data science concepts and techniques'),
			(9, 'Global Health: An Introduction to Current and Future Trends', 2007, 
			'An overview of global health trends and challenges'),
			(10, 'Data Science for Business: What You Need to Know about Data Mining and Data-Analytic Thinking', 2013, 
			'A guide to data analytics for business professionals.');


/*Show records*/
	SELECT * FROM data_experts;
	SELECT * FROM achievements;
	SELECT * FROM publications;


/*Return honors attained by each data expert*/
	SELECT 
		de.full_name, 
        a.honor
	FROM 
		data_experts de
	JOIN 
		achievements a ON de.id = a.expert_id;


/*Return publications and their year made by the data experts*/
	SELECT 
		de.full_name, 
        p.title AS publications, 
        p.publication_year
	FROM 
		data_experts AS de
	LEFT OUTER JOIN 
		publications AS p ON de.id = p.expert_id;
    
    
/*Return honor,the year of honor and the number of publications associated with each data expert*/
	SELECT 
		de.full_name, 
		a.honor, 
		a.year AS "year of honor", 
		COUNT( p.title) AS publishment_count 
	FROM 
		data_experts de
	LEFT JOIN 
		achievements a ON de.id = a.expert_id
	LEFT JOIN 
		publications p ON de.id = p.expert_id
	GROUP BY 
		de.full_name, a.honor , a.year;


/*Showing biography including honors of data experts sorting by the year of honor (recent honors)*/
	SELECT 
		de.full_name, 
        de.biography, 
        a.honor, 
        a.year
	FROM 
		data_experts de
	JOIN 
		achievements a ON de.id = a.expert_id
	ORDER BY 
		a.year DESC;


/*Display US data experts with their publication focus and year of publication 2015 and after.
Sorted by most recent publications*/

	SELECT 
		de.full_name, 
        de.nationality, 
        p.description AS publication_subject,
        p.publication_year 
	FROM 
		data_experts de
	LEFT JOIN 
		achievements a ON de.id = a.expert_id
	LEFT JOIN 
		publications p ON de.id = p.expert_id
	WHERE 
		a.year >= 2015 
	AND 
		de.nationality = "US"
	ORDER BY 
		p.publication_year DESC;
      
      
/*Create pairs for a data project with US "data scientist" and US data experts with kaggle or google expertise.
Including their number of publications as number of reference material.
*/
	SELECT
		de1.full_name AS "Data Scientist",
		de1.biography AS ds_biography,
		de2.full_name AS "Google/Kaggle Expert",
		de2.biography AS gk_biography,
		COUNT(p.title) AS reference_material_count
	FROM
		data_experts de1
	JOIN
		data_experts de2 ON de1.id < de2.id
	LEFT JOIN
		publications p ON p.expert_id = de1.id OR p.expert_id = de2.id
	WHERE
		(de1.biography LIKE '%data scien%' AND de1.nationality = 'US')
		AND
		(de2.nationality = 'US' AND de2.biography LIKE '%google%' OR de2.biography LIKE '%kaggle%')
	GROUP BY
		 de1.full_name, de1.biography, de2.full_name, de2.biography;
