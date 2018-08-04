CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_Points]
(
[FanMaker_UserDetails_PointsSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PointsAvailable] [int] NULL,
[PointsSpent] [int] NULL,
[TotalPointsEarned] [int] NULL,
[SocialPoints] [int] NULL,
[TicketingPoints] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_Points] ADD CONSTRAINT [PK__Snapshot__C5020BFF8D1A6856] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_PointsSK])
GO
