/*
Jon Higgins
Database Systems
Queries Homework #3
October 7, 2013
*/


--1. Get the cities of agents booking an order for customers c002. Use a subquery.

select city
from agents
where aid in (select aid
               from orders
               where cid = 'c002')

--2. Get the cities of agents booking an order for customer c002. This time use joins; no subqueries.

select a.city
from agents a,
     orders o
where a.aid = o.aid
  and o.cid = 'c002'

--3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries.

select distinct pid
from orders 
where aid in (select aid
               from orders
               where cid in (select cid
                              from customers
                              where city = 'Kyoto'))

--4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins this time; no subqueries.

SELECT DISTINCT o1.pid		
FROM orders o,
     orders o1,
     customers c
WHERE o.cid = c.cid
  AND o1.aid = o.aid
  AND c.city = 'Kyoto'


--5. Get the names of customers who have never placed an order. Use a subquery.

Select name
from customers
where cid not in(select cid
                   from orders)

--6. Get the names of customers who have never placed an order. Use an outer join.

SELECT c.name 
FROM customers c 
full outer join orders o  
on c.cid = o.cid 
WHERE o.cid IS null 

--7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.

SELECT distinct customers.name AS Customer_Name, gents.name AS Agent_Name
FROM customers, agents, orders
WHERE customers.cid = orders.cid
  AND agents.aid = orders.aid
  AND customers.city = agents.city

--8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever palced an order with that agent.

SELECT DISTINCT c.name, a.name, c.city
FROM customers c, agents a
WHERE c.city = a.city 

--9. Get the name and city of customers who live in the city where the least number of products are made.

select c.name, c.city
from customers c
where c.city in (select p.city
                  from products p
                  group by p.city
                  order by count(*) asc limit 1)

--10. Get the name and city of customers who live in a city where the most number of products are made.

select c.name, c.city
from customers c
where c.city in (select p.city
                  from products p
                  group by p.city
                  order by count(*) desc limit 1)

--11. Get the name and city of customers who live in any city where the most number of products are made.

select c.name, c.city
from customers c
where c.city in (select p1.city
                  from products p1
                  group by p1.city
                  having count(*) = (select count(*)
                                      from products p2
                                      group by p2.city
                                      order by count(*) desc limit 1))

--12. List the products whose priceUSD is above the average priceUSD.



--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.



--14. Show all customer names(in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.



--15. Show the names of all customers who bought products they ordered, and the names of the afents who sold it to them.



--16.Write a query to check the accuracy of the dollars column in the Orders table.This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars.



--17. Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query.

 