SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Social]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(255),[SocialHandles_Twitter]) [Twitter]
	,CONVERT(NVARCHAR(255),[SocialHandles_Foursquare]) [Foursquare]
	,CONVERT(NVARCHAR(255),[SocialHandles_Facebook]) [Facebook]
	,CONVERT(NVARCHAR(255),[SocialHandles_Instagram]) [Instagram]
	,CONVERT(NVARCHAR(255),[SocialHandles_Shopify]) [Shopify]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE SocialHandles_Twitter IS NOT NULL

GO
