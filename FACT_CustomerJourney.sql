-- Data observed
SELECT 
  * 
FROM 
  [PortfolioProject_MarketingAnalytics].[dbo].[customer_journey] 
  
  -- In this part of code verified that there are duplicated rows in the data

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

-- with CTE dropped duplicated rows and avg_duration evaluated for each uniqe date 

WITH CleanedTable AS (
  Select 
    DISTINCT *, 
    AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration 
  From 
    customer_journey
) 

-- Cleaned table obtained
-- Null data replaced with average duration of its data using COALESCE function

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

