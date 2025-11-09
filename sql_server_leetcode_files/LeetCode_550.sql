USE [70-461];

CREATE TABLE Activity
(
	player_id INT,
	device_id INT,
	event_date DATE,
	games_played INT,
	PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT * FROM Activity;

-- LeetCode Solution # 550

WITH CTE_One AS (
SELECT player_id,
	MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id)

SELECT ROUND((COUNT(A.player_id)*1.0)/COUNT(C.player_id), 2) AS fraction
FROM CTE_One AS C
	LEFT JOIN Activity AS A
		ON C.player_id = A.player_id AND DATEDIFF(DAY, C.first_login, A.event_date) = 1;


DELETE FROM Activity;

--TRUNCATE TABLE Activity;

SELECT * FROM Activity;

DROP TABLE [70-461].[dbo].[Activity];