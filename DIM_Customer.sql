SELECT  c.CustomerID
	   ,c.Gender
	   ,c.age
	   ,g.Country
	   ,g.City
FROM customers AS c
LEFT JOIN geography AS g
ON c.GeographyID = g.GeographyID
