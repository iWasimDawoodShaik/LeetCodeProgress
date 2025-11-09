USE [70-461];

CREATE TABLE Person
(
	id INT PRIMARY KEY,
	email VARCHAR(20)
);

INSERT INTO Person (id, email)
VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

SELECT * FROM Person;

-- LeetCode Solution # 196

DELETE FROM Person
WHERE id NOT IN (SELECT MIN(id) FROM Person GROUP BY email);

SELECT * FROM Person;






DELETE FROM Person;

--TRUNCATE TABLE Person;

SELECT * FROM Person;

DROP TABLE [70-461].[dbo].[Person];