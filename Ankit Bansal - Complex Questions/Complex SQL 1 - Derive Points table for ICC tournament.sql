--CREATE TABLE icc_world_cup
--(
--	Team_1 VARCHAR (20),
--	Team_2 VARCHAR (20),
--	Winner VARCHAR (20)
--)

--INSERT INTO icc_world_cup VALUES ('India', 'SL', 'India')
--INSERT INTO icc_world_cup VALUES ('SL','Aus','Aus')
--INSERT INTO icc_world_cup VALUES ('SA','Eng','Eng')
--INSERT INTO icc_world_cup VALUES ('Eng','NZ','NZ')
--INSERT INTO icc_world_cup VALUES ('Aus','India','India')

--SELECT * FROM icc_world_cup

SELECT A.Team_name, COUNT (1) 'no_of_matches_played', 
SUM(Win_flag) 'no_of_matches_won', COUNT(1) - SUM(Win_flag) 'no_of_losses'
FROM (
SELECT Team_1 'Team_name',
		CASE WHEN Team_1=Winner THEN 1 ELSE 0 END AS Win_flag
FROM icc_world_cup
UNION ALL
SELECT Team_2 'Team_name',
		CASE WHEN Team_2=Winner THEN 1 ELSE 0 END AS Win_flag
FROM icc_world_cup ) A
GROUP BY A.Team_name
ORDER BY no_of_matches_won DESC
