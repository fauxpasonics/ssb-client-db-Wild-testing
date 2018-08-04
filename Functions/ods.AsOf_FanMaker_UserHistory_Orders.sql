SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_FanMaker_UserHistory_Orders] (@AsOfDate)
*/
 
CREATE FUNCTION [ods].[AsOf_FanMaker_UserHistory_Orders] (@AsOfDate DATETIME)
 
RETURNS @Results TABLE
(
[UserID] [nvarchar](100) NULL,
[Status] [nvarchar](50) NULL,
[Success] [nvarchar](50) NULL,
[AdminID] [nvarchar](255) NULL,
[Quantity] [int] NULL,
[DeliveryMethod] [nvarchar](255) NULL,
[OrderedOn] [datetime2](7) NULL,
[CompletedOn] [datetime2](7) NULL,
[ShippingInfo] [nvarchar](500) NULL,
[FirstName] [nvarchar](255) NULL,
[LastName] [nvarchar](255) NULL,
[Email] [nvarchar](255) NULL,
[Title] [nvarchar](255) NULL,
[Subtitle] [nvarchar](255) NULL,
[Description] [nvarchar](255) NULL,
[ImageURL] [nvarchar](500) NULL,
[PrizeType] [nvarchar](255) NULL,
[OrdersStatus] [nvarchar](255) NULL,
[ItemOption] [nvarchar](255) NULL,
[Points] [int] NULL,
[ShippingInfoName] [nvarchar](500) NULL,
[ShippingInfoAddress1] [nvarchar](255) NULL,
[ShippingInfoAddress2] [nvarchar](255) NULL,
[ShippingInfoCity] [nvarchar](255) NULL,
[ShippingInfoState] [nvarchar](255) NULL,
[ShippingInfoZip] [nvarchar](255) NULL,
[ShippingInfoPhone] [nvarchar](255) NULL,
[ShippingInfoTrackingnumber] [nvarchar](255) NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)
 
AS
BEGIN
 
DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))
 
INSERT INTO @Results
SELECT [UserID],[Status],[Success],[AdminID],[Quantity],[DeliveryMethod],[OrderedOn],[CompletedOn],[ShippingInfo],[FirstName],[LastName],[Email],[Title],[Subtitle],[Description],[ImageURL],[PrizeType],[OrdersStatus],[ItemOption],[Points],[ShippingInfoName],[ShippingInfoAddress1],[ShippingInfoAddress2],[ShippingInfoCity],[ShippingInfoState],[ShippingInfoZip],[ShippingInfoPhone],[ShippingInfoTrackingnumber],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
    (
    SELECT [UserID],[Status],[Success],[AdminID],[Quantity],[DeliveryMethod],[OrderedOn],[CompletedOn],[ShippingInfo],[FirstName],[LastName],[Email],[Title],[Subtitle],[Description],[ImageURL],[PrizeType],[OrdersStatus],[ItemOption],[Points],[ShippingInfoName],[ShippingInfoAddress1],[ShippingInfoAddress2],[ShippingInfoCity],[ShippingInfoState],[ShippingInfoZip],[ShippingInfoPhone],[ShippingInfoTrackingnumber],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
    FROM [ods].[FanMaker_UserHistory_Orders] t
    UNION ALL
    SELECT [UserID],[Status],[Success],[AdminID],[Quantity],[DeliveryMethod],[OrderedOn],[CompletedOn],[ShippingInfo],[FirstName],[LastName],[Email],[Title],[Subtitle],[Description],[ImageURL],[PrizeType],[OrdersStatus],[ItemOption],[Points],[ShippingInfoName],[ShippingInfoAddress1],[ShippingInfoAddress2],[ShippingInfoCity],[ShippingInfoState],[ShippingInfoZip],[ShippingInfoPhone],[ShippingInfoTrackingnumber],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
    FROM [ods].[Snapshot_FanMaker_UserHistory_Orders]
    ) a
WHERE
    @AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
    AND [ETL_CreatedOn] <= @AsOfDate
 
RETURN
 
END
GO
