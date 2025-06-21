-- View: Summary of customer sales
CREATE OR REPLACE VIEW customer_sales_summary AS
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(s.sale_id) AS total_transactions,
    SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- View: Monthly product sales
CREATE OR REPLACE VIEW product_monthly_sales AS
SELECT 
    p.product_name,
    TO_CHAR(s.sale_date, 'YYYY-MM') AS sale_month,
    SUM(s.quantity) AS total_units_sold,
    SUM(s.total_amount) AS revenue
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_name, TO_CHAR(s.sale_date, 'YYYY-MM');

-- Procedure: Get customer purchase total
CREATE OR REPLACE PROCEDURE get_customer_total (
    p_customer_id IN NUMBER,
    p_total OUT NUMBER
)
IS
BEGIN
    SELECT SUM(total_amount)
    INTO p_total
    FROM sales
    WHERE customer_id = p_customer_id;
END;
/
