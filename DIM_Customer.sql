SELECT  c.CustomerID
	   ,c.Gender
	   ,c.age
	   ,g.Country
	   ,g.City
FROM customers AS c -- Alised table
LEFT JOIN geography AS g -- Alised table
ON c.GeographyID = g.GeographyID -- Tables merged 
