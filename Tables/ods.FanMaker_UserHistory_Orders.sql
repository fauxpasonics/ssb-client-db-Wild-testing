CREATE TABLE [ods].[FanMaker_UserHistory_Orders]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdminID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Quantity] [int] NOT NULL,
[DeliveryMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderedOn] [datetime2] NOT NULL,
[CompletedOn] [datetime2] NOT NULL,
[ShippingInfo] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subtitle] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImageURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrizeType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrdersStatus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemOption] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Points] [int] NULL,
[ShippingInfoName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoAddress1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoAddress2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoCity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoState] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoZip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoPhone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingInfoTrackingnumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__418ADC80] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__427F00B9] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__437324F2] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__4467492B] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_FanMaker_UserHistory_OrdersUpdate] ON [ods].[FanMaker_UserHistory_Orders]
AFTER UPDATE, DELETE
 
AS
BEGIN
 
DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)
 
UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[FanMaker_UserHistory_Orders] t
    JOIN inserted i ON  t.[UserID] = i.[UserID] AND t.[Quantity] = i.[Quantity] AND t.[OrderedOn] = i.[OrderedOn] AND t.[CompletedOn] = i.[CompletedOn] AND t.[Title] = i.[Title]
 
INSERT INTO [ods].[Snapshot_FanMaker_UserHistory_Orders] ([UserID],[Status],[Success],[AdminID],[Quantity],[DeliveryMethod],[OrderedOn],[CompletedOn],[ShippingInfo],[FirstName],[LastName],[Email],[Title],[Subtitle],[Description],[ImageURL],[PrizeType],[OrdersStatus],[ItemOption],[Points],[ShippingInfoName],[ShippingInfoAddress1],[ShippingInfoAddress2],[ShippingInfoCity],[ShippingInfoState],[ShippingInfoZip],[ShippingInfoPhone],[ShippingInfoTrackingnumber],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a
 
END
GO
ALTER TABLE [ods].[FanMaker_UserHistory_Orders] ADD CONSTRAINT [PK__FanMaker__8F447209CC12B2F6] PRIMARY KEY CLUSTERED  ([UserID], [Quantity], [OrderedOn], [CompletedOn], [Title])
GO
