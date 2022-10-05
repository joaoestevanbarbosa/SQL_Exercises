/*Output:

1st part
hacker_id,
name, 
totalnumber of challenges by each student

Order by:
total number challenges desc,
hacker_id

2nd part
If more than 1 student with same number
	then
		count is less than the maximum number of challenges
			then
				exclude students

*/

/*
 https: //www.youtube.com/watch?v=vpzO8QTrgbc&list=PLvNOQ5GOhxcyYWOftlPlWyBbl6d9p7Qob&index=16
*/

with tbl_num_challenges as
(
SELECT h.hacker_id,
        h.name,
        COUNT(c.challenge_id) as num_challenges
FROM hackers h
JOIN challenges c ON c.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
--ORDER BY  COUNT(c.challenge_id)
)

, tbl_count_challenges as
(
SELECT
    num_challenges,
    COUNT(num_challenges) as count_challenges
FROM tbl_num_challenges
GROUP BY num_challenges
)

SELECT
    tnc.hacker_id,
    tnc.name,
    tnc.num_challenges
    --tcc.count_challenges
FROM tbl_num_challenges tnc 
JOIN tbl_count_challenges tcc ON tcc.num_challenges = tnc.num_challenges

WHERE 
    tcc.count_challenges <= 1
    OR 
    tnc.num_challenges = (select max(num_challenges) from tbl_num_challenges)
    
ORDER BY
    tnc.num_challenges desc,
    hacker_id
