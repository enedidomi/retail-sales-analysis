-- Retail Sales SQL Analysis
-- Step 1: Basic Exploration

-- 1. Preview first 5 rows
SELECT *
FROM mydata
LIMIT 5;

-- 2. Inspect table structure
PRAGMA table_info(mydata);

-- 3. Total number of rows
SELECT COUNT(*) AS total_rows
FROM mydata;

-- 4. Dataset date range
SELECT MIN(order_date) AS first_order_date,
       MAX(order_date) AS last_order_date
FROM mydata;

-- 5. Number of unique orders
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM mydata;

-- 6. Number of unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM mydata;

-- 7. Number of unique products
SELECT COUNT(DISTINCT product_code) AS unique_products
FROM mydata;

-- 8. Number of unique countries
SELECT COUNT(DISTINCT country) AS unique_countries
FROM mydata;

-- 9. List of all unique countries
SELECT DISTINCT country
FROM mydata
ORDER BY country;

-- 10. Highest and lowest revenue transaction
SELECT MAX(revenue) AS highest_sale,
       MIN(revenue) AS lowest_sale
FROM mydata;





