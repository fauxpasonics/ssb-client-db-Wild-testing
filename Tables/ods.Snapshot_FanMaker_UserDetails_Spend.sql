CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_Spend]
(
[FanMaker_UserDetails_SpendSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ticketing_Spend] [decimal] (18, 6) NULL,
[POS_Points] [int] NULL,
[POS_Spend] [decimal] (18, 6) NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_Spend] ADD CONSTRAINT [PK__Snapshot__2C4314975685A3AD] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_SpendSK])
GO
