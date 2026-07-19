-- 1.Rank products by profit within each category.

with product_profit AS(
SELECT category , `sub-category`  ,ROUND(SUM(profit),2) as net_profit
FROM data
GROUP BY category,`sub-category` ) 

SELECT category , `sub-category` AS products, net_profit,
RANK() OVER(PARTITION BY category ORDER BY net_profit DESC) AS profit_rank
FROM product_profit ; 


-- 2.Find the second-highest profitable state.

select state ,ROUND(SUM(profit),2) AS net_profit
from data
group by state 
order by net_profit desc
LIMIT 1 OFFSET 1 ;

-- 3.Find the top 3 products in each category.

with product_sales AS(
SELECT category , `sub-category`  ,ROUND(SUM(sales),2) as total_sales
FROM data
GROUP BY category,`sub-category` ) ,

sales_rank AS(
select category ,`sub-category` , total_sales,
dense_rank() over(partition by category order by total_sales desc) as rnk 
from product_sales) 

SELECT category ,`sub-category` AS products , total_sales,rnk
FROM sales_rank
where rnk<= 3;

-- 4.Find each region's contribution (%) to total sales.

SELECT region , ROUND((SUM(sales) *100 /(SELECT SUM(sales) FROM data )),2) AS 'sales %'
FROM data 
GROUP BY region;

-- 5.Find categories contributing more than 20% of total sales.

SELECT category , ROUND(SUM(sales),2) as total_sales , 
ROUND((SUM(sales) * 100 / (SELECT SUM(sales) FROM data) ),2) AS 'sales %'
FROM data
GROUP BY category 
HAVING total_sales > ( SELECT (SUM(sales) * 20 / 100 ) AS _20_percent_of_sales
FROM data ) 
ORDER BY total_sales DESC;


 

