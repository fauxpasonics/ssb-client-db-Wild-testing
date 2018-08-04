CREATE TABLE [ods].[Bypass_Payments]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Pa__ETL_C__1B46CEB5] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Pa__ETL_U__1C3AF2EE] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Bypass_Pa__ETL_I__1D2F1727] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [int] NULL,
[order_id] [int] NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[custom_tender_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[house_account_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [decimal] (10, 2) NULL,
[refunded_amount] [decimal] (10, 2) NULL,
[voided_amount] [decimal] (10, 2) NULL,
[failed_amount] [decimal] (10, 2) NULL,
[tip_amount] [decimal] (10, 2) NULL,
[card_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_four_digits] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[expiration] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stored_value_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
