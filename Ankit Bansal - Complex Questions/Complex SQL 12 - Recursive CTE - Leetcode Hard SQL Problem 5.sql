
--create table sales (
--product_id int,
--period_start date,
--period_end date,
--average_daily_sales int
--);

--insert into sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);

--In second part we will discuss a leet code SQL hard problem where we will be using recursive CTE concept. 

with r_cte as
(
select min(period_start) 'dates',  max(period_start) 'max_dates' from sales
union all
select dateadd(day,1,dates) 'dates', max_dates from r_cte
where dates < max_dates
)

select product_id, year(dates) 'report_year', sum(average_daily_sales) 'total_amount' from r_cte
inner join sales on dates between period_start and period_end
group by  product_id, year(dates) 
order by  product_id, year(dates) 
option (maxrecursion 1000)