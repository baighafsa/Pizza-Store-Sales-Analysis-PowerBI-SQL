
Select Sum(total_price) AS Total_Revenue from pizza_sales

Select sum(total_price) / COUNT(distinct order_id) AS Avg_Order_Value from pizza_sales

Select sum(quantity) AS Total_Pizza_Sold from pizza_sales

Select count(distinct order_id) AS Total_orders from pizza_sales

Select CAST(cast(sum(quantity) AS Decimal(10,2)) / 
cast(count(distinct order_id) AS Decimal(10,2)) AS Decimal(10,2))
AS Avg_Pizza_per_order 
from pizza_sales

