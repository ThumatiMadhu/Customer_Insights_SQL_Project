-- Customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    gender VARCHAR2(10),
    city VARCHAR2(50),
    country VARCHAR2(50),
    signup_date DATE
);

-- Products table
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10, 2)
);

-- Sales table
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    product_id NUMBER REFERENCES products(product_id),
    sale_date DATE,
    quantity NUMBER,
    total_amount NUMBER(10, 2)
);
