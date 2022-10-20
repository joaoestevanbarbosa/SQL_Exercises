--Write an SQL query to find the winner in each group.

--The winner in each group is the player who scored the maximum total points within the group. 
--In the case of a tie, the lowest player_id wins.


--create table players2
--(player_id int,
--group_id int)

--insert into players2 values (15,1);
--insert into players2 values (25,1);
--insert into players2 values (30,1);
--insert into players2 values (45,1);
--insert into players2 values (10,2);
--insert into players2 values (35,2);
--insert into players2 values (50,2);
--insert into players2 values (20,3);
--insert into players2 values (40,3);

--create table matches2
--(
--match_id int,
--first_player int,
--second_player int,
--first_score int,
--second_score int)

--insert into matches2 values (1,15,45,3,0);
--insert into matches2 values (2,30,25,1,2);
--insert into matches2 values (3,30,15,2,0);
--insert into matches2 values (4,40,20,5,2);
--insert into matches2 values (5,35,50,1,1);


--select * from players2
--select * from matches2
with player_scores as
(
select first_player 'player_id', first_score 'score' from matches2
union all
select second_player 'player_id', second_score 'score' from matches2
)
,
final_scores as 
(
select p.group_id, ps.player_id, sum(ps.score) 'score' from  player_scores ps
inner join players2 p on p.player_id = ps.player_id
group by p.group_id, ps.player_id
)
, final_rank as 
(
select * , rank() over (partition by group_id order by score desc , player_id asc) 'rn'
from final_scores
)

select * from final_rank where rn=1