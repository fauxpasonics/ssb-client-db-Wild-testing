CREATE TABLE [stg].[Bypass_LineItemModifiers]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Li__ETL_C__5F622ACE] DEFAULT (getdate()),
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line_item_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifier_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[additional_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
