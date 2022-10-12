--recursive CTE

with cte_numbers as
(
	select 1 as num --anchor query

	UNION ALL

	SELECT num + 1  --recursive query
	FROM cte_numbers
	WHERE num < 6 --filter to stop the recursion
)

select num from cte_numbers