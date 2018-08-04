CREATE TABLE [ods].[Bypass_Transactions]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Tr__ETL_C__1F175F99] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Tr__ETL_U__200B83D2] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Bypass_Tr__ETL_I__20FFA80B] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [int] NULL,
[uuid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [date] NULL,
[account_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_sn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[display_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [decimal] (10, 2) NULL,
[venue_id] [int] NULL
)
GO
