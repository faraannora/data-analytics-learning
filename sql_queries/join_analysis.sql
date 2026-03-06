-- SQL Join Analysis Example
-- Calculate total revenue per customer
SELECT c.customer_name,SUM(o.amount) AS total_revenue
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;
