SELECT p.firstName,
	p.lastName,
	A.city,
	A.state
FROM Person AS P
	LEFT JOIN Address AS A
		ON P.personId = A.personId;