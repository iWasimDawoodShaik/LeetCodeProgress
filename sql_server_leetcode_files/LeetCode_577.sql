USE [70-461];

CREATE TABLE Employee
(
	empId INT UNIQUE,
	name VARCHAR(6),
	supervisor INT,
	salary INT
);

CREATE TABLE Bonus
(
	empId INT UNIQUE,
	bonus INT,
	FOREIGN KEY (empId) REFERENCES Employee (empId)
);

INSERT INTO Employee (empId, name, supervisor, salary)
VALUES
(3, 'Brad', NULL, 4000),
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(4, 'Thomas', 3, 4000);

INSERT INTO Bonus (empId, bonus)
VALUES
(2, 500),
(4, 2000);

SELECT * FROM Employee;

SELECT * FROM Bonus;

-- LeetCode Solution # 577

SELECT E.name,
	B.bonus
FROM Employee AS E
	LEFT JOIN Bonus AS B
		ON E.empId = B.empId
WHERE B.bonus IS NULL
	OR B.bonus < 1000;




--DELETE FROM Bonus;

TRUNCATE TABLE Bonus;

SELECT * FROM Bonus;

DROP TABLE [70-461].[dbo].[Bonus];

DELETE FROM Employee;

--TRUNCATE TABLE Employee;

SELECT * FROM Employee;

DROP TABLE [70-461].[dbo].[Employee];

