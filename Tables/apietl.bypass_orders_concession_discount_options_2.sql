CREATE TABLE [apietl].[bypass_orders_concession_discount_options_2]
(
[ETL__bypass_orders_concession_discount_options_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_concession_id] [uniqueidentifier] NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percentage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_concession_discount_options_2] ADD CONSTRAINT [PK__bypass_o__EA510F0646D632B9] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_concession_discount_options_id])
GO
