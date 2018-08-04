CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_CategorySpend]
(
[FanMaker_UserDetails_CategorySpendSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CategoryName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CategorySpend] [decimal] (18, 6) NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_CategorySpend] ADD CONSTRAINT [PK__Snapshot__599AA16EAFCACB4E] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_CategorySpendSK])
GO
