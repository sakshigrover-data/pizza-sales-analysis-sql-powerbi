-- Pizza Sales Data Analysis
-- Author: Sakshi Grover
-- Tools Used: SQL Server
-- Dataset: Pizza Sales
-- Description: This project analyzes pizza sales data to extract business insights
-- using SQL techniques such as joins, aggregate functions, subqueries, 
-- window functions, CTEs, and date functions.

---------------------------------------------------------------------
-- BASIC ANALYSIS
---------------------------------------------------------------------

-- 1. Retrieve the total number of orders placed.

SELECT COUNT(order_id) AS Total_Orders
FROM   orders; 

-- 2. Calculate the total revenue generated from pizza sales.

SELECT Round(Sum(od.quantity * p.price), 2) AS Total_Sales
FROM   order_details AS od
       JOIN pizzas AS p
         ON od.pizza_id = p.pizza_id; 

-- 3. Identify the highest-priced pizza.

SELECT TOP 1 
    pizza_types.name AS Pizza_Name,
	pizzas.size AS Pizza_Size,
    ROUND(pizzas.price,2) as Pizza_Price
FROM pizza_types
JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC;

-- 4. Identify the most common pizza size ordered.

SELECT TOP 1 
			 p.size AS Pizzas_Size,
             SUM(od.quantity) AS Total_Pizzas_Ordered
FROM   pizzas AS p
       JOIN order_details AS od
         ON p.pizza_id = od.pizza_id
GROUP  BY p.size
ORDER  BY total_pizzas_ordered DESC; 

-- 5. List the top 5 most ordered pizza types along with their quantities.

SELECT TOP 5 pizza_types.NAME            AS Pizzas_Name,
             Sum(order_details.quantity) AS Quantity
FROM   pizza_types
       JOIN pizzas
         ON pizza_types.pizza_type_id = pizzas.pizza_type_id
       JOIN order_details
         ON order_details.pizza_id = pizzas.pizza_id
GROUP  BY pizza_types.NAME
ORDER  BY quantity DESC; 

---------------------------------------------------------------------
-- INTERMEDIATE ANALYSIS
---------------------------------------------------------------------

-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT pt.category      AS Pizza_Category,
       Sum(od.quantity) AS Total_Quantity
FROM   pizzas AS p
       JOIN pizza_types AS pt
         ON p.pizza_type_id = pt.pizza_type_id
       JOIN order_details AS od
         ON p.pizza_id = od.pizza_id
GROUP  BY pt.category
ORDER  BY Total_Quantity DESC; 


-- 7. Determine the distribution of orders by hour of the day.

SELECT Datepart(hour, time) AS order_hour,
       Count(order_id)      AS total_orders
FROM   orders
GROUP  BY Datepart(hour, time)
ORDER  BY order_hour; 

-- 8. Join relevant tables to find the category-wise distribution of pizzas.

SELECT category,
       Count(*) AS total_pizza
FROM   pizza_types
GROUP  BY category; 

-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT Avg(daily_total) AS avg_pizzas_ordered_per_day
FROM   (SELECT o.date,
               Sum(od.quantity) AS daily_total
        FROM   orders AS o
               JOIN order_details AS od
                 ON o.order_id = od.order_id
        GROUP  BY o.date) AS total_orders; 

-- 10. Determine the top 3 most ordered pizza types based on revenue.

SELECT TOP 3 pt.NAME,
             Sum(p.price * od.quantity) AS Total_Sales
FROM   pizza_types AS pt
       JOIN pizzas AS p
         ON pt.pizza_type_id = p.pizza_type_id
       JOIN order_details AS od
         ON od.pizza_id = p.pizza_id
GROUP  BY pt.NAME
ORDER  BY total_sales DESC; 

---------------------------------------------------------------------
-- ADVANCED ANALYSIS
---------------------------------------------------------------------

-- 11. Calculate the percentage contribution of each pizza type to total revenue.

SELECT pt.NAME,
       Sum(p.price * od.quantity)                            AS Total_Sales,
       Round(Sum(p.price * od.quantity) * 100 / Sum(Sum(p.price * od.quantity))
                                                  OVER(), 2) AS
       percentage_contribution
FROM   pizza_types AS pt
       JOIN pizzas AS p
         ON pt.pizza_type_id = p.pizza_type_id
       JOIN order_details AS od
         ON od.pizza_id = p.pizza_id
GROUP  BY pt.NAME
ORDER  BY percentage_contribution DESC; 

-- 12. Analyze the cumulative revenue generated over time.

SELECT o.DATE,
       SUM(( p.price * od.quantity ))                          AS Total_Revenue,
       Round(SUM(SUM(( p.price * od.quantity )))
               over(
                 ORDER BY o.DATE ROWS unbounded preceding), 2) AS
       Cumulative_Total
FROM   order_details AS od
       join pizzas AS p
         ON od.pizza_id = p.pizza_id
       join orders AS o
         ON o.order_id = od.order_id
GROUP  BY o.DATE
ORDER  BY o.DATE; 

-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH ranked_pizzas
     AS (SELECT pt.category,
                pt.NAME,
                Sum(( od.quantity * p.price ))                 AS Total_Sales,
                Rank()
                  OVER(
                    partition BY pt.category
                    ORDER BY Sum((od.quantity * p.price))DESC) AS Ranking
         FROM   pizza_types AS pt
                JOIN pizzas AS p
                  ON pt.pizza_type_id = p.pizza_type_id
                JOIN order_details AS od
                  ON od.pizza_id = p.pizza_id
         GROUP  BY pt.category,
                   pt.NAME)
SELECT *
FROM   ranked_pizzas
WHERE  ranking <= 3
ORDER  BY category,
          ranking; 
