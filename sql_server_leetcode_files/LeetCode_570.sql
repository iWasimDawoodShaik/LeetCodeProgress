USE [70-461];

CREATE TABLE Employee
(
	id INT PRIMARY KEY,
	name VARCHAR(5),
	department VARCHAR(1),
	managerId INT
);

INSERT INTO Employee (id, name, department, managerId)
VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

SELECT * FROM Employee;

-- LeetCode Soltion # 570

SELECT M.name
FROM Employee AS E
	INNER JOIN Employee AS M
		ON E.managerId = M.id
GROUP BY M.managerId, M.name
HAVING COUNT(E.id) >= 5;



DELETE FROM Employee;

--TRUNCATE TABLE Employee;

SELECT * FROM Employee;

DROP TABLE [70-461].[dbo].[Employee];