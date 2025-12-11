create database project;

select * from customers;
select * from orders;
select * from products;

-- How many unique customers placed orders
SELECT COUNT(DISTINCT customer_id) AS total_unique_customers
FROM orders;


-- List the top 5 cities with the most customers.

SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC
LIMIT 5;

-- What is the total revenue generated

SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- Which product generated the highest revenue

SELECT p.product_name,
       SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 1;

-- Customer who spent the most money on orders

SELECT c.customer_id, c.customer_name,
       SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- Total revenue generated (again same as #3)

SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- Average Order Value (AOV)

SELECT SUM(o.quantity * p.price) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;


-- Number of orders placed per month

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Month with the highest total revenue

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month
ORDER BY revenue DESC
LIMIT 1;

-- Customer who placed the highest number of orders

SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC
LIMIT 1;

-- Product that generated the highest revenue

SELECT p.product_name,
       SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 1;

-- Top 3 best-selling products by quantity sold

SELECT p.product_name,
       SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

-- Product with the highest average selling price per unit

SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

-- Least sold product (based on total quantity sold)

SELECT p.product_name,
       COALESCE(SUM(o.quantity), 0) AS total_quantity
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity ASC
LIMIT 1;

-- Percentage of total revenue by each product

SELECT p.product_name,
       SUM(o.quantity * p.price) AS product_revenue,
       ROUND(
           (SUM(o.quantity * p.price) /
           (SELECT SUM(o2.quantity * p2.price)
            FROM orders o2
            JOIN products p2 ON o2.product_id = p2.product_id)) * 100,
       2) AS revenue_percentage
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue_percentage DESC;















