/*Output: hacker_id, name

Condition1: Full Score for more than one challenge
Condition2: Order by challenges
Condition3: 2nd Order: hacker_id asc*/

SELECT h.hacker_id,
        h.name
        --COUNT (s.challenge_id)

FROM hackers h
LEFT JOIN submissions s ON s.hacker_id = h.hacker_id
LEFT JOIN challenges c ON c.challenge_id = s.challenge_id
LEFT JOIN difficulty d on d.difficulty_level = c.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) desc, hacker_id asc