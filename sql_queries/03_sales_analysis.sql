-- Retail Sales SQL Analysis
-- Step 3: Sales Analysis


-- 1. Revenue by Year
SELECT 
	year,
	ROUND(SUM(revenue), 2) AS total_revenue
FROM mydata
GROUP BY year
ORDER BY year;

-- 2. Revenue by Month
SELECT
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM mydata
GROUP BY year, month
ORDER BY year, month;

-- 3. Orders by Month
SELECT
    year,
    month,
    COUNT(DISTINCT order_id) AS monthly_orders
FROM mydata
GROUP BY year, month
ORDER BY year, month;

-- 4. Average Order Value by Month
SELECT
    year,
    month,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS monthly_aov
FROM mydata
GROUP BY year, month
ORDER BY year, month;

-- 5. Monthly Sales Summary
SELECT
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS monthly_orders,
    SUM(quantity) AS monthly_units_sold,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS monthly_aov
FROM mydata
GROUP BY year, month
ORDER BY year, month;

-- 6. Best Sales Month
SELECT
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM mydata
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 1;

-- 7. Worst Sales Month
SELECT
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM mydata
GROUP BY year, month
ORDER BY monthly_revenue ASC
LIMIT 1;

-- 8. Monthly Revenue Share of Total Revenue
SELECT
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM mydata), 2) AS revenue_share_pct
FROM mydata
GROUP BY year, month
ORDER BY year, month;

-- 9. Monthly Revenue Ranking
SELECT
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM mydata
GROUP BY year, month
ORDER BY monthly_revenue DESC;

-- 10. Revenue by Country and Month
SELECT
    country,
    year,
    month,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM mydata
GROUP BY country, year, month
ORDER BY country, year, month;

