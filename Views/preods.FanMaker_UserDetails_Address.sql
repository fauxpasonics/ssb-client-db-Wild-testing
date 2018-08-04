SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails_Address]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(100),[ContactInfo_Addresses_ID]) [AddressID_K]
	,CONVERT(NVARCHAR(500),[ContactInfo_Addresses_Name]) [CustomerName]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_Address1]) [Address1]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_Address2]) [Address2]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_City]) [City]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_State]) [State]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_Zip]) [ZipCode]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_Phone]) [Phone]
	,CONVERT(NVARCHAR(255),[ContactInfo_Addresses_Country]) [Country]
	,CONVERT(NVARCHAR(40),[ContactInfo_Addresses_Primary]) [IsPrimary]
	,CONVERT(NVARCHAR(1000),[ContactInfo_Addresses_FullAddress]) [FullAddress]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE ContactInfo_Addresses_ID IS NOT NULL

GO
