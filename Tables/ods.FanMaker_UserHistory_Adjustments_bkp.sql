CREATE TABLE [ods].[FanMaker_UserHistory_Adjustments_bkp]
(
[UserID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Success] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdjustmentsAdminID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdjustmentsDate] [datetime2] NOT NULL,
[AdjustmentsReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AdjustmentsPoints] [int] NULL,
[AdjustmentsType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
