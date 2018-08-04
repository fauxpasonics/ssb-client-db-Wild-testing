SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Spend]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(DECIMAL(18,6),[SpendData_TicketingSpend]) [Ticketing_Spend]
	,CONVERT(INT,[SpendData_POSPoints]) [POS_Points]
	,CONVERT(DECIMAL(18,6),[SpendData_POSSpend]) [POS_Spend]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE SpendData_TicketingSpend IS NOT NULL

GO
