/*Pokemon Data Dig Project

Exploring Pokemon through this data-dig project which delves into a diverse dataset featuring details 
about numerous Pokemon species, including their attributes and classifications. 
Using SQL queries, we extract insights, statistics, and trends to enhance our understanding 
of Pokemon.

*PROJECT HIGHLIGHTS*
Query 1: Overview
Display all records in the Pokemon dataset to provide a comprehensive overview.
Query 2: Understanding Averages
Calculate average values for key attributes, setting a baseline for further analysis.
Query 3: Type-wise Analysis
Analyze Pokemon types, examining aggregate statistics and classifying them based on legendary status.
Query 4: Legendary Best Type
Focus on the pokemons under the type with highest stats, specifically looking at legendary.
Query 5: Generation Insights
Examine the distribution of Pokemon across generations with above-average total stats, speed, or above-average HP.
Query 6: Total Stats Ranges
Categorize Pokemon into different total stat ranges, examining number, average, maximum, and minimum total stats values in each range.
Query 7: Legendary vs. Non-Legendary Comparison
Compare average values of different attributes between legendary and non-legendary Pokemon.
Query 8: Elite Speedsters
Spotlight the top 15 Pokemon excelling in both above-average speed and total stats.
Query 9: Type-based Attributes Analysis
Group Pokemon by their type_2 category and provide insights based on comparing average values of total stats, HP, and speed.
*/

/*Display all records in pokemon*/
SELECT * FROM pokemon;

/*Find average for key values to assume the threshold of each in the analysis
	- num_pokemon: Number of Pokemon in each category
	- avg_total: Average total stats
	- avg_hp: Average HP (Hit Points)
	- avg_attack: Average Attack stat
	- avg_defense: Average Defense stat
	- avg_sp_atk: Average Special Attack stat
	- avg_sp_def: Average Special Defense stat
	- avg_speed: Average Speed stat 
   */
SELECT
 COUNT(Name) AS num_pokemon,
  AVG(Total) AS avg_total,
  AVG(HP) AS avg_hp,
  AVG(Attack) AS avg_attack,
  AVG(Defense) AS avg_defense,
  AVG(Sp_Atk) AS avg_sp_atk,
  AVG(Sp_Def) AS avg_sp_def,
  AVG(Speed) AS avg_speed
FROM pokemon;


/*Display aggregate statistics for each unique Type_1 and Type_2 category.
The COALESCE function returns the first non-null value in the list,
It is used to handle cases where A or B might be NULL.
- category: Unique types
- num_pokemon: Number of Pokemon in each category
- avg_total: Average total stats
- max_total: Maximum total stats
- min_total: Minimum total stats
- num_legendary: Number of Legendary Pokemon in each category
- num_non_legendary: Number of Non-Legendary Pokemon in each category
*/
SELECT
  category,
  COUNT(Name) AS num_pokemon,
  AVG(Total) AS avg_total,
  MAX(Total) AS max_total,
  MIN(Total) AS min_total,
  SUM(Legendary = 'True') AS num_legendary,
  SUM(Legendary = 'False') AS num_non_legendary
FROM (
  SELECT DISTINCT Type_1 AS category, Name, Total, Legendary FROM pokemon
  UNION
  SELECT DISTINCT Type_2 AS category, Name, Total, Legendary FROM pokemon WHERE Type_2 IS NOT NULL
) AS merged_data
GROUP BY category
ORDER BY avg_total DESC;


/*Display pokemon records under the Type with highest total average (Dragon) and classified as lengendary*/
SELECT * FROM pokemon
WHERE (Type_1 = 'Dragon' OR Type_2 = 'Dragon') AND Legendary = 'TRUE';


