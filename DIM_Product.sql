SELECT TOP(10) ProductID
	,ProductName
	--,Category
	,Price
	,CASE
		WHEN Price < 50  THEN 'LOW'
		WHEN Price > 200 THEN 'HIGH'
		ELSE 'MEDIUM'
	END AS PriceCategory 	
FROM  products