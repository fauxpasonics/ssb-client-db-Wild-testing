CREATE TABLE [ods].[Bypass_Orders]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Or__ETL_C__57C10906] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Or__ETL_U__58B52D3F] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Bypass_Or__ETL_I__59A95178] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [int] NOT NULL,
[created_at] [datetime] NOT NULL,
[venue_id] [int] NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [int] NULL,
[employee_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_serial_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[loyalty_account] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subtotal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
