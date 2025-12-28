select *from pizza
--1.Total revenue--
SELECT SUM(total_price) AS Total_Revenue FROM pizza
--2.Average order value
 SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza
 --3.Total pizzas sol
 SELECT SUM(quantity) AS Total_pizza_sold FROM pizza
 --4.Total orders
 SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza
 --5.Average pizzas per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza
--6.Daily trend for total orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza
GROUP BY DATENAME(DW, order_date)
--7.Hourly trend for orders
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)
--8.Percentage of sales by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_category
--9.Percentage of sales by pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_size
ORDER BY pizza_size
--10.Total pizzas sold by pizza category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
--11.Top 5 by total pizzas sold 
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
--12.Bottom 5 sellers by total pizzas sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
--13.





