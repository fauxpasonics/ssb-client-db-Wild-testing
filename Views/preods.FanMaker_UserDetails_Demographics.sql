SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Demographics]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(100),[Demographics_Gender]) [Gender]
	,CONVERT(INT,[Demographics_Age]) [Age]
	,CONVERT(NVARCHAR(255),[Demographics_RelationshipStatus]) [RelationshipStatus]
	,CONVERT(NVARCHAR(255),[Demographics_Religion]) [Religion]
	,CONVERT(NVARCHAR(255),[Demographics_Political]) [Political]
	,CONVERT(NVARCHAR(255),[Demographics_Birthdate]) [Birthdate]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE Demographics_Gender IS NOT NULL

GO
