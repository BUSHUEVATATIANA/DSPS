select distinct brand
from transaction2 as t
where t.standard_cost > 1500;

select transaction_id, order_status
from transaction2 t 
where order_status = 'Approved' and to_date(transaction_date, 'DD-MM-YYYY') between '2017-04-01' and  '2017-04-09';

select distinct job_title 
from customer c 
where (job_industry_category = 'IT' or job_industry_category = 'Financial Services') and job_title like 'Senior%';

select distinct brand
from transaction2 t 
join customer c on coalesce(t.customer_id,0) = coalesce(c.customer_id,0) 
where c.job_industry_category = 'Financial Services';

select first_name, last_name
from customer c 
join transaction2 t on c.customer_id = t.customer_id 
where online_order = 'True'and brand in ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
limit 10;

select first_name, last_name
from customer c  
where c.customer_id  not in (select customer_id from transaction2 );


select first_name, last_name 
from customer c
join transaction2 t on c.customer_id = t.customer_id 
where standard_cost = (select max(standard_cost) from transaction2 t) and c.job_industry_category = 'IT';

with transaction_new as (
     select *
     from transaction2 t
     where t.order_status = 'Approved' and to_date(transaction_date, 'DD-MM-YYYY') between '2017-07-07' and '2017-07-17'
     )
select distinct first_name, last_name 
from customer c
join transaction_new t2 on c.customer_id = t2.customer_id 
where c.job_industry_category in ('IT','Health') 
