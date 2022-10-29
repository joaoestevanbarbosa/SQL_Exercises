--create table users14
--(
--user_id integer,
--name varchar(20),
--join_date date
--);

--insert into users14
--values (1, 'Jon', '2020-02-14'), 
--(2, 'Jane', '2020-02-14'), 
--(3, 'Jill', '2020-02-15'), 
--(4, 'Josh', '2020-02-15'), 
--(5, 'Jean','2020-02-16'), 
--(6, 'Justin', '2020-02-17'),
--(7, 'Jeremy', '2020-02-18');

--create table events14
--(
--user_id integer,
--type varchar(10),
--access_date date
--);

--insert into events14 values
--(1, 'Pay', '2020-03-01'), 
--(2, 'Music', '2020-03-02'), 
--(2, 'P', '2020-03-12'),
--(3, 'Music', '2020-03-15'), 
--(4, 'Music', '2020-03-15'), 
--(1, 'P', '2020-03-16'), 
--(3, 'P', '2020-03-22');

--Given the following two tables, return the fraction of users, rounded to two decimal places,
--who accessed Amazon music and upgraded to prime membership within the first 30 days of signing up. 

--select * from users14
--select * from events14

select --u.*, e.type, e.access_date, datediff(day, u.join_date, e.access_date) 'No_of_days' 
count (distinct u.user_id) 'total_users', 
count (distinct case when datediff(day, u.join_date, e.access_date) <= 30 then u.user_id end) 'user_until_30_days',
1.0*count (distinct case when datediff(day, u.join_date, e.access_date) <= 30 then u.user_id end)/count (distinct u.user_id)*100 '%'
from users14 u
left join events14 e on u.user_id = e.user_id and e.type = 'P'
where u.user_id in (select user_id from events14 where type = 'Music')