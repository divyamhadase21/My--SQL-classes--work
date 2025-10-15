-- create the database  
create  database  Adb;
-- use database  
use  Adb ;

-- Create tables  

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50),
    occupation VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    supplier_id INT,
    category_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(200),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary DECIMAL(10, 2),
    age INT,
    job_title VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    rating INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- DAY 1

-- Q1: Write a query to find the top 5 customers with the highest total order amount.
SELECT
    c.customer_name,
    SUM(o.order_amount) AS total_order_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_amount DESC
LIMIT 5;

-- Q2: Retrieve the names of customers who have placed orders in the past 30 days.
SELECT DISTINCT
    c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Q3: Find the products that have been ordered at least three times.
SELECT
    p.product_name
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(oi.product_id) >= 3;

-- Q4: Retrieve the order details for orders placed by customers from a specific city.
SELECT
    o.order_id,
    c.customer_name,
    c.city,
    oi.product_id,
    oi.quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE c.city = 'SPECIFIC_CITY';

-- Q5: Write a query to find the customers who have placed orders for products with a price greater than $100.
SELECT DISTINCT
    c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.price > 100.00;

-- Q6: Get the average order amount for each customer.
SELECT
    c.customer_name,
    AVG(o.order_amount) AS average_order_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Q7: Find the products that have never been ordered.
SELECT
    p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- Q8: Retrieve the names of customers who have placed orders on weekends (Saturday or Sunday).
SELECT DISTINCT
    c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE DAYOFWEEK(o.order_date) IN (1, 7);

-- Q9: Get the total order amount for each month.
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(order_amount) AS total_sales
FROM Orders
GROUP BY order_month
ORDER BY order_month;

-- Q10: Write a query to find the customers who have placed orders for more than two different products.
SELECT
    c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT oi.product_id) > 2;


-- DAY 2

-- Q1: Retrieve the order details along with the customer name and product name for each order.
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- Q2: Find the products and their corresponding suppliers' names.
SELECT
    p.product_name,
    s.supplier_name
FROM Products p
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- Q3: Get a list of customers who have never placed an order.
SELECT
    c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q4: Retrieve the names of customers along with the total quantity of products they ordered.
SELECT
    c.customer_name,
    SUM(oi.quantity) AS total_quantity_ordered
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Q5: Find the products that have been ordered by customers from a specific country.
SELECT DISTINCT
    p.product_name
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.country = 'SPECIFIC_COUNTRY';

-- Q6: Get the total order amount for each customer, including those who have not placed any orders.
SELECT
    c.customer_name,
    COALESCE(SUM(o.order_amount), 0.00) AS total_order_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Q7: Retrieve the order details for orders placed by customers with a specific occupation.
SELECT
    o.order_id,
    c.customer_name,
    c.occupation,
    oi.product_id,
    oi.quantity
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE c.occupation = 'SPECIFIC_OCCUPATION';

-- Q8: Find the customers who have placed orders for products with a price higher than the average price of all products.
SELECT DISTINCT
    c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.price > (SELECT AVG(price) FROM Products);

-- Q9: Retrieve the names of customers along with the total number of orders they have placed.
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Q10: Get a list of products and the total quantity ordered for each product.
SELECT
    p.product_name,
    COALESCE(SUM(oi.quantity), 0) AS total_quantity_ordered
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_ordered DESC;


-- DAY 3

-- Q1: Retrieve all customers with names starting with 'A' and ending with 'n'.
SELECT
    customer_name
FROM Customers
WHERE customer_name LIKE 'A%n';

-- Q2: Find the products with names containing at least one digit.
SELECT
    product_name
FROM Products
WHERE product_name REGEXP '[0-9]';

-- Q3: Get the list of employees sorted by their salary in ascending order. NULL values should appear at the end.
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY
    CASE WHEN salary IS NULL THEN 1 ELSE 0 END,
    salary ASC;

-- Q4: Retrieve the customers whose names contain exactly five characters.
SELECT
    customer_name
FROM Customers
WHERE customer_name LIKE '_____';

-- Q5: Find the products with names starting with 'S' and ending with 'e'.
SELECT
    product_name
FROM Products
WHERE product_name LIKE 'S%e';

-- Q6: Get the list of employees sorted by their last name and then by their first name.
SELECT
    first_name,
    last_name
FROM Employees
ORDER BY
    last_name ASC,
    first_name ASC;

-- Q7: Retrieve the orders placed on a specific date and sort them by the customer name in alphabetical order.
SELECT
    o.order_id,
    c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_date = 'YYYY-MM-DD'
ORDER BY c.customer_name ASC;

-- Q8: Find the products with names containing exactly three letters.
SELECT
    product_name
FROM Products
WHERE product_name LIKE '___';

-- Q9: Get the list of employees sorted by their salary in descending order. NULL values should appear at the beginning.
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY
    CASE WHEN salary IS NULL THEN 0 ELSE 1 END,
    salary DESC;

-- Q10: Retrieve the customers whose names contain a space character.
SELECT
    customer_name
FROM Customers
WHERE customer_name LIKE '% %';


-- DAY 4

-- Q1: Calculate the total quantity and total amount for each order.
SELECT
    oi.order_id,
    SUM(oi.quantity) AS total_quantity,
    o.order_amount
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY oi.order_id, o.order_amount;

-- Q2: Find the average age and the number of employees for each job title.
SELECT
    job_title,
    AVG(age) AS average_age,
    COUNT(employee_id) AS number_of_employees
FROM Employees
GROUP BY job_title;

-- Q3: Get the total number of products in each category.
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;

-- Q4: Calculate the average rating and the number of reviews for each product.
SELECT
    p.product_name,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS number_of_reviews
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_name;

-- Q5: Find the customers with the highest and lowest total order amounts.
(
    SELECT c.customer_name, SUM(o.order_amount) AS total_amount
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
    ORDER BY total_amount DESC
    LIMIT 1
)
UNION ALL
(
    SELECT c.customer_name, SUM(o.order_amount) AS total_amount
    FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
    ORDER BY total_amount ASC
    LIMIT 1
);

-- Q6: Get the maximum and minimum ages for each department.
SELECT
    department,
    MAX(age) AS max_age,
    MIN(age) AS min_age
FROM Employees
GROUP BY department;

-- Q7: Calculate the total sales amount and the number of orders for each month.
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(order_amount) AS total_sales_amount,
    COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY sales_month
ORDER BY sales_month;

-- Q8: Find the average price and the number of products for each supplier.
SELECT
    s.supplier_name,
    AVG(p.price) AS average_price,
    COUNT(p.product_id) AS number_of_products
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name;

-- Q9: Get the maximum and minimum prices for each product category.
SELECT
    c.category_name,
    MAX(p.price) AS max_price,
    MIN(p.price) AS min_price
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_name;

-- Q10: Calculate the average rating and the number of reviews for each product category.
SELECT
    c.category_name,
    AVG(r.rating) AS average_category_rating,
    COUNT(r.review_id) AS total_reviews
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY c.category_name;
