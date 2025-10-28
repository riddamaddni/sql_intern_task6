Task 6: SQL Subqueries and Nested Queries

Objective

The primary goal of this task is to master the use of SQL subqueries (also known as nested queries). This goes beyond simple SELECT statements and involves building complex, multi-step logic to answer sophisticated business questions that a simple join cannot.

The core learning objectives are:

Advanced Filtering: Using subqueries in the WHERE and HAVING clauses to filter data based on dynamic, calculated conditions (e.g., finding all products that cost more than the average, or finding reps who sold more than the average).

In-Line Calculations: Using "Scalar Subqueries" in the SELECT list to return a single, calculated value as a new column (e.g., showing a customer's name next to their total order count).

Simplifying Complex Logic: Using subqueries in the FROM clause to create "Derived Tables." This is a critical skill for breaking a complex problem into simpler, manageable parts, such as performing an aggregation first and then joining that result to another table.

Implementing Row-by-Row Logic: Writing "Correlated Subqueries" where the inner query depends on and runs once for each row of the outer query.

Database Schema: "PharmaPlus"

This project uses the 6-table "PharmaPlus" database from Task 5, which models a pharmaceutical sales distributor. The schema is designed to be highly interconnected, providing a realistic environment for complex queries. The inclusion of unsold products, inactive customers, and a self-referencing employee table is specifically designed to test all forms of subqueries (NOT IN, NOT EXISTS, correlated queries).

The 6 tables and their relationships are:

Manufacturers: A top-level lookup table holding manufacturer names (e.g., 'MediGen', 'BioLife') and their country.

Products: The main product catalog. This table has a many-to-one foreign key relationship with Manufacturers (manufacturer_id).

SalesReps: The employee table. This table features a self-referencing foreign key (manager_id -> rep_id), which is perfect for practicing correlated subqueries (e.g., finding a rep's manager's name).

Customers: A list of all clients (pharmacies, hospitals) that place orders.

SalesOrders: The "header" table for transactions. It links Customers (via customer_id) and SalesReps (via rep_id) to record the date of each order.

OrderItems: The "detail" table for transactions. It resolves the many-to-many relationship between SalesOrders and Products. Each row links an order (order_id) to a product (product_id) and records the quantity and price.

Files in this Repository

task_6_subqueries.sql

This is the main, self-contained SQL file. It includes the complete CREATE TABLE statements for the 6-table schema and all the INSERT statements to populate it with rich, varied sample data.

The file is structured as a comprehensive tutorial with over 30 query examples. These examples are fully commented to explain the logic and are grouped by concept:

Part A: WHERE Clause Subqueries: Demonstrates using =, IN, NOT IN, ANY, and ALL for basic and multi-row filtering.

Part B: SELECT Clause (Scalar) Subqueries: Shows how to add individual calculated columns, such as finding the total order count for each customer.

Part C: FROM Clause (Derived Tables): Provides clear examples of how to create temporary tables for multi-step aggregations (e.g., finding the average sales after first calculating the total sales per rep).

Part D: HAVING Clause Subqueries: Covers how to filter aggregate groups based on a subquery.

Part E: EXISTS and NOT EXISTS: Covers the efficient, boolean-based operators for checking the existence of related data.

Part F: Correlated Subqueries: Includes specific examples of these powerful but performance-intensive queries (e.g., "find all products more expensive than their own category's average price").

interview_answers_task_6.md

This is a concise study guide providing clear, accurate answers to the 10 interview questions from the task sheet.

It covers the fundamental definitions (e.g., "What is a subquery?"), compares key concepts ("Difference between subquery and join?"), and explains technical details ("What is a correlated subquery?", "How is performance affected?"). This file is a key deliverable for preparing for technical interviews.
