CREATE TABLE [ods].[FanMaker_UserDetails_Social]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Twitter] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Foursquare] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Facebook] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Instagram] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shopify] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__5CEB4037] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__5DDF6470] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__5ED388A9] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__5FC7ACE2] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_FanMaker_UserDetails_SocialUpdate] ON [ods].[FanMaker_UserDetails_Social]
AFTER UPDATE, DELETE
 
AS
BEGIN
 
DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)
 
UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[FanMaker_UserDetails_Social] t
    JOIN inserted i ON  t.[UserID] = i.[UserID]
 
INSERT INTO [ods].[Snapshot_FanMaker_UserDetails_Social] ([UserID],[Twitter],[Foursquare],[Facebook],[Instagram],[Shopify],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a
 
END
GO
ALTER TABLE [ods].[FanMaker_UserDetails_Social] ADD CONSTRAINT [PK__FanMaker__1788CCAC22B39D43] PRIMARY KEY CLUSTERED  ([UserID])
GO
