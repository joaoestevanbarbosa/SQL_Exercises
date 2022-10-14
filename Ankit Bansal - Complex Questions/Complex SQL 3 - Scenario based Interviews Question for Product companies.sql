with visits as
(select name,floor,
count(1) as no_of_floor_visits,
rank()over(partition by name order by count(1) desc) as rankd 
from entries
group by name,floor)

select v.name,total_visits,floor as most_visited_floor,used_resources from visits v 

join

(select name,string_agg(resources,',') as used_resources from (select distinct name,resources from entries)x
group by x.name)B

on
v.name=B.name

join 

(select name,count(*) as total_visits from entries group by name)C
on v.name=C.name

where rankd=1