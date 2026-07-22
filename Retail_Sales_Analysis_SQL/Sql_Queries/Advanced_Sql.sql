-- 1. Rank products (sub-categories) by profit within each Category
WITH product_profit AS (
    SELECT 
        Category, 
        `Sub-Category`,
        ROUND(SUM(Profit), 2) AS net_profit
    FROM data
    GROUP BY Category, `Sub-Category`
) 
SELECT 
    Category, 
    `Sub-Category` AS product_line, 
    net_profit,
    RANK() OVER (PARTITION BY Category ORDER BY net_profit DESC) AS profit_rank
FROM product_profit;


-- 2. Find the second-highest profitable state (Using OFFSET)
SELECT 
    State, 
    ROUND(SUM(Profit), 2) AS net_profit
FROM data
GROUP BY State 
ORDER BY net_profit DESC
LIMIT 1 OFFSET 1;


-- 3. Top 3 product sub-categories by sales within each Category
WITH product_sales AS (
    SELECT 
        Category, 
        `Sub-Category`,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM data
    GROUP BY Category, `Sub-Category`
),
sales_rank AS (
    SELECT 
        Category,
        `Sub-Category`, 
        total_sales,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY total_sales DESC) AS rnk 
    FROM product_sales
) 
SELECT 
    Category,
    `Sub-Category` AS product_line, 
    total_sales,
    rnk AS category_rank
FROM sales_rank
WHERE rnk <= 3;


-- 4. Region contribution (%) to total sales
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND((SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM data)), 2) AS sales_pct
FROM data 
GROUP BY Region
ORDER BY sales_pct DESC;


-- 5. Categories contributing more than 20% of total sales
SELECT 
    Category, 
    ROUND(SUM(Sales), 2) AS total_sales, 
    ROUND((SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM data)), 2) AS sales_pct
FROM data
GROUP BY Category 
HAVING total_sales > ((SELECT SUM(Sales) FROM data) * 0.20)
ORDER BY total_sales DESC;


-- 6. Sub-Category profit contribution % relative to parent Category
WITH sub_category_profits AS (
    SELECT 
        Category,
        `Sub-Category`,
        ROUND(SUM(Profit), 2) AS sub_profit
    FROM data
    GROUP BY Category, `Sub-Category`
)
SELECT 
    Category,
    `Sub-Category`,
    sub_profit,
    ROUND(SUM(sub_profit) OVER(PARTITION BY Category), 2) AS category_total_profit,
    ROUND((sub_profit * 100.0 / SUM(sub_profit) OVER(PARTITION BY Category)), 2) AS profit_contrib_pct
FROM sub_category_profits
ORDER BY Category, profit_contrib_pct DESC;


-- 7. Cumulative running total of Sales by Region
SELECT 
    Region,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS subcategory_sales,
    ROUND(SUM(SUM(Sales)) OVER(PARTITION BY Region ORDER BY SUM(Sales) DESC), 2) AS running_total_sales
FROM data
GROUP BY Region, `Sub-Category`;

 

