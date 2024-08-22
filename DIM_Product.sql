SELECT   ProductID
	,ProductName
	,Price
	,CASE
		WHEN Price < 50  THEN 'LOW'
		WHEN Price > 200 THEN 'HIGH'
		ELSE 'MEDIUM'
	END AS PriceCategory -- Categorized prices
FROM  products
