USE [70-461];

CREATE TABLE Weather
(
	id INT UNIQUE,
	recordDate DATE,
	temperature INT
);

INSERT INTO Weather (id, recordDate, temperature)
VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

SELECT * FROM Weather;

-- LeetCode Solution # 197

SELECT CD.id
FROM Weather AS CD
	INNER JOIN Weather AS PD
		ON DATEDIFF(DAY, PD.recordDate, CD.recordDate) = 1
WHERE CD.temperature > PD.temperature;





DELETE FROM Weather;

--TRUNCATE TABLE Weather;

SELECT * FROM Weather;

DROP TABLE [70-461].[dbo].[Weather];