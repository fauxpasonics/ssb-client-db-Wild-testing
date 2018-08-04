SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Phone]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(255),[ContactInfo_PhoneNumbers_PhoneHome]) [PhoneHome]
	,CONVERT(NVARCHAR(255),[ContactInfo_PhoneNumbers_PhoneMobile]) [PhoneMobile]
	,CONVERT(NVARCHAR(255),[ContactInfo_PhoneNumbers_PhoneOffice]) [PhoneOffice]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE ContactInfo_PhoneNumbers_PhoneHome IS NOT NULL

GO
