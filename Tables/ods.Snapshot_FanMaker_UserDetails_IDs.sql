CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_IDs]
(
[FanMaker_UserDetails_IDsSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IDs_TicketmasterID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_IDs] ADD CONSTRAINT [PK__Snapshot__2595DBC85362DCD6] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_IDsSK])
GO
