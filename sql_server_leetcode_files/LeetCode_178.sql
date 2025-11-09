USE [70-461];

CREATE TABLE Scores
(
	id INT PRIMARY KEY,
	score DECIMAL(3, 2)
);

INSERT INTO Scores (id, score)
VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);

SELECT * FROM Scores;

-- LeetCode Solution # 178 

SELECT score,
	DENSE_RANK() OVER(ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC;




DELETE FROM Scores;

--TRUNCATE TABLE Scores;

SELECT * FROM Scores;

DROP TABLE [70-461].[dbo].[Scores];