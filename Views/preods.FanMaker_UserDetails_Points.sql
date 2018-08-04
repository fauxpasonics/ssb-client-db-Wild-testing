SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Points]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(INT,[Points_PointsAvailable]) [PointsAvailable]
	,CONVERT(INT,[Points_PointsSpent]) [PointsSpent]
	,CONVERT(INT,[Points_TotalPointsEarned]) [TotalPointsEarned]
	,CONVERT(INT,[Points_SocialPoints]) [SocialPoints]
	,CONVERT(INT,[Points_TicketingPoints]) [TicketingPoints]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE Points_PointsSpent IS NOT NULL

GO
