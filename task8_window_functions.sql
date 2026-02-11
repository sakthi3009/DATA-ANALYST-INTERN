
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC;

SELECT
    region,
    customer_name,
    SUM(sales) AS total_sales,
    ROW_NUMBER() OVER (
        PARTITION BY region
        ORDER BY SUM(sales) DESC
    ) AS row_num_rank
FROM superstore
GROUP BY region, customer_name;


SELECT
    region,
    customer_name,
    SUM(sales) AS total_sales,
    RANK() OVER (
        PARTITION BY region
        ORDER BY SUM(sales) DESC
    ) AS rank_val,
    DENSE_RANK() OVER (
        PARTITION BY region
        ORDER BY SUM(sales) DESC
    ) AS dense_rank_val
FROM superstore
GROUP BY region, customer_name;


-
SELECT
    order_date,
    SUM(sales) AS daily_sales,
    SUM(SUM(sales)) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM superstore
GROUP BY order_date
ORDER BY order_date;



WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY month
)
SELECT
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS previous_month_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY month) AS mom_growth
FROM monthly_sales
ORDER BY month;


WITH product_sales AS (
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY category, product_name
),
ranked_products AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS rank_no
    FROM product_sales
)
SELECT *
FROM ranked_products
WHERE rank_no <= 3
ORDER BY category, rank_no;

-
