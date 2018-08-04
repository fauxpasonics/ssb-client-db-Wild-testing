CREATE TABLE [dbo].[temp_fanmaker_transactions_transaction_items]
(
[fanmaker_userinfo_data_transactions_id] [int] NULL,
[total_cents] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_cents] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bucket] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
