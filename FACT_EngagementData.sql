SELECT TOP (1000) [EngagementID]
      ,[ContentID]
      ,[ProductID]
      ,FORMAT(CONVERT(DATE,[EngagementDate]),'dd-MM-yyyy') AS EngagementDate
      ,UPPER(REPLACE([ContentType], 'Social Media', 'SocialMedia')) AS ContentType
      ,[Likes]
      ,[CampaignID]
      ,LEFT(ViewsClicksCombined, (CHARINDEX('-', ViewsClicksCombined)-1)) AS Views
	  ,RIGHT(ViewsClicksCombined, (LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined))) AS Clicks
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[engagement_data]
  WHERE ContentType != 'Newsletter'
