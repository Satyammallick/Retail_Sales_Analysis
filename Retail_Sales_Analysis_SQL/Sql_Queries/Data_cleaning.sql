-- changing the datatype 
ALTER TABLE data 
MODIFY COLUMN `Postal Code` VARCHAR(10);

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

-- 3. Checks for illegal negative sales/quantities or out-of-range discounts (0 to 1)
SELECT 
    SUM(CASE WHEN Sales < 0 THEN 1 ELSE 0 END) AS negative_sales_count,
    SUM(CASE WHEN Quantity < 0 THEN 1 ELSE 0 END) AS negative_quantity_count,
    SUM(CASE WHEN Discount NOT BETWEEN 0 AND 1 THEN 1 ELSE 0 END) AS invalid_discount_count,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) AS negative_profit_rows
FROM data;

-- 4.DISTINCT CATEGORICAL 
SELECT 
    COUNT(DISTINCT Region) AS total_regions,
    COUNT(DISTINCT Category) AS total_categories,
    COUNT(DISTINCT `Sub-Category`) AS total_sub_categories
FROM data;

-- -- 5. REMOVE DUPLICATE ROWS FROM THE DATASET
-- Step 1: Create a deduplicated temporary table
CREATE TABLE data_temp AS 
SELECT DISTINCT * 
FROM data;

-- Step 2: Empty the original table
TRUNCATE TABLE data;

-- Step 3: Insert unique rows back into 'data'
INSERT INTO data 
SELECT * FROM data_temp;

-- Step 4: Drop the temporary table
DROP TABLE data_temp;

-- Step 5: Verify clean row count (Should return 9,977)
SELECT COUNT(*) AS total_rows 
FROM data;


 