--create table billings 
--(
--emp_name varchar(10),
--bill_date date,
--bill_rate int
--);
--delete from billings;
--insert into billings values
--('Sachin','1990-01-01',25)
--,('Sehwag' ,'1989-01-01', 15)
--,('Dhoni' ,'1989-01-01', 20)
--,('Sachin' ,'1991-02-05', 30)
--;

--create table HoursWorked 
--(
--emp_name varchar(20),
--work_date date,
--bill_hrs int
--);
--insert into HoursWorked values
--('Sachin', '1990-07-01' ,3)
--,('Sachin', '1990-08-01', 5)
--,('Sehwag','1990-07-01', 2)
--,('Sachin','1991-07-01', 4)

--Total charges as per billing rate
-- You will learn how to use Lead analytical function with partition by clause and how to deal with data ranges in SQL.

with date_range as 
(
	select *, lead(dateadd(day,-1,bill_date),1,'9999-12-31') over (partition by emp_name order by bill_date asc) as bill_date_end
	from billings
)
	
select hw.emp_name, sum(dr.bill_rate*hw.bill_hrs)  from date_range dr 
inner join HoursWorked hw on hw.emp_name = dr.emp_name and hw.work_date between dr.bill_date_end and dr.bill_date_end
group by hw.emp_name