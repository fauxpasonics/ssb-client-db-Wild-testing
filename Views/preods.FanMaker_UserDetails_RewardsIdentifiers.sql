SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [preods].[FanMaker_UserDetails_RewardsIdentifiers]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(100),[IDs_RewardsIdentifiers_Identifier]) [Identifier_K]
	,CONVERT(NVARCHAR(100),[IDs_RewardsIdentifiers_Type]) [IdentifierType_K]
	,CONVERT(NVARCHAR(100),[IDs_RewardsIdentifiers_Active]) [Active_K]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE IDs_RewardsIdentifiers_Identifier IS NOT NULL

GO
