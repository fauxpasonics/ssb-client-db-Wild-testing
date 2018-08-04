CREATE TABLE [ods].[FanMaker_UserHistory_Adjustments]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AdjustmentsAdminID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AdjustmentsDate] [datetime2] NOT NULL,
[AdjustmentsReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AdjustmentsPoints] [int] NOT NULL,
[AdjustmentsType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__161045A8] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_C__170469E1] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__17F88E1A] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FanMaker___ETL_U__18ECB253] DEFAULT (suser_sname())
)
GO
ALTER TABLE [ods].[FanMaker_UserHistory_Adjustments] ADD CONSTRAINT [PK__FanMaker__64224F1551DCB75E] PRIMARY KEY CLUSTERED  ([UserID], [Status], [Success], [AdjustmentsAdminID], [AdjustmentsDate], [AdjustmentsReason], [AdjustmentsPoints], [AdjustmentsType])
GO
