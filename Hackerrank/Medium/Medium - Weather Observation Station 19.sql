/*Consider two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N)
are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.*/

SELECT
   CAST(SQRT(POWER((pt.B - pt.A),2) + POWER((pt.D - pt.C),2)) AS DECIMAL (15,4))
FROM(
    SELECT 
        min(lat_n) as A,
        max(lat_n) as B,
        min(long_w) as C,
        max(long_w) as D
    FROM 
       station
  )pt
