-- A. Basic SELECT Statement

-- 1. Select the database.
USE fruits_db;

-- 2. Inspect the columns and data types from a table.
DESCRIBE fruits;

-- 3. Another way to Inspect the columns and data types from a table.
SHOW COLUMNS
FROM fruits;

-- 4. Return all of the rows and columns from a table.
SELECT *
FROM fruits;

-- 5. Select specific column(s) and all of the rows from those column(s).
SELECT name
FROM fruits;

SELECT name, quantity
FROM fruits;

-- B. SELECT DISTINCT Statement

-- 1. Use chiplotle database to demo a db with duplicates.
USE chipotle;

-- 2. Inspect the columns and data types from a table.
DESCRIBE orders;

-- 3. Return all of the rows and columns from a table. (4622 records)
SELECT *
FROM orders;

/* 
4. Select specific column(s) and all of the rows from those column(s). 
(4622 records)
*/
SELECT item_name
FROM orders;

SELECT item_name, item_price
FROM orders;

/*
5. Return only the unique values from a column using the DISTINCT keyword 
(50 records returned)
*/
SELECT DISTINCT item_name
FROM orders;

-- C. Filter Return Sets Using WHERE

/*
1. Filter so that only records with the value 'Chicken Bowl' in item_name are returned.
(726 records returned)
*/

SELECT *
FROM orders
WHERE item_name = 'Chicken Bowl';

-- 2. Filter by item_price. Why doesn't the QUERY below run? 

SELECT *
FROM orders
WHERE item_price = $4.45;

/*
3. Filter using the primary key column; only one record will be returned because the value must be unique.
*/
SELECT *
FROM orders
WHERE id = 15;

-- 4. Filter using a WHERE clause with the BETWEEN & AND operators. (Returns 39 records)
SELECT *
FROM orders 
WHERE quantity BETWEEN 3 AND 5;

-- 5. Filter using a WHERE statement >, <, <> operators.
SELECT *
FROM orders 
WHERE order_id > 1500;

SELECT *
FROM orders
WHERE quantity <> 1;

-- Create Alias Using AS

-- 1. Create an alias for a column using the AS keyword. (Returns 267 records)

SELECT 
	item_name AS 'Multiple Item Order',
	quantity AS Number
FROM orders
WHERE quantity >= 2;

/*
Notice that if I have spaces in my column alias, I have to put it in single quotes.
If I do not have a space in my colum alias, I do not have to put it in quotes.
*/