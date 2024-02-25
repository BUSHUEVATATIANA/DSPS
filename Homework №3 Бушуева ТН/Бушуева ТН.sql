select count(*) as cnt_industry, job_industry_category
from customer c 
group by job_industry_category
order by cnt_industry desc ;

select date_trunc('month',to_date(t.transaction_date,'DD-MM-YYYY')) as transaction_date_month 
      , sum(t.list_price) as sum_price
 from transaction2 t 
 join customer c on c.customer_id = t.customer_id 
 group by  date_trunc('month',to_date(t.transaction_date,'DD-MM-YYYY')), c.job_industry_category
 order by transaction_date_month, c.job_industry_category;

select count(t.online_order) as cnt_order
from transaction2 t 
join customer c on c.customer_id = t.customer_id 
where t.online_order = 'True'
group by t.order_status, c.job_industry_category, t.brand 
having t.order_status = 'Approved' and c.job_industry_category = 'IT';



select t.customer_id
       ,sum(t.list_price) as sum_transaction
       ,min(t.list_price) as min_transaction
       ,max(t.list_price) as max_transaction
       ,count(t.list_price) as cnt_transaction
from transaction2 t
group by t.customer_id 
having sum(t.list_price) is not null
order by sum(t.list_price) desc, count(t.list_price) desc;


select sum(t.list_price) over(partition by t.customer_id order by t.list_price) as sum_transaction
       ,min(t.list_price) over(partition by t.customer_id) as min_transaction
       ,max(t.list_price) over(partition by t.customer_id) as max_transaction
       ,count(t.list_price) over(partition by t.customer_id ) as cnt_transaction 
from transaction2 t 
where t.list_price is not null
order by sum_transaction, cnt_transaction;


select c.first_name
      ,c.last_name 
      ,sum(t.list_price) as sum_t
from customer c
join transaction2 t on t.customer_id = c.customer_id 
group by c.first_name, c.last_name
having sum(t.list_price) is not null
order by sum_t desc
limit 1;

select c.first_name
      ,c.last_name 
      ,sum(t.list_price) as sum_t
from customer c
join transaction2 t on t.customer_id = c.customer_id 
group by c.first_name, c.last_name 
having sum(t.list_price) is not null
order by sum_t asc 
limit 1;

select * 
from 
( select t.customer_id
        ,t.list_price
        ,t.transaction_date
        ,dense_rank() over(partition by customer_id order by to_date(t.transaction_date,'DD-MM-YYYY'),t.list_price ) as dr
from transaction2 t )
where dr = 1;

select c.first_name
      ,c.last_name 
      ,c.job_industry_category
      ,date_trunc('day',to_date(t.transaction_date,'DD-MM-YYYY')) - lead(date_trunc('day',to_date(t.transaction_date,'DD-MM-YYYY'))) over(partition by c.first_name,c.last_name order by t.transaction_date) as lead_date
from customer c 
join transaction2 t on t.customer_id = c.customer_id 
order by lead_date asc 
limit 1
 