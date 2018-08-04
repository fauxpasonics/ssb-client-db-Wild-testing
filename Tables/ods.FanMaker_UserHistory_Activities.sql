CREATE TABLE [ods].[FanMaker_UserHistory_Activities]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Identity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subtype] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedAt] [datetime2] NOT NULL,
[SourceURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PointsWorth] [int] NOT NULL,
[PointsAwarded] [int] NOT NULL,
[PointsExpired] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PointsSpent] [int] NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__3A0DAEFC] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__3B01D335] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__3BF5F76E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__3CEA1BA7] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_FanMaker_UserHistory_ActivitiesUpdate] ON [ods].[FanMaker_UserHistory_Activities]
AFTER UPDATE, DELETE
 
AS
BEGIN
 
DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)
 
UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[FanMaker_UserHistory_Activities] t
    JOIN inserted i ON  t.[UserID] = i.[UserID] AND t.[Status] = i.[Status] AND t.[Success] = i.[Success] AND t.[Identity] = i.[Identity] AND t.[Type] = i.[Type] AND t.[Subtype] = i.[Subtype] AND t.[Subject] = i.[Subject] AND t.[CreatedAt] = i.[CreatedAt] AND t.[SourceURL] = i.[SourceURL] AND t.[PointsWorth] = i.[PointsWorth] AND t.[PointsAwarded] = i.[PointsAwarded] AND t.[PointsExpired] = i.[PointsExpired] AND t.[PointsSpent] = i.[PointsSpent]
 
INSERT INTO [ods].[Snapshot_FanMaker_UserHistory_Activities] ([UserID],[Status],[Success],[Identity],[Type],[Subtype],[Subject],[CreatedAt],[SourceURL],[PointsWorth],[PointsAwarded],[PointsExpired],[PointsSpent],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a
 
END
GO
ALTER TABLE [ods].[FanMaker_UserHistory_Activities] ADD CONSTRAINT [PK__FanMaker__1C8BAD36AA6FF9E2] PRIMARY KEY CLUSTERED  ([UserID], [Status], [Success], [Identity], [Type], [Subtype], [Subject], [CreatedAt], [SourceURL], [PointsWorth], [PointsAwarded], [PointsExpired], [PointsSpent])
GO
