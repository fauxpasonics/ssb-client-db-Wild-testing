CREATE TABLE [ods].[Bypass_CashDrops]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Ca__ETL_C__0A177EA9] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Ca__ETL_U__0B0BA2E2] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Bypass_Ca__ETL_I__0BFFC71B] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [int] NOT NULL,
[till_id] [int] NULL,
[bills] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[coins] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[coupon_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[archived_at] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
