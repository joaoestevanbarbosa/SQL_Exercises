--create table users2 (
--user_id         int     ,
-- join_date       date    ,
-- favorite_brand  varchar(50))

-- create table orders2 (
-- order_id       int     ,
-- order_date     date    ,
-- item_id        int     ,
-- buyer_id       int     ,
-- seller_id      int 
-- )

-- create table items2
-- (
-- item_id        int     ,
-- item_brand     varchar(50)
-- )


-- insert into users2 values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

-- insert into items2 values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

-- insert into orders2 values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
-- ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);

-- select * from users2

--  select * from items2

--   select * from orders2

--Write an SQL query to find for each user, whether the brand of the second item (by date) they sold is their favorite brand. If a user sold less than two items, report the answer for that user as no.

--It is guaranteed that no seller sold more than one item on a day.

with rnk_orders as
(
select *, 
rank() over(partition by seller_id order by order_date asc) as rn
from orders2
)
select u.user_id 'seller_id'
--, ro.*, i.item_brand, u.favorite_brand  
, case when i.item_brand = u.favorite_brand  then 'Yes' else 'No' end as item_fav_brand
from users2 u 
LEFT JOIN rnk_orders ro on ro.seller_id=u.user_id and rn=2
LEFT JOIN items2 i on i.item_id=ro.item_id
--where rn = 2