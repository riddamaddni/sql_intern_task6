Task 6: SQL Subqueries and Nested Queries

Objective

The primary goal of this task is to master the use of SQL subqueries (also known as nested queries). This goes beyond simple SELECT statements and involves building complex, multi-step logic to answer sophisticated business questions.

The objective is to understand and implement subqueries in all their forms:

Filtering Data: Using subqueries in the WHERE clause to filter results based on dynamic conditions (e.g., finding all products that cost more than the average).

Creating Calculated Columns: Using "Scalar Subqueries" in the SELECT list to return a single value as a new column (e.g., showing an employee's sales next to their manager's total sales).

Simplifying Complex Logic: Using subqueries in the FROM clause to create "Derived Tables." This allows you to break a complex problem into simpler parts, such as performing an aggregation first and then joining that result to another table.

Database Schema

This project uses the 6-table "PharmaPlus" database from Task 5, which models a pharmaceutical sales distributor. The schema is designed to be highly interconnected, providing a realistic environment for complex queries.

The 6 tables are:

Manufacturers: A lookup table holding manufacturer names (e.g., 'MediGen', 'BioLife') and their country.

Products: The product catalog. This table is linked via a foreign key to the Manufacturers table.

SalesReps: The employee table, which includes a self-referencing manager_id foreign key. This parent-child link is perfect for practicing correlated subqueries and self-joins.

Customers: A list of all clients (pharmacies, hospitals) that place orders.

SalesOrders: The "header" table for transactions. It links Customers to SalesReps and records the date of each order.

OrderItems: The "detail" table for transactions. It links a specific SalesOrder to the Products being sold and includes the quantity and price, resolving the many-to-many relationship.

Files in this Repository

task_6_subqueries.sql

This is the main, self-contained SQL file. It includes the complete CREATE TABLE statements for the 6-table schema and all the INSERT statements to populate it with rich, varied sample data (including 'unsold' products and 'inactive' customers to test NOT IN and NOT EXISTS).

The file contains a comprehensive tutorial with over 30 query examples. These examples are fully commented to explain the logic and are grouped by concept:

WHERE Clause Subqueries: Demonstrates using =, IN, NOT IN, ANY, and ALL for filtering.

SELECT Clause (Scalar) Subqueries: Shows how to add individual calculated columns, such as finding the total order count for each customer.

FROM Clause (Derived Tables): Provides clear examples of how to create temporary tables for multi-step aggregations, such as finding the average sales after first calculating the total sales per rep.

Correlated Subqueries: Includes specific examples of these powerful but performance-intensive queries, which run once for every row of the outer query (e.g., "find all products more expensive than their own category's average price").

EXISTS and NOT EXISTS: Covers the efficient, boolean-based operators for checking the existence of related data.

interview_answers_task_6.md

This is a concise study guide providing clear, accurate answers to the 10 interview questions from the task sheet.

It covers the fundamental definitions (e.g., "What is a subquery?"), compares key concepts ("Difference between subquery and join?"), and explains technical details ("What is a correlated subquery?", "How does EXISTS work?"). This file is a key deliverable for preparing for technical interviews.
