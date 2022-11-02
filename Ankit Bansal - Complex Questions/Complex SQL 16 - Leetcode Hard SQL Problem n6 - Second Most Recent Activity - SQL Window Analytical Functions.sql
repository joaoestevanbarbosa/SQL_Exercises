--create table UserActivity
--(
--username      varchar(20) ,
--activity      varchar(20),
--startDate     Date   ,
--endDate      Date
--);

--insert into UserActivity values 
--('Alice','Travel','2020-02-12','2020-02-20')
--,('Alice','Dancing','2020-02-21','2020-02-23')
--,('Alice','Travel','2020-02-24','2020-02-28')
--,('Bob','Travel','2020-02-11','2020-02-18');

-- leetcode hard problem 1369. 
--Find the second most recent activity and if user has only 1 activoty then return that as it is. 
--We will use SQL window functions to solve this problem.

WITH CTE AS 
(
select 
	*,
	COUNT(1) OVER (PARTITION BY USERNAME) AS TOTAL_ACTIVITIES,
	RANK() OVER(PARTITION BY USERNAME ORDER BY STARTDATE DESC) AS RNK
from 
	UserActivity
)
SELECT * FROM CTE WHERE TOTAL_ACTIVITIES=1 OR RNK=2