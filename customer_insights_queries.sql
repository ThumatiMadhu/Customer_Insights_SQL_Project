-- 1. Top 5 cities by total sales
SELECT city, SUM(total_amount) AS total_sales
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY city
ORDER BY total_sales DESC
FETCH FIRST 5 ROWS ONLY;

-- 2. Monthly sales trend
SELECT TO_CHAR(sale_date, 'YYYY-MM') AS month, SUM(total_amount) AS monthly_sales
FROM sales
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY month;

-- 3. Top 5 customers by total purchase
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS customer_name, 
       SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
FETCH FIRST 5 ROWS ONLY;

-- 4. Product category-wise revenue
SELECT p.category, SUM(s.total_amount) AS category_sales
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY category_sales DESC;
