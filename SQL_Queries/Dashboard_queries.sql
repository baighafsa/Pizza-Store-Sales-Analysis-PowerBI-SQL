--1. 
Select DateName(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by DateName(DW, order_date) --DW is just to convert date into string

--2.
select DateName(Month, order_date) AS Month_Name, Count(distinct order_id) as Total_orders
from pizza_sales
group by DateName(Month, order_date)
order by Total_orders desc

--3. 
select pizza_category,sum(total_price) as total_sales, sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where Month(order_date) = 1 ) AS PCT --To get an entire sales
from pizza_sales 
where Month(order_date) = 1           --want to see only for 1st month
group by pizza_category


--4.
select pizza_size,CAST(sum(total_price) AS decimal(10,2)) as total_sales,CAST(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where Datepart (quarter, order_date)=1) as decimal(10,2) ) AS PCT --To get an entire sales
from pizza_sales
where Datepart (quarter, order_date)=1 -- for 1st quarter
group by pizza_size
order by PCT desc   -- size with percentage of total 

--5. 
select pizza_category, sum(quantity) as Pizzas_sold
from pizza_sales
group by pizza_category
order by Pizzas_sold desc

--6.
-- By Revenue
select TOP 5 pizza_name, sum(total_price) AS Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc

-- By Total Quantity
select TOP 5 pizza_name, sum(quantity) AS Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity desc

-- By Total Orders
select TOP 5 pizza_name, count(distinct order_id) AS Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders desc

--7.
-- By Revenue
select TOP 5 pizza_name, CAST(sum(total_price)as decimal(10,2)) AS Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue ASC

-- By Total Quantity
select TOP 5 pizza_name, sum(quantity) AS Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity Asc

-- By Total Orders
select TOP 5 pizza_name, count(distinct order_id) AS Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders asc

select * from pizza_sales