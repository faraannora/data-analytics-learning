# SQL Data Analytics Learning

This repository contains my SQL learning journey while transitioning into Data Analytics.

## Topics Covered

- SQL Joins
- Subqueries
- Common Table Expressions (CTE)
- Window Functions
- Analytical SQL queries

## Project Structure

datasets/  
Data used for SQL practice.

sql_queries/  
SQL queries for data analysis exercises.

notes/  
Learning notes and SQL concepts.

## Example 1 JOIN

```sql
SELECT 
    c.customer_name,
    SUM(o.amount) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;
```
## Example 2

### Revenue Contribution

```sql
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
```
