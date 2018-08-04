CREATE TABLE [apietl].[fanmaker_userinfo_data_transactions_transaction_items_3]
(
[ETL__fanmaker_userinfo_data_transactions_transaction_items_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_transactions_id] [uniqueidentifier] NULL,
[total_cents] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_cents] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bucket] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_transactions_transaction_items_3] ADD CONSTRAINT [PK__fanmaker__BEC101CC60004D79] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_transactions_transaction_items_id])
GO
