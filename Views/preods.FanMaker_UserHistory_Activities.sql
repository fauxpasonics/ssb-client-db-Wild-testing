SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserHistory_Activities]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) UserID_K
	,CONVERT(NVARCHAR(50),ISNULL([Status], '')) [Status_K]
	,CONVERT(NVARCHAR(50),ISNULL([Success], '')) [Success_K]
	,CONVERT(NVARCHAR(255),ISNULL([ActivitiesIdentity], '')) [Identity_K]
	,CONVERT(NVARCHAR(255),ISNULL([ActivitiesType], '')) [Type_K]
	,CONVERT(NVARCHAR(255),ISNULL([ActivitiesSubtype], '')) [Subtype_K]
	,CONVERT(NVARCHAR(255),ISNULL([ActivitiesSubject], '')) [Subject_K]
	,CONVERT(DATETIME2,ISNULL([ActivitiesCreatedAt], '')) [CreatedAt_K]
	,CONVERT(NVARCHAR(500),ISNULL([ActivitiesSourceURL], '')) [SourceURL_K]
	,CONVERT(INT,ISNULL([ActivitiesWorth], '')) [PointsWorth_K]
	,CONVERT(INT,ISNULL([ActivitiesAwarded], '')) [PointsAwarded_K]
	,CONVERT(NVARCHAR(50),ISNULL([ActivitiesPointsExpired], '')) [PointsExpired_K]
	,CONVERT(INT,ISNULL([ActivitiesSpent], '')) [PointsSpent_K]
FROM [src].[FanMaker_UserHistory] WITH (NOLOCK)
WHERE ActivitiesIdentity IS NOT NULL

GO
