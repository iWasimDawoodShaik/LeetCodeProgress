USE [70-461];

CREATE TABLE Logs
(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	num VARCHAR(1)
);

INSERT INTO Logs (num)
VALUES
('1'),
('1'),
('1'),
('2'),
('1'),
('2'),
('2');

SELECT * FROM Logs;

-- LeetCode Solution # 180

WITH CTE_One AS (
SELECT *,
	LEAD(num, 1) OVER(ORDER BY id ASC) AS n_1,
	LEAD(num, 2) OVER(ORDER BY id ASC) AS n_2
FROM Logs)

SELECT DISTINCT num AS ConsecutiveNums
FROM CTE_One
WHERE num = n_1
	AND n_1 = n_2;


--DELETE FROM Logs;

TRUNCATE TABLE Logs;

SELECT * FROM Logs;

DROP TABLE [70-461].[dbo].[Logs];