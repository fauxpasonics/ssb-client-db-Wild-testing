CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_Email]
(
[FanMaker_UserDetails_EmailSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactInfo_Email] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_Email] ADD CONSTRAINT [PK__Snapshot__022E83327901EF81] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_EmailSK])
GO
