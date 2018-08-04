CREATE TABLE [ods].[FanMaker_UserDetails_CategorySpend]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CategoryName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CategorySpend] [decimal] (18, 6) NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__23B2C2DB] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__24A6E714] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__259B0B4D] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__268F2F86] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_FanMaker_UserDetails_CategorySpendUpdate] ON [ods].[FanMaker_UserDetails_CategorySpend]
AFTER UPDATE, DELETE
 
AS
BEGIN
 
DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)
 
UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[FanMaker_UserDetails_CategorySpend] t
    JOIN inserted i ON  t.[UserID] = i.[UserID] AND t.[CategoryName] = i.[CategoryName]
 
INSERT INTO [ods].[Snapshot_FanMaker_UserDetails_CategorySpend] ([UserID],[CategoryName],[CategorySpend],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a
 
END
GO
ALTER TABLE [ods].[FanMaker_UserDetails_CategorySpend] ADD CONSTRAINT [PK__FanMaker__1FD9B7829140FB0D] PRIMARY KEY CLUSTERED  ([UserID], [CategoryName])
GO
