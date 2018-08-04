SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserHistory_Orders]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) UserID_K
	,CONVERT(NVARCHAR(50),[Status]) [Status]
	,CONVERT(NVARCHAR(50),[Success]) [Success]
	,CONVERT(NVARCHAR(255),[OrdersAdmin-id]) [AdminID]
	,CONVERT(INT,[OrdersQuantity]) [Quantity_K]
	,CONVERT(NVARCHAR(255),[OrdersDeliveryMethod]) [DeliveryMethod]
	,CONVERT(DATETIME2,[OrdersOrderedOn]) [OrderedOn_K]
	,CONVERT(DATETIME2,[OrdersCompletedOn]) [CompletedOn_K]
	,CONVERT(NVARCHAR(500),[OrdersShippingInfo]) [ShippingInfo]
	,CONVERT(NVARCHAR(255),[OrdersFirstName]) [FirstName]
	,CONVERT(NVARCHAR(255),[OrdersLastName]) [LastName]
	,CONVERT(NVARCHAR(255),[OrdersEmail]) [Email]
	,CONVERT(NVARCHAR(255),[OrdersTitle]) [Title_K]
	,CONVERT(NVARCHAR(255),[OrdersSubtitle]) [Subtitle]
	,CONVERT(NVARCHAR(255),[OrdersDescription]) [Description]
	,CONVERT(NVARCHAR(500),[OrdersImageURL]) [ImageURL]
	,CONVERT(NVARCHAR(255),[OrdersPrizeType]) [PrizeType]
	,CONVERT(NVARCHAR(255),[OrdersStatus]) [OrdersStatus]
	,CONVERT(NVARCHAR(255),[OrdersItemOption]) [ItemOption]
	,CONVERT(INT,[OrdersPoints]) [Points]
	,CONVERT(NVARCHAR(500),[OrdersShippingInfoName]) [ShippingInfoName]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoAddress1]) [ShippingInfoAddress1]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoAddress2]) [ShippingInfoAddress2]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoCity]) [ShippingInfoCity]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoState]) [ShippingInfoState]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoZip]) [ShippingInfoZip]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoPhone]) [ShippingInfoPhone]
	,CONVERT(NVARCHAR(255),[OrdersShippingInfoTrackingnumber]) [ShippingInfoTrackingnumber]
FROM [src].[FanMaker_UserHistory] WITH (NOLOCK)
WHERE [OrdersAdmin-ID] IS NOT NULL
GO
