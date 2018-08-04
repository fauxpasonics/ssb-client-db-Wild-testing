CREATE TABLE [ods].[Snapshot_FanMaker_UserHistory_Activities]
(
[FanMaker_UserHistory_ActivitiesSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Identity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subtype] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedAt] [datetime2] NULL,
[SourceURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PointsWorth] [int] NULL,
[PointsAwarded] [int] NULL,
[PointsExpired] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PointsSpent] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserHistory_Activities] ADD CONSTRAINT [PK__Snapshot__AA9BAC39C4CEB537] PRIMARY KEY CLUSTERED  ([FanMaker_UserHistory_ActivitiesSK])
GO
