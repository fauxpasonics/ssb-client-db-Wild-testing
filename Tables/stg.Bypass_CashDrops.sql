CREATE TABLE [stg].[Bypass_CashDrops]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Ca__ETL_C__0DE80F8D] DEFAULT (getdate()),
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[till_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bills] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[coins] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[coupon_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[archived_at] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
