CREATE TABLE [stg].[Bypass_Orders]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_Or__ETL_C__55D8C094] DEFAULT (getdate()),
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[employee_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_serial_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[loyalty_account] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subtotal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
