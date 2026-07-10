-- 1.Total Records presesnt in the Dataset
SELECT COUNT(*) AS Total_Records
 FROM data;

-- 2. How many unique products are sold?

SELECT COUNT(DISTINCT(`Sub-Category`)) AS unique_products
 FROM data;

-- 3.How many categories and sub-categories are there?

SELECT COUNT(DISTINCT(`Category`)) AS categories,
COUNT(DISTINCT(`Sub-Category`)) AS sub_categories
FROM data;
 
 
 -- 4. Which regions, states, and cities are covered?
 
 SELECT DISTINCT(Region)  -- unique regions
 FROM data
 ORDER BY Region;
 
  SELECT COUNT(DISTINCT(Region)) AS Total_Regions  -- Total number of regions
 FROM data
 ORDER BY Region;
 
 SELECT DISTINCT(State) -- unique states 
 FROM data
 ORDER BY State;
 
  SELECT COUNT(DISTINCT(State)) AS Total_States -- Total number of States
 FROM data
 ORDER BY State;
 
 SELECT DISTINCT(City) -- Unique cities
 FROM data
 ORDER BY City;
 
  SELECT COUNT(DISTINCT(City)) AS Total_cities -- Total Number Of Cities
 FROM data
 ORDER BY City;
 
 -- 5. Total states in each region
 SELECT Region , COUNT(DISTINCT(State)) AS Total_States
 FROM data 
 GROUP BY Region;


SELECT *FROM data
LIMIT 100;







