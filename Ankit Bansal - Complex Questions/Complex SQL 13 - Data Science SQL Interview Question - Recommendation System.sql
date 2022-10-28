--create table orders13
--(
--order_id int,
--customer_id int,
--product_id int,
--);

--insert into orders13 VALUES 
--(1, 1, 1),
--(1, 1, 2),
--(1, 1, 3),
--(2, 2, 1),
--(2, 2, 2),
--(2, 2, 4),
--(3, 1, 5);

--create table products13 (
--id int,
--name varchar(10)
--);
--insert into products13 VALUES 
--(1, 'A'),
--(2, 'B'),
--(3, 'C'),
--(4, 'D'),
--(5, 'E');

--Product recommendation. 
--Just the basic type (“customers who bought this also bought…”). 
--That, in its simplest form, is an outcome of basket analysis. 
--In this video we will learn how to find products which are most frequently bought together using simple SQL. 
--Based on the history ecommerce website can recommend products to new user.

--select * from orders13
--select * from products13

select pr1.name + ' ' + pr2.name 'pair',  count(1) 'purchase_freq' from orders13 o1
inner join orders13 o2 on o1.order_id=o2.order_id
inner join products13 pr1 on pr1.id=o1.product_id
inner join products13 pr2 on pr2.id=o2.product_id
where o1.product_id < o2.product_id
group by pr1.name, pr2.name