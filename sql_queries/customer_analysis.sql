select * from customers_alt;
-- number of unique customers
select count(distinct(customer_id)) as unique_customers
from customers_alt;

--  number of order per customer
select  customer_id, count(order_id) as no_of_orders
from customers_alt
group by customer_id
order by no_of_orders desc;

-- top 10 customers by no of orders
select  customer_id, count(order_id) as no_of_orders
from customers_alt
group by customer_id
order by no_of_orders desc
limit 10;

-- least 10 customers by orders
select  customer_id, count(order_id) as no_of_orders
from customers_alt
group by customer_id
order by no_of_orders asc
limit 10;
-- checking if there are repeat order id i.e. same id for repeated products
select count(order_id) as total_orders,
count(distinct(order_id)) as unique_orders
from customers_alt;

-- customer who come again to order/ repeat order or either same customer buys different things
select customer_id, count(order_id) as total_orders
from customers_alt
group by customer_id
having total_orders>1;

-- categorizing customers as repeat buyers vs one time buyer
select customer_id,
case 
when count(order_id) = 1 then 'one time customer'
else 'repeat customer'
end as customer_type
from customers_alt
group by customer_id;

-- no of one time customer vs repeat customer
with cust_type as
(select customer_id,
case 
when count(order_id) = 1 then 'one time customer'
else 'repeat customer'
end as customer_type
from customers_alt
group by customer_id) 

select customer_type, count(customer_type) as total_customers
from cust_type
group by customer_type;


-- Money spent by each customer
select customer_id, round(sum(order_amount),2) as total_expenditure
from customers_alt
group by customer_id
order by total_expenditure desc;

-- top 10 spenders
select customer_id, round(sum(order_amount),2) as total_expenditure
from customers_alt
group by customer_id
order by total_expenditure desc
limit 10;

-- least 10 spenders
select customer_id, round(sum(order_amount),2) as total_expenditure
from customers_alt
group by customer_id
order by total_expenditure asc
limit 10;

-- average spending of all customers
select round(sum(order_amount)/count(distinct(customer_id)),2) as average_spend
from customers_alt;

-- categorizing customers to high, medium, low spenders
select customer_id,
round(sum(order_amount),2) as expenditure,
case 
when sum(order_amount)<500 then 'Low Spender'
when sum(order_amount) >=500 and sum(order_amount) <=1500 then 'Medium Spender'
else 'High Spender'
end as type_of_spender
from customers_alt
group by customer_id;

-- number of spenders in each category
with cust as
(
select customer_id,
round(sum(order_amount),2) as expenditure,
case 
when sum(order_amount)<500 then 'Low Spender'
when sum(order_amount) >=500 and sum(order_amount) <=1500 then 'Medium Spender'
else 'High Spender'
end as type_of_spender
from customers_alt
group by customer_id
)
select 
type_of_spender, count(type_of_spender) as total_customers
from cust
group by type_of_spender;

-- when do customers total spent by year
select customer_id, order_year,
count(order_id) as total_orders,
round(sum(order_amount),2) as spending_by_year
from customers_alt
group by customer_id,order_year
order by customer_id;

-- which months do customers order majorly
select customer_id, order_month,
count(order_id) as total_orders,
round(sum(order_amount),2) as spending_by_month
from customers_alt
group by customer_id,order_month
order by total_orders desc,spending_by_month desc,customer_id asc;



