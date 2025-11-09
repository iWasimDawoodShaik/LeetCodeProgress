USE [70-461];

CREATE TABLE Users
(
	users_id INT PRIMARY KEY,
	banned VARCHAR(3) CHECK (banned IN ('Yes', 'No')),
	role VARCHAR(7) CHECK (role IN ('client', 'driver', 'partner'))
);


CREATE TABLE Trips
(
	id INT PRIMARY KEY,
	client_id INT,
	driver_id INT,
	city_id INT,
	status VARCHAR(20) CHECK (status IN ('completed', 'cancelled_by_driver', 'cancelled_by_client')),
	request_at DATE,
	FOREIGN KEY (client_id) REFERENCES Users (users_id),
	FOREIGN KEY (driver_id) REFERENCES Users (users_id)
);

INSERT INTO Users (users_id, banned, role)
VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at)
VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

SELECT * FROM Trips;

SELECT * FROM Users;

-- LeetCode Solution # 262

SELECT request_at AS Day,
	ROUND((SUM(CASE
		WHEN status LIKE 'cancelled%'
			THEN 1
		ELSE 0
	END)*1.0)/COUNT(id), 2) AS [Cancellation Rate]
FROM Trips
WHERE client_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes' AND role = 'client')
	AND driver_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes' AND role = 'driver')
	AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;



DELETE FROM Trips;

--TRUNCATE TABLE Trips;

SELECT * FROM Trips;

DROP TABLE [70-461].[dbo].[Trips];

--DELETE FROM Users;

TRUNCATE TABLE Users;

SELECT * FROM Users;

DROP TABLE [70-461].[dbo].[Users];



