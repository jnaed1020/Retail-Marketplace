# SQL Database and Queries - Retail Marketplace Project

## Overview
This folder contains the database and SQL query scripts for the Retail Marketplace project.

## Contents
- market_data.db: Main SQLite database.
- example_queries.sql: SQL queries for extracting and analyzing sales data.

## Database Structure
- Products table:
  - Fields: ProductID, ProductName, Category
- OrderDetails table:
  - Fields: OrderDetailID, OrderID, ProductID, Quantity

## How to Use
1. Open the market_data.db file with a SQLite database tool (e.g., DB Browser for SQLite).
2. Alternatively, connect programmatically using Python's sqlite3 module.

## Example Query
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

## Notes
- Always back up the database before making changes.
- Only run trusted SQL scripts.
