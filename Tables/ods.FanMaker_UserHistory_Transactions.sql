CREATE TABLE [ods].[FanMaker_UserHistory_Transactions]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PurchasedAt] [datetime2] NOT NULL,
[CreatedAt] [datetime2] NOT NULL,
[DataType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TransactionNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TransactionID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EventID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LocationID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TerminalID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MemberID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TableNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TransactionItemsTotalCents] [int] NOT NULL,
[TransactionItemsPriceCents] [int] NOT NULL,
[TransactionItemsQuantity] [int] NOT NULL,
[TransactionItemsName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TransactionItemsCategory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TransactionItemsBucket] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__6DDF2B61] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__6ED34F9A] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__6FC773D3] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__70BB980C] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_FanMaker_UserHistory_TransactionsUpdate] ON [ods].[FanMaker_UserHistory_Transactions]
AFTER UPDATE, DELETE
 
AS
BEGIN
 
DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)
 
UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[FanMaker_UserHistory_Transactions] t
    JOIN inserted i ON  t.[UserID] = i.[UserID] AND t.[Status] = i.[Status] AND t.[Success] = i.[Success] AND t.[PurchasedAt] = i.[PurchasedAt] AND t.[CreatedAt] = i.[CreatedAt] AND t.[DataType] = i.[DataType] AND t.[TransactionNumber] = i.[TransactionNumber] AND t.[TransactionID] = i.[TransactionID] AND t.[EventID] = i.[EventID] AND t.[LocationID] = i.[LocationID] AND t.[TerminalID] = i.[TerminalID] AND t.[MemberID] = i.[MemberID] AND t.[TableNumber] = i.[TableNumber] AND t.[TransactionItemsTotalCents] = i.[TransactionItemsTotalCents] AND t.[TransactionItemsPriceCents] = i.[TransactionItemsPriceCents] AND t.[TransactionItemsQuantity] = i.[TransactionItemsQuantity] AND t.[TransactionItemsName] = i.[TransactionItemsName] AND t.[TransactionItemsCategory] = i.[TransactionItemsCategory] AND t.[TransactionItemsBucket] = i.[TransactionItemsBucket]
 
INSERT INTO [ods].[Snapshot_FanMaker_UserHistory_Transactions] ([UserID],[Status],[Success],[PurchasedAt],[CreatedAt],[DataType],[TransactionNumber],[TransactionID],[EventID],[LocationID],[TerminalID],[MemberID],[TableNumber],[TransactionItemsTotalCents],[TransactionItemsPriceCents],[TransactionItemsQuantity],[TransactionItemsName],[TransactionItemsCategory],[TransactionItemsBucket],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a
 
END
GO
ALTER TABLE [ods].[FanMaker_UserHistory_Transactions] ADD CONSTRAINT [PK__FanMaker__F410421023DCC9FC] PRIMARY KEY CLUSTERED  ([UserID], [Status], [Success], [PurchasedAt], [CreatedAt], [DataType], [TransactionNumber], [TransactionID], [EventID], [LocationID], [TerminalID], [MemberID], [TableNumber], [TransactionItemsTotalCents], [TransactionItemsPriceCents], [TransactionItemsQuantity], [TransactionItemsName], [TransactionItemsCategory], [TransactionItemsBucket])
GO
