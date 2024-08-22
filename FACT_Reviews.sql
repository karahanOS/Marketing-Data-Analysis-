SELECT [ReviewID]
      ,[CustomerID]
      ,ProductID
      ,FORMAT(CONVERT(DATE,[ReviewDate]),'dd-MM-yyyy') AS  ReviewDate 
      ,Rating
      ,REPLACE([ReviewText], '  ', ' ')  AS ReviewText 
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[customer_reviews]
  ORDER BY Rating DESC
