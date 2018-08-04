CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_Demographics]
(
[FanMaker_UserDetails_DemographicsSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age] [int] NULL,
[RelationshipStatus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Religion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Political] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_Demographics] ADD CONSTRAINT [PK__Snapshot__4314E593427B05E6] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_DemographicsSK])
GO
