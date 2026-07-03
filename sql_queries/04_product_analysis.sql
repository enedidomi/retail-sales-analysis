-- Retail Sales SQL Analysis
-- Step 4: Product Analysis

-- 1. Top 10 Products by Revenue
SELECT
    product_code,
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM mydata
GROUP BY product_code, product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 2. Top 10 Products by Quantity Sold
SELECT
    product_code,
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM mydata
GROUP BY product_code, product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;


-- 3. Bottom 10 Products by Revenue
SELECT
    product_code,
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM mydata
GROUP BY product_code, product_name
ORDER BY total_revenue ASC
LIMIT 10;


-- 4. Bottom 10 Products by Quantity Sold
SELECT
    product_code,
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM mydata
GROUP BY product_code, product_name
ORDER BY total_quantity_sold ASC
LIMIT 10;


-- 5. Product Revenue Contribution
SELECT
    product_code,
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM mydata), 2) AS revenue_share_pct
FROM mydata
GROUP BY product_code, product_name
ORDER BY revenue_share_pct DESC
LIMIT 20;


-- 6. Average Price per Product
SELECT
    product_code,
    product_name,
    ROUND(AVG(unit_price), 2) AS avg_unit_price
FROM mydata
GROUP BY product_code, product_name
ORDER BY avg_unit_price DESC;


-- 7. Number of Orders per Product
SELECT
    product_code,
    product_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM mydata
GROUP BY product_code, product_name
ORDER BY total_orders DESC;


-- 8. Product Sales Summary
SELECT
    product_code,
    product_name,
    ROUND(SUM(revenue), 2) AS total_revenue,
    SUM(quantity) AS total_quantity_sold,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(unit_price), 2) AS avg_unit_price
FROM mydata
GROUP BY product_code, product_name
ORDER BY total_revenue DESC;