/*Distribution of Pokemon Generations based on above-average Total stats and Speed
- num_pokemon: Number of Pokemon in each category
- avg_total: Average total stats
- avg_speed: Average Speed stats
- avg_hp: Average HP (Hit Points)
*/
SELECT
  Generation,
  COUNT(Name) AS num_pokemon,
  AVG(Total) AS avg_total,
  AVG(Speed) AS avg_speed,
  AVG(HP) AS avg_hp,
  CASE
    WHEN MAX(Legendary) = 'True' THEN 'Legendary Pokemon'
    ELSE 'Non Legendary Pokemon'
  END AS legendary_status,
  CASE
    WHEN (AVG(Total) > (SELECT AVG(Total) FROM pokemon)) 
         AND (AVG(Speed) > (SELECT AVG(Speed) FROM pokemon))
           AND AVG(HP) > 70 THEN 'Both Conditions Satisfied - has above-average total and speed stats'
    ELSE 'Only HP Condition Satisfied - has below-average total and speed stats'
  END AS note
FROM pokemon
GROUP BY Generation
HAVING (AVG(Total) > (SELECT AVG(Total) FROM pokemon)) 
			AND (AVG(Speed) > (SELECT AVG(Speed) FROM pokemon))
				OR AVG(HP) > 70;



/*Display range of totals and the number of pokemons in the range, their average, max and min total stats values*/
SELECT
  CASE
	WHEN Total < 200 THEN 'Below 200'
	WHEN Total BETWEEN 199 AND 300 THEN '200-300'
    WHEN Total BETWEEN 299 AND 400 THEN '300-400'
    WHEN Total BETWEEN 399 AND 500 THEN '401-500'
    WHEN Total BETWEEN 499 AND 600 THEN '501-600'
	WHEN Total > 600 THEN 'Above 600'
    ELSE 'Other'
  END AS total_range,
  COUNT(Name) AS num_pokemon,
  AVG(Total) AS avg_total,
  MIN(Total) AS min_total,
  MAX(Total) AS max_total
FROM pokemon
GROUP BY total_range;

/*Compare average values for legendary and non-legendary Pokemon*/
SELECT
  CASE
    WHEN Legendary = 'TRUE' THEN 'Legendary Pokemon'
    ELSE 'Non Legendary Pokemon'
  END AS 'legendary_status',
  COUNT(Name) AS num_pokemon,
  AVG(Total) AS avg_total,
  AVG(HP) AS avg_hp,
  AVG(Attack) AS avg_attack,
  AVG(Defense) AS avg_defense,
  AVG(Sp_Atk) AS avg_sp_atk,
  AVG(Sp_Def) AS avg_sp_def,
  AVG(Speed) AS avg_speed
FROM pokemon
GROUP BY Legendary;

/*Display Top 15 Pokemon with above-average Speed and above-average Total stats*/
SELECT Name, Type_1, Total, Speed,
CASE
    WHEN Legendary = 'True' THEN 'Legendary'
    ELSE 'Non Legendary'
  END AS legendary_status
FROM pokemon
WHERE Speed > (SELECT AVG(Speed) FROM pokemon) AND Total > (SELECT AVG(Total) FROM pokemon)
ORDER BY Speed DESC
LIMIT 15;


/*Display Pokemon grouped by type category focusing on those with or without Type_2 with notes 
based on comparing average values of total stats, HP and speed*/
SELECT
  CASE
    WHEN Type_2 IS NULL THEN 'No Secondary Type'
    ELSE 'With Secondary Type'
  END AS type_category,
	  COUNT(Name) AS num_pokemon,
	  AVG(Total) AS avg_total,
	  AVG(HP) AS avg_hp,
	  AVG(Attack) AS avg_attack,
	  AVG(Defense) AS avg_defense,
	  AVG(Sp_Atk) AS avg_sp_atk,
	  AVG(Sp_Def) AS avg_sp_def,
	  AVG(Speed) AS avg_speed,
  CASE
    WHEN AVG(Total) > (SELECT AVG(Total) FROM pokemon)
		AND AVG(HP) > (SELECT AVG(HP) FROM pokemon)
		AND AVG(Speed) > (SELECT AVG(Speed) FROM pokemon)
    THEN 'Above Overall Average'
    WHEN AVG(Total) < (SELECT AVG(Total) FROM pokemon) 
		AND AVG(HP) < (SELECT AVG(HP) FROM pokemon)
		AND AVG(Speed) < (SELECT AVG(Speed) FROM pokemon)
    THEN 'Below Overall Average'
    ELSE 'Equal to Overall Average'
  END AS Notes
FROM pokemon
GROUP BY type_category;
