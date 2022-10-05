--A median is defined as a number separating the higher half of a data set from the lower half.
--Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.


SELECT 
	DISTINCT CONVERT(DECIMAL(16,4), PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY LAT_N) OVER(PARTITION BY NULL))
FROM STATION

