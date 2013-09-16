/*
Jon Higgins
Database Systems
Queries Homework #1
September 16, 2013
/*

-- 1. List all data for all customers.

SELECT * FROM Customers;


-- 2. List the name and city of agents named Smith.

SELECT name, city FROM Agents WHERE name = 'Smith';


-- 3. List the pid, name and quantity of products costing more than US$1.25.

SELECT pid, name, quantity FROM Products WHERE priceUSD > 1.25;


-- 4. List the ordno and aid of all orders.

SELECT ordno, aid FROM Orders;


-- 5. List the names and cities of customers not in Dallas.

SELECT name, city FROM Customers WHERE city <> 'Dallas';


-- 6. List the names of agents in New York and Newark.

SELECT name FROM Agents WHERE city = 'New York' OR city = 'Newark';


-- 7. List all data for products not in New York or Newark that cost US$1 or less.

SELECT * FROM Products WHERE city <> 'New York' AND city <> 'Newark' AND priceUSD <= 1.00;


-- 8. List all data for orders in January or March.

SELECT * FROM Orders WHERE mon = 'jan' OR mon = 'mar';


-- 9. List all data for orders in February less than US$100.

SELECT * FROM Orders WHERE mon = 'feb' AND dollars < 100.00;


-- 10. List all orders from the customer whose cid is c005.

SELECT * FROM Orders WHERE cid = 'c005';