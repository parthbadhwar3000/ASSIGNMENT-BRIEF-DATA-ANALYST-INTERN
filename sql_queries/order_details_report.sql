-- Create a comprehensive report that provides a detailed overview of order information, payment details, and key metrics.
 
select 
c.order_id, c.customer_id,c.order_date,c.order_status,c.order_amount,
p.payment_id, p.payment_date, p.payment_status,p.payment_method,p.payment_amount
from 
customers_alt as c join 
payments_alt as p
on c.order_id=p.order_id;

-- key metrics
select 
count(distinct(c.order_id)) as total_orders,
sum(case when payment_status='completed' then 1 else 0 end) as successful_payments,
sum(case when payment_status='failed' then 1 else 0 end) as failed_payments,
round(sum(case when payment_status='completed' then p.payment_amount else 0 end),2) as revenue,
round(sum(order_amount)/count(c.order_id),2) as avg_order_value
from 
customers_alt as c join 
payments_alt as p
on c.order_id=p.order_id;