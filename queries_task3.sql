-- ============================================
-- Task 3: SQL Basics – Filtering + Sorting + Aggregations
-- Dataset: Superstore Sales
-- ============================================

SELECT * FROM sales LIMIT 10;

SELECT COUNT(*) AS total_records FROM sales;

SELECT * FROM sales
WHERE category = 'Technology';

SELECT product_name, sales
FROM sales
ORDER BY sales DESC
LIMIT 10;

SELECT category, SUM(sales) AS total_sales
FROM sales
GROUP BY category;

SELECT region, AVG(profit) AS avg_profit
FROM sales
GROUP BY region;

SELECT region, COUNT(*) AS orders_count
FROM sales
GROUP BY region;

SELECT category, SUM(sales) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(sales) > 100000;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(sales) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;

SELECT *
FROM sales
WHERE customer_name LIKE 'A%';

SELECT *
FROM sales
WHERE order_date BETWEEN '2020-01-01' AND '2020-03-31';
