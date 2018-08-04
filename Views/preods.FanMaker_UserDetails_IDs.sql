SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_IDs]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(100),[IDs_TicketmasterID]) [IDs_TicketmasterID]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE IDs_TicketmasterID IS NOT NULL

GO
