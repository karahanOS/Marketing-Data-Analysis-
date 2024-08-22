-- Cleaned and Transformed Reviews table
SELECT [ReviewID]
      ,[CustomerID]
      ,ProductID
      ,FORMAT(CONVERT(DATE,[ReviewDate]),'dd-MM-yyyy') AS  ReviewDate 
      -- Date format changed from yyyy-MM-dd to dd-MM-yyyy
      ,Rating
      ,REPLACE([ReviewText], '  ', ' ')  AS ReviewText 
      -- ReviewText column had double spacing in some data those are cleaned by using REPLACE function 
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[customer_reviews]
  ORDER BY Rating DESC
