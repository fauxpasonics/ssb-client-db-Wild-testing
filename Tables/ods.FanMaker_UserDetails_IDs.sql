CREATE TABLE [ods].[FanMaker_UserDetails_IDs]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IDs_TicketmasterID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__404F0189] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__414325C2] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__423749FB] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__432B6E34] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_FanMaker_UserDetails_IDsUpdate] ON [ods].[FanMaker_UserDetails_IDs]
AFTER UPDATE, DELETE
 
AS
BEGIN
 
DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)
 
UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[FanMaker_UserDetails_IDs] t
    JOIN inserted i ON  t.[UserID] = i.[UserID]
 
INSERT INTO [ods].[Snapshot_FanMaker_UserDetails_IDs] ([UserID],[IDs_TicketmasterID],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a
 
END
GO
ALTER TABLE [ods].[FanMaker_UserDetails_IDs] ADD CONSTRAINT [PK__FanMaker__1788CCAC92AA1219] PRIMARY KEY CLUSTERED  ([UserID])
GO
