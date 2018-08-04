CREATE TABLE [ods].[Bypass_LineItems]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Li__ETL_C__52082FB0] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Li__ETL_U__52FC53E9] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Bypass_Li__ETL_I__53F07822] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [int] NOT NULL,
[created_at] [datetime] NOT NULL,
[order_id] [int] NOT NULL,
[item_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [int] NOT NULL,
[price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cost] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[refunded] [bit] NULL,
[voided] [bit] NULL
)
GO
