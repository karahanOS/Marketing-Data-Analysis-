SELECT 
  * 
FROM 
  [PortfolioProject_MarketingAnalytics].[dbo].[customer_journey] 
  
  -------------------------------

SELECT 
  [JourneyID], 
  CustomerID, 
  ProductID, 
  [VisitDate], 
  Stage, 
  Action, 
  Duration, 
  COUNT(*) 
FROM 
  [PortfolioProject_MarketingAnalytics].[dbo].[customer_journey] 
GROUP BY 
  JourneyID, 
  CustomerID, 
  ProductID, 
  [VisitDate], 
  Stage, 
  Action, 
  Duration 
HAVING 
  COUNT(*)> 1;

---------------------------------

WITH CleanedTable AS (
  Select 
    DISTINCT *, 
    AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration 
  From 
    customer_journey
) 

----------------------------------

SELECT 
  JourneyID, 
  CustomerID, 
  ProductID, 
  FORMAT(
    CONVERT(DATE, VisitDate), 
    'dd-MM-yyyy'
  ) AS VisitDate, 
  UPPER(STAGE) AS STAGE, 
  Action, 
  COALESCE(Duration, avg_duration) AS Duration 
FROM 
  CleanedTable

