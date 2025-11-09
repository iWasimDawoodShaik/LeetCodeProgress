USE [70-461];

CREATE TABLE Person
(
	personId INT PRIMARY KEY,
	lastName VARCHAR(5),
	firstname VARCHAR(5)
);

INSERT INTO Person (personId, lastName, firstname)
VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

CREATE TABLE Address
(
	addressId INT PRIMARY KEY,
	personId INT,
	city VARCHAR(15),
	state VARCHAR(10)
);

INSERT INTO Address (addressId, personId, city, state)
VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California');


SELECT * FROM Person;

SELECT * FROM Address;

-- LeetCode Solution # 175

SELECT P.firstName,
	P.lastName,
	A.city,
	A.state
FROM Person AS P
	LEFT JOIN  Address AS A
		ON P.personId = A.personId;



DELETE FROM Address;

--TRUNCATE TABLE Address;

SELECT * FROM Address;

DROP TABLE [70-461].[dbo].[Address];


DELETE FROM Person;

--TRUNCATE TABLE Person;

SELECT * FROM Person;

DROP TABLE [70-461].[dbo].[Person];