
-- 1.What is the average discount by category?
SELECT category ,ROUND(AVG(discount),2) AS avg_discount
FROM data 
GROUP BY category;

-- 2.Which category receives the highest average discount?
SELECT category ,ROUND(AVG(discount),2) AS avg_discount
FROM data 
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 1;

-- 3.Which products have the highest discounts?
SELECT `sub-category` ,ROUND(MAX(discount),2) AS total_discount
FROM data 
GROUP BY `sub-category`
ORDER BY total_discount DESC;

-- 4.Which region offers the highest average discount?
SELECT region ,ROUND(AVG(discount),2) AS avg_discount
FROM data 
GROUP BY region
ORDER BY avg_discount DESC
LIMIT 1;

-- 5.How does discount affect profit?
SELECT 
(CASE
 WHEN discount = 0 THEN 'No Discount'
 WHEN discount <= 0.25 THEN 'Low Discount'  
 WHEN discount <=0.5  THEN 'Medium Discount'
 ELSE 'High Discount' END) AS discount_level ,
 ROUND(SUM(profit),2) AS total_profit
 FROM data 
 GROUP BY discount_level
 ORDER BY total_profit DESC;
 
 

