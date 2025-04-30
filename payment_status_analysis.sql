select * from payments_alt;
-- Check how many payments are completed,failed, or pending
select payment_status,count(*) as total_no
from payments_alt
group by payment_status;

-- Payment Success Rate
select
sum(case when payment_status='completed' then 1 else 0 end)*100/count(payment_status)
as payment_completion_rate
from payments_alt;

-- Payment Pending rate
select
sum(case when payment_status='pending' then 1 else 0 end)*100/count(payment_status)
as payment_pending_rate
from payments_alt;

-- Payment failure rate
select
sum(case when payment_status='failed' then 1 else 0 end)*100/count(payment_status)
as payment_failure_rate
from payments_alt;

-- Yearly Trends
select 
payment_year, payment_status, count(*) as total
from payments_alt
group by payment_year, payment_status
order by payment_year;

-- which year has most failed payments
select 
payment_year, payment_status, count(*) as total
from payments_alt
where payment_status='failed'
group by payment_year, payment_status
order by total desc;

-- Monthly Trends
select 
payment_month, payment_status, count(*) as total
from payments_alt
group by payment_month, payment_status
order by payment_month;

-- which month has most failed payments
select 
payment_month, payment_status, count(*) as total
from payments_alt
where payment_status='failed'
group by payment_month, payment_status
order by total desc;

-- payment amount by status
select payment_status,
round(sum(payment_amount),2) as total_amount
from payments_alt
group by payment_status
order by total_amount desc;

-- do some specific customers face multiple payment issues
with fail_count as
(select c.order_id,
c.customer_id, p.payment_status
from 
customers_alt as c join
payments_alt as p
on c.order_id=p.order_id)

select customer_id,
count(*) as total_failed_payments
from fail_count
where payment_status='failed'
group by customer_id
having total_failed_payments>1
order by total_failed_payments desc;

