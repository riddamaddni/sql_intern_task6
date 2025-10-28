-- create database pharmaplus;
use pharmaplus;

-- CREATE TABLE Manufacturers (
--     manufacturer_id INT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     country VARCHAR(50)
-- );


-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     category VARCHAR(50),
--     price DECIMAL(10, 2) NOT NULL,
--     manufacturer_id INT,
--     FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers(manufacturer_id)
-- );


-- CREATE TABLE SalesReps (
--     rep_id INT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     region VARCHAR(50),
--     manager_id INT,
--     FOREIGN KEY (manager_id) REFERENCES SalesReps(rep_id) -- Self-referencing key
-- );


-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     city VARCHAR(50),
--     state VARCHAR(2)
-- );

-- CREATE TABLE SalesOrders (
--     order_id INT PRIMARY KEY,
--     order_date DATE NOT NULL,
--     customer_id INT,
--     rep_id INT,
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
--     FOREIGN KEY (rep_id) REFERENCES SalesReps(rep_id)
-- );


-- CREATE TABLE OrderItems (
--     order_item_id INT PRIMARY KEY,
--     order_id INT,
--     product_id INT,
--     quantity INT NOT NULL,
--     item_price DECIMAL(10, 2) NOT NULL, -- Price at the time of sale
--     FOREIGN KEY (order_id) REFERENCES SalesOrders(order_id),
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
-- );


-- INSERT INTO Manufacturers (manufacturer_id, name, country) VALUES
-- (1, 'MediGen', 'USA'),
-- (2, 'BioLife', 'Germany'),
-- (3, 'PharmaCore', 'USA'),
-- (4, 'HealthWave', 'Japan');

-- INSERT INTO Products (product_id, name, category, price, manufacturer_id) VALUES
-- (101, 'Paracetamol 500mg', 'Pain Relief', 5.00, 1),
-- (102, 'Amoxicillin 250mg', 'Antibiotic', 12.50, 2),
-- (103, 'Vitamin C 1000mg', 'Supplement', 8.00, 3),
-- (104, 'Ibuprofen 200mg', 'Pain Relief', 4.50, 1),
-- (105, 'Omeprazole 20mg', 'Acid Reflux', 15.00, 2),
-- (106, 'Metformin 500mg', 'Diabetes', 10.00, 3),
-- (107, 'Atorvastatin 10mg', 'Cholesterol', 20.00, 4),
-- (108, 'Losartan 50mg', 'Blood Pressure', 18.00, 4),
-- (109, 'Salbutamol Inhaler', 'Asthma', 25.00, 1),
-- (110, 'Sertraline 50mg', 'Antidepressant', 30.00, 2),
-- (111, 'Product XYZ (Unsold)', 'Test', 99.99, 3);


-- INSERT INTO SalesReps (rep_id, name, region, manager_id) VALUES
-- (501, 'Sarah Chen', 'North', NULL), -- Top-level manager
-- (502, 'Mark Johnson', 'South', 501),
-- (503, 'David Lee', 'East', 501),
-- (504, 'Emily White', 'West', 501),
-- (505, 'Tom Baker', 'South', 502),
-- (506, 'Jane Doe', 'East', 503),
-- (507, 'Alex Reed', 'North', 501),
-- (508, 'NoSales Rep', 'West', 504);

-- INSERT INTO Customers (customer_id, name, city, state) VALUES
-- (1001, 'City Pharmacy', 'New York', 'NY'),
-- (1002, 'General Hospital', 'Los Angeles', 'CA'),
-- (1003, 'Community Clinic', 'Chicago', 'IL'),
-- (1004, 'Suburban Drugs', 'New York', 'NY'),
-- (1005, 'Metro Health', 'Los Angeles', 'CA'),
-- (1006, 'FutureCare', 'Boston', 'MA');


-- INSERT INTO SalesOrders (order_id, order_date, customer_id, rep_id) VALUES
-- (1, '2023-10-01', 1001, 502),
-- (2, '2023-10-05', 1002, 503),
-- (3, '2023-10-10', 1001, 502),
-- (4, '2023-10-12', 1003, 504),
-- (5, '2023-10-15', 1004, 505),
-- (6, '2023-10-20', 1005, 506),
-- (7, '2023-10-22', 1002, 503),
-- (8, '2023-10-25', 1003, 504);

-- INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, item_price) VALUES
-- (101, 1, 101, 50, 5.00),
-- (102, 1, 104, 30, 4.50),
-- (103, 2, 102, 20, 12.50),
-- (104, 2, 109, 10, 25.00),
-- (105, 3, 103, 100, 8.00),
-- (106, 4, 105, 15, 15.00),
-- (107, 4, 106, 25, 10.00),
-- (108, 5, 101, 40, 5.00),
-- (109, 5, 103, 50, 8.00),
-- (110, 6, 107, 10, 20.00),
-- (111, 6, 108, 10, 18.00),
-- (112, 7, 102, 30, 12.50),
-- (113, 8, 105, 20, 15.00),
-- (114, 8, 110, 5, 30.00);


-- QUERIES

-- SELECT name, category, price
-- FROM Products
-- WHERE manufacturer_id = (SELECT manufacturer_id
--                          FROM Manufacturers
--                          WHERE name = 'MediGen');

-- SELECT product_id, name, category
-- FROM Products
-- WHERE product_id IN (SELECT DISTINCT product_id
--                      FROM OrderItems);

-- SELECT product_id, name, category
-- FROM Products
-- WHERE product_id NOT IN (SELECT DISTINCT product_id
--                          FROM OrderItems);

-- SELECT name, price
-- FROM Products
-- WHERE price > (SELECT AVG(price) FROM Products);

-- SELECT name, category, price
-- FROM Products
-- WHERE price < (SELECT MIN(price)
--                FROM Products
--                WHERE category = 'Antibiotic');


-- SELECT name
-- FROM Customers
-- WHERE city = 'New York'
--   AND customer_id IN (SELECT DISTINCT customer_id FROM SalesOrders);

-- SELECT DISTINCT c.name
-- FROM Customers c
-- JOIN SalesOrders s ON c.customer_id = s.customer_id
-- WHERE c.city = 'New York';


-- SELECT c.name, c.city
-- FROM Customers c
-- WHERE EXISTS (SELECT 1
--               FROM SalesOrders s
--               WHERE s.customer_id = c.customer_id);

-- SELECT c.name, c.city
-- FROM Customers c
-- WHERE NOT EXISTS (SELECT 1
--                   FROM SalesOrders s
--                   WHERE s.customer_id = c.customer_id);

-- SELECT r.name, r.region
-- FROM SalesReps r
-- WHERE NOT EXISTS (SELECT 1
--                   FROM SalesOrders s
--                   WHERE s.rep_id = r.rep_id);

-- SELECT p1.name, p1.category, p1.price
-- FROM Products p1
-- WHERE p1.price > (SELECT AVG(p2.price)
--                   FROM Products p2
--                   WHERE p2.category = p1.category);

-- SELECT name, price
-- FROM Products
-- WHERE price >= ALL (SELECT price FROM Products);

-- SELECT name
-- FROM Products
-- WHERE manufacturer_id = 1
--   AND product_id = ANY (SELECT product_id
--                         FROM OrderItems
--                         WHERE quantity > 40);


-- SELECT name
-- FROM Customers
-- WHERE customer_id IN (SELECT customer_id
--                       FROM SalesOrders
--                       WHERE order_id IN (SELECT order_id
--                                          FROM OrderItems
--                                          WHERE product_id IN (SELECT product_id
--                                                               FROM Products
--                                                               WHERE category = 'Pain Relief')))
--   AND city = 'New York';


-- SELECT
--     name,
--     price,
--     (SELECT AVG(price) FROM Products) AS overall_average_price
-- FROM Products;

-- SELECT
--     c.name,
--     (SELECT COUNT(s.order_id)
--      FROM SalesOrders s
--      WHERE s.customer_id = c.customer_id) AS total_orders
-- FROM Customers c;


-- SELECT
--     p.name,
--     (SELECT SUM(oi.quantity)
--      FROM OrderItems oi
--      WHERE oi.product_id = p.product_id) AS total_quantity_sold
-- FROM Products p;

-- SELECT
--     p.name,
--     COALESCE( (SELECT SUM(oi.quantity)
--                FROM OrderItems oi
--                WHERE oi.product_id = p.product_id), 0) AS total_quantity_sold
-- FROM Products p
-- ORDER BY total_quantity_sold DESC;


-- SELECT
--     r1.name AS rep_name,
--     (SELECT r2.name
--      FROM SalesReps r2
--      WHERE r2.rep_id = r1.manager_id) AS manager_name
-- FROM SalesReps r1;

