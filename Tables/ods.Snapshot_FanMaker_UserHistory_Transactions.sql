CREATE TABLE [ods].[Snapshot_FanMaker_UserHistory_Transactions]
(
[FanMaker_UserHistory_TransactionsSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PurchasedAt] [datetime2] NULL,
[CreatedAt] [datetime2] NULL,
[DataType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocationID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TerminalID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TableNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionItemsTotalCents] [int] NULL,
[TransactionItemsPriceCents] [int] NULL,
[TransactionItemsQuantity] [int] NULL,
[TransactionItemsName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionItemsCategory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionItemsBucket] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserHistory_Transactions] ADD CONSTRAINT [PK__Snapshot__AE2FA07EB9A9D0DB] PRIMARY KEY CLUSTERED  ([FanMaker_UserHistory_TransactionsSK])
GO
