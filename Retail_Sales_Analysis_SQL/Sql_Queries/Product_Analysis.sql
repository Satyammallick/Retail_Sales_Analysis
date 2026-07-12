
-- 1. Which products generated the highest sales?
SELECT `sub-category` , ROUND(SUM(sales),2) AS total_sales
FROM data 
GROUP BY `sub-category`
ORDER BY highest_sales DESC
LIMIT 1;

-- 2.Which products generated the highest profit?
SELECT `sub-category` , ROUND(SUM(profit),2) AS total_profit
FROM data 
GROUP BY `sub-category`
ORDER BY total_profit DESC
LIMIT 3;

-- 3. Which products generated the highest loss?
SELECT `sub-category` , ROUND(SUM(profit),2) AS total_loss
FROM data 
WHERE profit < 0
GROUP BY `sub-category`
ORDER BY total_loss 
LIMIT 1;

-- 4. Which category contains the most products?
SELECT category , COUNT(*) AS total_products
FROM data
GROUP BY category
ORDER BY total_products DESC;

-- 4.Which sub-category contains the most products?
SELECT `sub-category`, COUNT(*) AS total_products
FROM data
GROUP BY `sub-category`
ORDER BY total_products DESC;

-- 5.Which products have high sales but low profit?
SELECT `sub-category` , ROUND(SUM(sales),2) AS total_sales ,ROUND(SUM(profit),2) AS total_profit
FROM data 
GROUP BY `sub-category`
ORDER BY total_profit ASC, total_sales DESC
LIMIT 10;

-- 6.Which products have never generated profit?
SELECT `Sub-category` ,MAX(profit) AS net_profit
FROM data 
GROUP BY `Sub-category`
HAVING MAX(profit) < 0  ;

-- 7.Which products have the highest average discount?
SELECT `Sub-category` ,ROUND(AVG(discount),2)*100 AS avg_discount_in_percentage
FROM data 
GROUP BY `Sub-category`
ORDER BY avg_discount_in_percentage DESC
LIMIT 3;




SELECT * FROM data LIMIT 100;