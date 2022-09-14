--Olympic Gold Medals Problem | SQL Online Interview Question | Data Analytics | 2 Solutions

--CREATE TABLE events (
--ID int,
--event varchar(255),
--YEAR INt,
--GOLD varchar(255),
--SILVER varchar(255),
--BRONZE varchar(255)
--);

--delete from events;

--INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
--INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
--INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
--INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
--INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
--INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
--INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
--INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
--INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
--INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
--INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
--INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');

--select * from events

--In this video we will discuss a problem where we need to find player with no of gold medals won by them only for players 
--who won only gold medals.

--subquery
SELECT 
	GOLD 'PLAYER_NAME',
	COUNT(1) 'NO_OF_MEDALS'
FROM EVENTS
WHERE GOLD NOT IN (SELECT SILVER FROM EVENTS) AND GOLD NOT IN (SELECT BRONZE FROM EVENTS)
GROUP BY GOLD

------------------------------------------------------------------------------------------------

/*group by + having
WITH CTE AS 
(
SELECT 
	GOLD 'PLAYER_NAME',
	'GOLD' AS MEDAL_TYPE FROM EVENTS
UNION ALL
SELECT
	SILVER 'PLAYER_NAME',
	'SILVER' AS MEDAL_TYPE FROM EVENTS
UNION ALL
SELECT
	BRONZE 'PLAYER_NAME',
	'BRONZE' AS MEDAL_TYPE FROM EVENTS
)
SELECT
	PLAYER_NAME,
	COUNT(1) 'NO_OF_GOLD_MEDALS'
FROM CTE
GROUP BY PLAYER_NAME
HAVING COUNT (DISTINCT MEDAL_TYPE) = 1 AND MAX(MEDAL_TYPE)='GOLD'
*/