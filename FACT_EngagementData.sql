SELECT [EngagementID]
      ,[ContentID]
      ,[ProductID]
      ,FORMAT(CONVERT(DATE,[EngagementDate]),'dd-MM-yyyy') AS EngagementDate
	-- Date format changed from yyyy-MM-dd to dd-MM-yyyy
      ,UPPER(REPLACE([ContentType], 'Social Media', 'SocialMedia')) AS ContentType
	-- In this column some data was all uppercased, undercased or some wrote with space some was not. All transformed to same type
      ,[Likes]
      ,[CampaignID]
      ,LEFT(ViewsClicksCombined, (CHARINDEX('-', ViewsClicksCombined)-1)) AS Views
	-- data parsed from combined column
      ,RIGHT(ViewsClicksCombined, (LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined))) AS Clicks
	-- data parsed from combined column
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[engagement_data]
  WHERE ContentType != 'Newsletter'
