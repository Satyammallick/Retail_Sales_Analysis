-- Total profit and overall profit margin percentage
SELECT 
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM data;

-- Category profit & margin ranking
SELECT 
    category, 
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin

FROM data 
GROUP BY category 
ORDER BY total_profit DESC;

-- Top 3 and Bottom 3 Sub-Categories by total profit
-- (Top Profitable)
SELECT `sub-category`, ROUND(SUM(profit), 2) AS net_profit
FROM data 
GROUP BY `sub-category`
ORDER BY net_profit DESC 
LIMIT 3;

-- (Biggest Loss Makers - FIX: Changed MIN(profit) to SUM(profit) for accurate totals)
SELECT `sub-category`, ROUND(SUM(profit), 2) AS net_loss
FROM data 
GROUP BY `sub-category`
HAVING SUM(profit) < 0
ORDER BY net_loss ASC;

-- Products/Sub-Categories with High Sales but Negative or Low Profit
SELECT 
    `sub-category`, 
    ROUND(SUM(sales), 2) AS total_sales, 
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM data 
GROUP BY `sub-category`
ORDER BY total_profit ASC, total_sales DESC;