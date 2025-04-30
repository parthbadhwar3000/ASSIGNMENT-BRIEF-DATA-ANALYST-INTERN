select * from customers_alt;
with jan_customers as (
select distinct(customer_id)
from customers_alt
where order_year=2024 and order_month=1
group by customer_id)

-- customers from january that ordered again in february
select 
'February' as month,
count(distinct(c.customer_id)) as repeated_customers
from jan_customers as j
inner join customers_alt as c
on j.customer_id=c.customer_id
where order_year=2024 and order_month=2
union
select 
'March' as month,
count(distinct(c.customer_id)) as repeated_customers
from jan_customers as j
inner join customers_alt as c
on j.customer_id=c.customer_id
where order_year=2024 and order_month=3
union
select 
'April' as month,
count(distinct(c.customer_id)) as repeated_customers
from jan_customers as j
inner join customers_alt as c
on j.customer_id=c.customer_id
where order_year=2024 and order_month=4
union
select 
'May' as month,
count(distinct(c.customer_id)) as repeated_customers
from jan_customers as j
inner join customers_alt as c
on j.customer_id=c.customer_id
where order_year=2024 and order_month=5
union
select 
'June' as month,
count(distinct(c.customer_id)) as repeated_customers
from jan_customers as j
inner join customers_alt as c
on j.customer_id=c.customer_id
where order_year=2024 and order_month=6


