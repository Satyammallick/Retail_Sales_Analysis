-- Average discount by Category & Region
SELECT category, ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM data 
GROUP BY category
ORDER BY avg_discount_pct DESC;

SELECT region, ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM data 
GROUP BY region
ORDER BY avg_discount_pct DESC;

-- Top 3 Sub-Categories receiving highest average discount
SELECT `sub-category`, ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM data 
GROUP BY `sub-category`
ORDER BY avg_discount_pct DESC
LIMIT 3;

-- Impact of Discount Tiers on Net Profitability
SELECT 
    CASE
        WHEN discount = 0 THEN '0% (No Discount)'
        WHEN discount <= 0.25 THEN '1-25% (Low Discount)'  
        WHEN discount <= 0.5 THEN '26-50% (Medium Discount)'
        ELSE '>50% (High Discount)' 
    END AS discount_tier,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM data 
GROUP BY discount_tier
ORDER BY total_profit DESC;

 
 

