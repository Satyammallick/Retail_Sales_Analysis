-- 1.Which shipping mode is used the most?
SELECT `Ship Mode`, COUNT(*) AS total_count
FROM data 
GROUP BY `Ship Mode` 
ORDER BY total_count DESC ;

-- 2.Which shipping mode generates the highest sales?
SELECT `Ship Mode`, ROUND(SUM(sales),2) AS total_sales
FROM data 
GROUP BY `Ship Mode` 
ORDER BY total_sales DESC ;

-- 3.Which shipping mode generates the highest profit?
SELECT `Ship Mode`, ROUND(SUM(profit),2) AS total_profit
FROM data 
GROUP BY `Ship Mode` 
ORDER BY total_profit DESC ;







