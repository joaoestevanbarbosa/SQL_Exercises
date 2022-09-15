--create table tickets
--(
--ticket_id varchar(10),
--create_date date,
--resolved_date date
--);
--delete from tickets;
--insert into tickets values
--(1,'2022-08-01','2022-08-03')
--,(2,'2022-08-01','2022-08-12')
--,(3,'2022-08-01','2022-08-16');
--create table holidays
--(
--holiday_date date
--,reason varchar(100)
--);
--delete from holidays;
--insert into holidays values
--('2022-08-11','Rakhi'),('2022-08-15','Independence day');

--In this video we are going to solve a very important business use case 
--where we need to find difference between 2 dates excluding weekends and public holidays. 
--Basically we need to find business days between 2 given dates using SQL. 

--select * from holidays

select 
	ticket_id,
	create_date,
	resolved_date,
	--count(holiday_date) 'No_of_holidays', --contar feriados
	--DATEDIFF(day,create_date,resolved_date)'actual_days', --conta para saber os dias
	--DATEPART(week,create_date), --qual semana é create_date
	--DATEPART(week, resolved_date), --qual semana é resolved_date
	DATEDIFF(day,create_date,resolved_date) - 2*DATEDIFF(week,create_date,resolved_date) - count(holiday_date) 'business_days' --1 semana tem 2 dias de folga, por isso x2
from tickets
left join holidays on holiday_date between create_date and resolved_date
group by ticket_id, create_date, resolved_date
