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

## Example Query

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
