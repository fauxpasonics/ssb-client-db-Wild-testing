CREATE TABLE [apietl].[bypass_orders_payments_account_2]
(
[ETL__bypass_orders_payments_account_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_payments_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_payments_account_2] ADD CONSTRAINT [PK__bypass_o__850AEF4C8A5AA678] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_payments_account_id])
GO
