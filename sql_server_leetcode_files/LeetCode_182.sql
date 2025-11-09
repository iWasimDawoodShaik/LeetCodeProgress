USE [70-461];

CREATE TABLE Person
(
	id INT PRIMARY KEY,
	email VARCHAR(7)
);

INSERT INTO Person (id, email)
VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

SELECT * FROM Person;

-- LeetCode Solution # 182

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(id) > 1;




DELETE FROM Person;

--TRUNCATE TABLE Person;

SELECT * FROM Person;

DROP TABLE [70-461].[dbo].[Person];