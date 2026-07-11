
-- 1.What is the total sales of the company?
SELECT ROUND(SUM(sales),2) AS total_sales 
FROM data;

-- 2.What is the average sales ?
SELECT ROUND(AVG(sales),2) AS average_sales 
FROM data;

-- 3.Which region generated the highest sales?
SELECT region ,ROUND(SUM(sales),2) AS highest_sales
FROM data 
GROUP BY region
ORDER BY highest_sales DESC 
LIMIT 1;

-- 4.Which state generated the highest sales?
SELECT state ,ROUND(SUM(sales),2) AS highest_sales
FROM data 
GROUP BY state
ORDER BY highest_sales DESC 
LIMIT 1;

-- 5.Which City generated the highest sales?
SELECT city ,ROUND(SUM(sales),2) AS highest_sales
FROM data 
GROUP BY city
ORDER BY highest_sales DESC 
LIMIT 1;

-- 6.Which category generated the highest sales?
SELECT category ,ROUND(SUM(sales),2) AS highest_sales
FROM data 
GROUP BY category
ORDER BY highest_sales DESC ;

-- 7.Which sub-category generated the highest sales?
SELECT `Sub-category` ,ROUND(SUM(sales),2) AS highest_sales
FROM data 
GROUP BY `Sub-category`
ORDER BY highest_sales DESC
LIMIT 1 ;

-- 8.Which customer segment contributes the highest sales?
SELECT  segment,ROUND(SUM(sales),2) AS highest_sales
FROM data 
GROUP BY segment
ORDER BY highest_sales DESC ;

-- 9.What are the top 10 sub-categories by sales?
SELECT `Sub-category` ,ROUND(SUM(sales),2) AS total_sales
FROM data
GROUP BY `Sub-category` 
ORDER BY total_sales DESC
LIMIT 10;


