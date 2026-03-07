-- Revenue Contribution Analysis
-- Calculate each product's contribution to total revenue

WITH total_revenues AS (
SELECT 
    p.product_name,
    SUM(o.amount) AS total_revenue
FROM products p
JOIN orders o 
    ON p.product_id = o.product_id
GROUP BY p.product_name
)

SELECT 
    *,
    ROUND((total_revenue * 1.0 /
    SUM(total_revenue) OVER()) * 100, 2)
    AS revenue_contribution
FROM total_revenues;
