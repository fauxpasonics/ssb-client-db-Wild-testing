SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_CategorySpend]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(255),[SpendData_CategorySpend_Name]) [CategoryName_K]
	,CONVERT(DECIMAL(18,6),[SpendData_CategorySpend_Spend]) [CategorySpend]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE SpendData_CategorySpend_Name IS NOT NULL

GO
