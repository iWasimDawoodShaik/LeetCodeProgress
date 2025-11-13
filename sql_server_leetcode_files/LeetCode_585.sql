USE [70-461];

CREATE TABLE Insurance
(
	pid INT PRIMARY KEY,
	tiv_2015 FLOAT,
	tiv_2016 FLOAT,
	lat FLOAT NOT NULL,
	lon FLOAT NOT NULL
);

INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon)
VALUES
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);

SELECT * FROM Insurance;

-- LeetCode Solution # 585

WITH CTE_One AS (
SELECT *,
	COUNT(*) OVER(PARTITION BY tiv_2015) AS tiv_2015_cnt,
	COUNT(*) OVER(PARTITION BY lat, lon) AS lat_lon_cnt
FROM Insurance)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM CTE_One
WHERE tiv_2015_cnt > 1
	AND lat_lon_cnt = 1;





--DELETE FROM Insurance;

TRUNCATE TABLE Insurance;

SELECT * FROM Insurance;

DROP TABLE [70-461].[dbo].[Insurance];