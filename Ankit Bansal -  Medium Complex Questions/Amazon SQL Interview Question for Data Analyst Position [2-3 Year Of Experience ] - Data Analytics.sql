--create table hospital ( 
--emp_id int, 
--action varchar(10),
--time datetime);


--insert into hospital values ('1', 'in', '22-12-2019 09:00:00');
--insert into hospital values ('1', 'out', '22-12-2019 09:15:00');
--insert into hospital values ('2', 'in', '22-12-2019 09:00:00');
--insert into hospital values ('2', 'out', '22-12-2019 09:15:00');
--insert into hospital values ('2', 'in', '22-12-2019 09:30:00');
--insert into hospital values ('3', 'out', '22-12-2019 09:00:00');
--insert into hospital values ('3', 'in', '22-12-2019 09:15:00');
--insert into hospital values ('3', 'out', '22-12-2019 09:30:00');
--insert into hospital values ('3', 'in', '22-12-2019 09:45:00');
--insert into hospital values ('4', 'in', '22-12-2019 09:45:00');
--insert into hospital values ('5', 'out', '22-12-2019 09:40:00');

--In this video we are going to discuss a SQL interview problem 
--where we need to find number of employees inside the hospital. 
--2,3,4 estão presentes no fim das contas

--select * from hospital

--metodo having
with cte as (
select 
	emp_id,
	max(case when action = 'in' then time end) 'in_time',
	max(case when action = 'out' then time end) 'out_time'
from
	hospital
group by
	emp_id
--having
--	max(case when action = 'in' then time end) > max(case when action = 'out' then time end)
--	or
--	max(case when action = 'out' then time end) is null
)

select 
	* 
from
	cte
where
	in_time>out_time or out_time is null
----------------------------------------------------------
--metodo joins

with intime as
(
	select 
		emp_id,
		max(time) 'latest_in_time'
	from
		hospital
	where
		action = 'in'
	group by
		emp_id
),

outtime as
(
	select 
		emp_id,
		max(time) 'latest_out_time'
	from
		hospital
	where
		action = 'out'
	group by
		emp_id
)

select 
	*
from
	intime
left join
	outtime on intime.emp_id = outtime.emp_id
where
	latest_in_time > latest_out_time
	or
	latest_out_time is null

----------------------------------------------------
