CREATE TABLE [apietl].[fanmaker_userinfo_data_transactions_2]
(
[ETL__fanmaker_userinfo_data_transactions_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[purchased_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[data_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[transaction_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[transaction_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[terminal_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[member_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[table_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_transactions_2] ADD CONSTRAINT [PK__fanmaker__7F65FC9DDD482F23] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_transactions_id])
GO
