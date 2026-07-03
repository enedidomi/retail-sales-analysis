-- Retail Sales SQL Analysis
-- Step 2: KPI Analysis


-- 1. Total Revenue
SELECT ROUND(SUM(revenue), 2) AS total_revenue
FROM mydata;

-- 2. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM mydata;

-- 3. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM mydata;

-- 4. Total Units Sold
SELECT SUM(quantity) AS total_units_sold
FROM mydata;

-- 5. Average Order Value (AOV)
SELECT ROUND(
       SUM(revenue)/
       COUNT(DISTINCT order_id),
       2
       ) AS avg_order_value
FROM mydata;

-- 6. Average Revenue per Customer
SELECT ROUND(
       SUM(revenue) /
       COUNT(DISTINCT customer_id),
       2
       ) AS avg_customer_revenue
FROM mydata;

-- 7. Average Quantity per Order
SELECT ROUND(
       SUM(quantity) * 1.0 /
       COUNT(DISTINCT order_id),
       2
       ) AS avg_order_quantity
FROM mydata;

-- 8. Average Products per Order
SELECT ROUND(
       COUNT(product_code) * 1.0 /
       COUNT(DISTINCT order_id),
       2
       ) AS avg_products_per_order
FROM mydata;

-- 9. Average Order Line Value
SELECT ROUND(AVG(revenue), 2) AS avg_revenue_value
FROM mydata;

-- 10. Countries Ranked by Revenue
SELECT country,
       ROUND(SUM(revenue), 2) AS total_revenue
FROM mydata
GROUP BY country
ORDER BY total_revenue DESC;

-- 11. Revenue Contribution (%)
SELECT country,
	   ROUND(SUM(revenue), 2) AS total_revenue,
	   ROUND(SUM(revenue) * 100.0 /
	   (SELECT SUM(revenue) FROM mydata), 2) AS  revenue_share_pct
FROM mydata
GROUP BY country
ORDER BY  revenue_share_pct DESC;




