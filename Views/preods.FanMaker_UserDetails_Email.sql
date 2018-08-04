SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Email]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(500),[ContactInfo_Email]) [ContactInfo_Email]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE ContactInfo_Email IS NOT NULL

GO
