SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [preods].[FanMaker_UserHistory_Adjustments]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) UserID_K
	,CONVERT(NVARCHAR(50),ISNULL([Status], '')) [Status_K]
	,CONVERT(NVARCHAR(50),ISNULL([Success], '')) [Success_K]
	,CONVERT(NVARCHAR(100),ISNULL([AdjustmentsAdminID], '')) [AdjustmentsAdminID_K]
	,CONVERT(DATETIME2,ISNULL([AdjustmentsDate], '')) [AdjustmentsDate_K]
	,CONVERT(NVARCHAR(255),ISNULL([AdjustmentsReason], '')) [AdjustmentsReason_K]
	,CONVERT(INT,ISNULL([AdjustmentsPoints], '')) [AdjustmentsPoints_K]
	,CONVERT(NVARCHAR(255),ISNULL([AdjustmentsType], '')) [AdjustmentsType_K]
FROM [src].[FanMaker_UserHistory] WITH (NOLOCK)
WHERE AdjustmentsAdminID IS NOT NULL

GO
