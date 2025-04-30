select * from customers_alt;
-- Check how many orders are completed, pending, cancelled, etc.
select order_status,count(order_status) as number
from customers_alt
group by order_status;

-- Revenue yearly
select order_year,round(sum(order_amount),2) as yearly_sales
from customers_alt
group by order_year
order by order_year asc;

-- Patterns by Customers
-- 1. Which months has highest sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
group by order_month
order by total_sales_by_month desc;

-- 2. Days Trends

select 
case
when order_day between 1 and 10 then 'month start'
when order_day between 11 and 20 then 'middle of month'
when order_day between 21 and 25 then 'near end of month'
when order_day between 26 and 31 then 'month end'
else 'Inavlid'
end as day_groups,
round(sum(order_amount),2) as sales
from customers_alt
group by day_groups
order by sales desc;

-- 3. Trends by climate or festival
select
case 
when order_month between 1 and 2 then 'start of year winters'
when order_month =3 then 'march/holi time'
when order_month between 4 and 5 then 'early summers'
when order_month between 6 and 7 then 'peak summers'
when order_month between 8 and 9 then 'monsoons/late summers'
when order_month between 10 and 11 then 'diwali fest'
when order_month = 12 then 'christmas winter'
else 'Invalid'
end as year_group,
round(sum(order_amount),2) as sales
from customers_alt
group by year_group
order by sales desc;

-- 2020 monthly sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
where order_year = 2020
group by order_month
order by total_sales_by_month desc;

-- 2021 monthly sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
where order_year = 2021
group by order_month
order by total_sales_by_month desc;

-- 2022 monthly sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
where order_year = 2022
group by order_month
order by total_sales_by_month desc;

-- 2023 monthly sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
where order_year = 2023
group by order_month
order by total_sales_by_month desc;

-- 2024 monthly sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
where order_year = 2024
group by order_month
order by total_sales_by_month desc;

-- 2025 monthly sales
select order_month, round(sum(order_amount),2) as total_sales_by_month
from customers_alt
where order_year = 2025
group by order_month
order by total_sales_by_month desc;





