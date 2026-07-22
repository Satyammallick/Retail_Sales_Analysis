
-- Total record count
SELECT COUNT(*) AS total_records 
FROM data;

-- Product catalog hierarchy summary
SELECT 
    COUNT(DISTINCT Category) AS total_categories,
    COUNT(DISTINCT `Sub-Category`) AS total_sub_categories
FROM data;

-- Overall geographic footprint
SELECT 
    COUNT(DISTINCT Region) AS total_regions,
    COUNT(DISTINCT State) AS total_states,
    COUNT(DISTINCT City) AS total_cities
FROM data;

-- Stae Distribution per region
SELECT 
    Region, 
    COUNT(DISTINCT State) AS total_states
FROM data
GROUP BY Region
ORDER BY total_states DESC;

--  Customer Segment overview
SELECT 
    Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM data
GROUP BY Segment
ORDER BY total_sales DESC;