-- SELECT
--     p.name,
--     (SELECT m.name
--      FROM Manufacturers m
--      WHERE m.manufacturer_id = p.manufacturer_id) AS manufacturer,
--     COALESCE( (SELECT SUM(oi.quantity)
--                FROM OrderItems oi
--                WHERE oi.product_id = p.product_id), 0) AS total_quantity_sold
-- FROM Products p;


-- SELECT
--     name,
--     price,
--     price - (SELECT AVG(price) FROM Products) AS price_difference
-- FROM Products;

-- SELECT
--     dt.order_id,
--     dt.total_value
-- FROM
--     (SELECT
--          order_id,
--          SUM(quantity * item_price) AS total_value
--      FROM OrderItems
--      GROUP BY order_id) AS dt;



-- SELECT
--     c.name AS customer_name,
--     dt.total_value
-- FROM
--     (SELECT
--          order_id,
--          SUM(quantity * item_price) AS total_value
--      FROM OrderItems
--      GROUP BY order_id) AS dt
-- JOIN SalesOrders s ON dt.order_id = s.order_id
-- JOIN Customers c ON s.customer_id = c.customer_id
-- ORDER BY dt.total_value DESC;


-- SELECT
--     AVG(dt.total_quantity) AS average_product_sales_volume
-- FROM
--     (SELECT
--          product_id,
--          SUM(quantity) AS total_quantity
--      FROM OrderItems
--      GROUP BY product_id) AS dt;

-- SELECT
--     r.name,
--     rs.total_sales_value
-- FROM SalesReps r
-- JOIN
--     (SELECT
--          s.rep_id,
--          SUM(oi.quantity * oi.item_price) AS total_sales_value
--      FROM SalesOrders s
--      JOIN OrderItems oi ON s.order_id = oi.order_id
--      GROUP BY s.rep_id) AS rs
-- ON r.rep_id = rs.rep_id
-- WHERE r.region = 'South';


-- SELECT
--     c.name,
--     ot.total_value
-- FROM
--     (SELECT
--          order_id,
--          SUM(quantity * item_price) AS total_value
--      FROM OrderItems
--      GROUP BY order_id) AS ot
-- JOIN SalesOrders s ON ot.order_id = s.order_id
-- JOIN Customers c ON s.customer_id = c.customer_id
-- WHERE ot.total_value = (SELECT MAX(total_value)
--                         FROM (SELECT SUM(quantity * item_price) AS total_value
--                               FROM OrderItems
--                               GROUP BY order_id) AS max_ot);


-- SELECT
--     c.name,
--     SUM(oi.quantity * oi.item_price) AS customer_total_spending
-- FROM Customers c
-- JOIN SalesOrders s ON c.customer_id = s.customer_id
-- JOIN OrderItems oi ON s.order_id = oi.order_id
-- GROUP BY c.customer_id, c.name
-- HAVING SUM(oi.quantity * oi.item_price) > (
--     -- Subquery: Calculate the average value of a single order
--     SELECT AVG(order_total)
--     FROM (
--         SELECT SUM(quantity * item_price) AS order_total
--         FROM OrderItems
--         GROUP BY order_id
--     ) AS order_values
-- );


-- SELECT
--     c.name,
--     cs.total_spent
-- FROM
--     (SELECT
--          s.customer_id,
--          SUM(oi.quantity * oi.item_price) AS total_spent
--      FROM SalesOrders s
--      JOIN OrderItems oi ON s.order_id = oi.order_id
--      GROUP BY s.customer_id) AS cs
-- JOIN Customers c ON cs.customer_id = c.customer_id
-- ORDER BY cs.total_spent DESC
-- LIMIT 3;

-- SELECT
--     r.name,
--     mc.report_count
-- FROM
--     (SELECT
--          manager_id,
--          COUNT(*) AS report_count
--      FROM SalesReps
--      WHERE manager_id IS NOT NULL
--      GROUP BY manager_id) AS mc
-- JOIN SalesReps r ON r.rep_id = mc.manager_id
-- WHERE mc.report_count >= 2;

-- WITH RepSales AS (
--     SELECT
--         s.rep_id,
--         SUM(oi.quantity * oi.item_price) AS total_sales
--     FROM SalesOrders s
--     JOIN OrderItems oi ON s.order_id = oi.order_id
--     GROUP BY s.rep_id
-- )
-- SELECT
--     r.region,
--     SUM(rs.total_sales) AS region_total
-- FROM SalesReps r
-- JOIN RepSales rs ON r.rep_id = rs.rep_id
-- GROUP BY r.region;

