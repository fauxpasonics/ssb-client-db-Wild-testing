CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_RewardsIdentifiers]
(
[FanMaker_UserDetails_RewardsIdentifiersSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Identifier] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IdentifierType] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_RewardsIdentifiers] ADD CONSTRAINT [PK__Snapshot__D817CF359B986A30] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_RewardsIdentifiersSK])
GO
