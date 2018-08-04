CREATE TABLE [ods].[Snapshot_FanMaker_UserDetails_Social]
(
[FanMaker_UserDetails_SocialSK] [int] NOT NULL IDENTITY(1, 1),
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Twitter] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Foursquare] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Facebook] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Instagram] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shopify] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_FanMaker_UserDetails_Social] ADD CONSTRAINT [PK__Snapshot__50280CB29EA33667] PRIMARY KEY CLUSTERED  ([FanMaker_UserDetails_SocialSK])
GO
