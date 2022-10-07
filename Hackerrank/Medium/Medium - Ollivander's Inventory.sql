/*Context:
minimum number of gold galleons to bui each non-evil wand of power and age

Output:
id, age, coins_needed, power

Order by: power desc, age desc
*/

SELECT W.id, WP.Age, W.Coins_Needed, W.Power 
FROM Wands AS W 
    JOIN Wands_Property AS WP 
            ON W.Code = WP.Code 
WHERE WP.Is_Evil = 0 

/* This is where the magic happens 
We need all of the Wands.Coins_Needed values such that we have the smallest value with a matching Wands_Property.Age and Wands.Power and without evil, we have already joined W and WP without evil so we can use those tables

So grabbing just the minimum coins needed from the lists, 
where the power of a default database is equal to the power of a database without evil
and where the age of a default database is equal to the age of a database without evil

*/
AND W.Coins_Needed = 
    (SELECT MIN(Coins_Needed) 
     FROM Wands AS W2 
        JOIN Wands_Property AS WP2 
     ON W2.Code = WP2.Code
     WHERE W.Power = W2.Power AND WP.Age = WP2.Age)
     
/* This is where the magic stops */
ORDER BY W.Power DESC, WP.Age DESC;