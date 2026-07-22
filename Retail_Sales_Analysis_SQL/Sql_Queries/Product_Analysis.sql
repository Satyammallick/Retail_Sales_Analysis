
-- 1. Which product sub-category generated the highest sales?
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM data 
GROUP BY `Sub-Category`
ORDER BY total_sales DESC
LIMIT 1;

-- 2. Which product sub-categories generated the highest net profit?
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM data 
GROUP BY `Sub-Category`
ORDER BY total_profit DESC
LIMIT 3;

-- 3. Which product sub-category incurred the biggest net loss overall?
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Profit), 2) AS total_loss
FROM data 
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY total_loss ASC
LIMIT 1;

-- 4a. Order volume count by Category
SELECT 
    Category, 
    COUNT(*) AS total_order_items
FROM data
GROUP BY Category
ORDER BY total_order_items DESC;

-- 4b. Order volume count by Sub-Category
SELECT 
    `Sub-Category`, 
    COUNT(*) AS total_order_items
FROM data
GROUP BY `Sub-Category`
ORDER BY total_order_items DESC;

-- 5. Sub-categories with high sales volume but low or negative profitability
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Sales), 2) AS total_sales, 
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin_pct
FROM data 
GROUP BY `Sub-Category`
ORDER BY total_profit ASC, total_sales DESC
LIMIT 10;

-- 6. Which sub-categories operating at an overall net loss?
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS net_profit
FROM data 
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY net_profit ASC;

-- 7. Which sub-categories receive the highest average discount?
SELECT 
    `Sub-Category`, 
    ROUND(AVG(Discount) * 100, 2) AS avg_discount_pct
FROM data 
GROUP BY `Sub-Category`
ORDER BY avg_discount_pct DESC
LIMIT 3;




