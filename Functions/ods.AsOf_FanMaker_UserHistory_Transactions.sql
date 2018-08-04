SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_FanMaker_UserHistory_Transactions] (@AsOfDate)
*/
 
CREATE FUNCTION [ods].[AsOf_FanMaker_UserHistory_Transactions] (@AsOfDate DATETIME)
 
RETURNS @Results TABLE
(
[UserID] [nvarchar](100) NULL,
[Status] [nvarchar](50) NULL,
[Success] [nvarchar](50) NULL,
[PurchasedAt] [datetime2](7) NULL,
[CreatedAt] [datetime2](7) NULL,
[DataType] [nvarchar](50) NULL,
[TransactionNumber] [nvarchar](100) NULL,
[TransactionID] [nvarchar](100) NULL,
[EventID] [nvarchar](100) NULL,
[LocationID] [nvarchar](100) NULL,
[TerminalID] [nvarchar](100) NULL,
[MemberID] [nvarchar](100) NULL,
[TableNumber] [nvarchar](100) NULL,
[TransactionItemsTotalCents] [int] NULL,
[TransactionItemsPriceCents] [int] NULL,
[TransactionItemsQuantity] [int] NULL,
[TransactionItemsName] [nvarchar](255) NULL,
[TransactionItemsCategory] [nvarchar](255) NULL,
[TransactionItemsBucket] [nvarchar](255) NULL,
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
SELECT [UserID],[Status],[Success],[PurchasedAt],[CreatedAt],[DataType],[TransactionNumber],[TransactionID],[EventID],[LocationID],[TerminalID],[MemberID],[TableNumber],[TransactionItemsTotalCents],[TransactionItemsPriceCents],[TransactionItemsQuantity],[TransactionItemsName],[TransactionItemsCategory],[TransactionItemsBucket],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
    (
    SELECT [UserID],[Status],[Success],[PurchasedAt],[CreatedAt],[DataType],[TransactionNumber],[TransactionID],[EventID],[LocationID],[TerminalID],[MemberID],[TableNumber],[TransactionItemsTotalCents],[TransactionItemsPriceCents],[TransactionItemsQuantity],[TransactionItemsName],[TransactionItemsCategory],[TransactionItemsBucket],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
    FROM [ods].[FanMaker_UserHistory_Transactions] t
    UNION ALL
    SELECT [UserID],[Status],[Success],[PurchasedAt],[CreatedAt],[DataType],[TransactionNumber],[TransactionID],[EventID],[LocationID],[TerminalID],[MemberID],[TableNumber],[TransactionItemsTotalCents],[TransactionItemsPriceCents],[TransactionItemsQuantity],[TransactionItemsName],[TransactionItemsCategory],[TransactionItemsBucket],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
    FROM [ods].[Snapshot_FanMaker_UserHistory_Transactions]
    ) a
WHERE
    @AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
    AND [ETL_CreatedOn] <= @AsOfDate
 
RETURN
 
END
GO
