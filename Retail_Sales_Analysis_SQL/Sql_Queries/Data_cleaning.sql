-- 1. Are there any NULL values in the dataset?

SELECT 
SUM(CASE WHEN  `Ship Mode` IS NULL THEN 1 ELSE 0 END) AS missing_shipmode,
SUM(CASE WHEN Segment IS NULL THEN 1 ELSE 0 END) AS null_segment,
SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS missing_Country,
SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS missing_city,
SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS missing_state,
SUM(CASE WHEN `postal Code` IS NULL THEN 1 ELSE 0 END) AS null_pincode,
SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS missing_Region,
SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS missing_category,
SUM(CASE WHEN `Sub-Category` IS NULL THEN 1 ELSE 0 END) AS missing_sub_cat,
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_Quantiy,
SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS null_profit
FROM data ;

-- 2.Are there any duplicate rows?

SELECT
    `Ship Mode`,
    Segment,
    Country,
    City,
    State,
    `Postal Code`,
    Region,
    Category,
    `Sub-Category`,
    Sales,
    Quantity,
    Discount,
    Profit,
    COUNT(*) AS Duplicate_Count
    FROM data
    GROUP BY 
        `Ship Mode`,
    Segment,
    Country,
    City,
    State,
    `Postal Code`,
    Region,
    Category,
    `Sub-Category`,
    Sales,
    Quantity,
    Discount,
    Profit
    HAVING COUNT(*) > 1;

-- 3. Are there any negative Sales values?
SELECT * FROM data WHERE Sales < 0;

-- 4.Are there any negative Quantity values?
SELECT * FROM data WHERE quantity < 0;

-- 5. Which rows have negative Profit?
SELECT COUNT(*) FROM data WHERE profit < 0;

-- 6.Are all Discount values within a valid range (0–1)?
SELECT * FROM data WHERE discount NOT BETWEEN 0 AND 1;

-- 7.Does every row have a valid Category and Region?
SELECT DISTINCT(Region)
FROM data;

SELECT DISTINCT(Category)
FROM data;


