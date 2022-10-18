--Write a query to find PersonID, Name, number os friends, sum of marks
--of person who have friends with total score greater than 100.

--select * from person
--select * from friend


with score_details as
(
select p.personID, count(1) 'no_of_friends', sum(p.Score) 'total_friends_score'
from person p 
inner join friend f on p.personID = p.personID
group by p.personID
having sum(p.Score)  > 100
)

select s.*, p.Name 'person_name'
from person p
inner join score_details s on p.personID = s.personID