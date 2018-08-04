CREATE TABLE [dbo].[temp_fanmaker_transactions]
(
[purchased_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[data_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[transaction_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[transaction_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[terminal_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[member_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[table_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fanmaker_userinfo_data_transactions_id] [int] NULL
)
GO
