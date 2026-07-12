-- 1. What is the total profit?
SELECT ROUND(SUM(profit),2) AS total_profit
FROM data;

-- 2.What is the overall profit margin?
SELECT ROUND((SUM(profit) / SUM( sales)) *100 ,2) AS profit_margin
FROM data;

-- 3.Which region generated the highest profit?
SELECT region ,ROUND(SUM(profit),2) AS highest_profit
FROM data
GROUP BY region
ORDER BY highest_profit DESC
LIMIT 1;

-- 4.Which state generated the highest profit?
SELECT state ,ROUND(SUM(profit),2) AS highest_profit
FROM data
GROUP BY state
ORDER BY highest_profit DESC
LIMIT 1;

-- 5.Which category generated the highest profit?
SELECT category ,ROUND(SUM(profit),2) AS highest_profit
FROM data
GROUP BY category
ORDER BY highest_profit DESC
LIMIT 3;

-- 6.Which sub-category generated the highest profit?
SELECT `Sub-category` ,ROUND(SUM(profit),2) AS highest_profit
FROM data
GROUP BY `sub-category`
ORDER BY highest_profit DESC
LIMIT 3;

-- 7.Which products are making losses?
SELECT `sub-category`,MIN(profit) AS losses
FROM data
WHERE profit < 0
GROUP BY `sub-category`;

-- 8.Which sub-category generated the highest loss?
SELECT `sub-category`,MIN(profit) AS losses
FROM data
WHERE profit < 0
GROUP BY `sub-category`
ORDER BY losses 
LIMIT 1;

-- 9.Which category has the highest profit margin?
SELECT category, ROUND(SUM(profit) * 100 / SUM(sales) ,2) AS profit_margin
FROM data 
GROUP BY category 
ORDER BY profit_margin DESC;



