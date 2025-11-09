USE [70-461];

CREATE TABLE Employee
(
	id INT PRIMARY KEY,
	name VARCHAR(5),
	salary INT,
	managerId INT
);

INSERT INTO Employee (id, name, salary, managerId)
VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

SELECT * FROM Employee;

-- LeetCode Solution # 181

SELECT E.name AS Employee
FROM Employee AS E
	INNER JOIN Employee AS M
		ON E.managerId = M.id
WHERE E.salary > M.salary;



DELETE FROM Employee;

--TRUNCATE TABLE Employee;

SELECT * FROM Employee;

DROP TABLE [70-461].[dbo].[Employee];