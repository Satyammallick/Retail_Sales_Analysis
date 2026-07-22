
-- Total sales across the entire business
SELECT ROUND(SUM(sales), 2) AS total_sales 
FROM data;

-- Average sales amount
SELECT ROUND(AVG(sales), 2) AS average_sales 
FROM data;

-- Top-performing Region, State, and City by sales
SELECT region, ROUND(SUM(sales), 2) AS total_sales
FROM data GROUP BY region ORDER BY total_sales DESC LIMIT 1;

SELECT state, ROUND(SUM(sales), 2) AS total_sales
FROM data GROUP BY state ORDER BY total_sales DESC LIMIT 1;

SELECT city, ROUND(SUM(sales), 2) AS total_sales
FROM data GROUP BY city ORDER BY total_sales DESC LIMIT 1;

-- Regional contribution percentage to overall sales
SELECT 
    region, 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND((SUM(sales) * 100.0 / (SELECT SUM(sales) FROM data)), 2) AS sales_percentage
FROM data 
GROUP BY region
ORDER BY total_sales DESC;

-- Sales distribution across Customer Segments
SELECT 
    segment, 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND((SUM(sales) * 100.0 / (SELECT SUM(sales) FROM data)), 2) AS sales_percentage
FROM data 
GROUP BY segment
ORDER BY total_sales DESC;

-- Categories contributing more than 20% of total revenue
SELECT 
    category, 
    ROUND(SUM(sales), 2) AS total_sales, 
    ROUND((SUM(sales) * 100.0 / (SELECT SUM(sales) FROM data)), 2) AS sales_percentage
FROM data
GROUP BY category 
HAVING total_sales > ((SELECT SUM(sales) FROM data) * 0.20)
ORDER BY total_sales DESC;