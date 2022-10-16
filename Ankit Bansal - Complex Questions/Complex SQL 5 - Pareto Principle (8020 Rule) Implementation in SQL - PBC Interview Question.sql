--Pareto Principle states that for many outcomes, roughly 80% of consequeces com from 20% os causes: eg:
--- 80% of the productivity come from 20% of the employees.
--- 80% of ur sales come from 20% of the clients.
--- 80% of decicions ins a meeting are made in 20% of the time
--- 80% of ur sales comes from 20% of ur products or services.

--select sum(sales) * 0.8 from orders
with product_wise_sales as
	(
	select product_id, sum(sales) as product_sales 
	from orders
	group by product_id
	)
, calc_sales as 
(
select product_id, product_sales,
sum(product_sales) over (order by product_sales desc rows between unbounded preceding and 0 preceding) as running_sales,
0*8*sum(product_sales) over () as total_sales
from product_wise_sales
)

select * from calc_sales where running_sales <= total_sales

-- select (413*1.0/1862)*100