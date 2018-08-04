CREATE TABLE [apietl].[bypass_orders_authorization_payment_1]
(
[ETL__bypass_orders_authorization_payment_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_four_digits] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_authorization_payment_1] ADD CONSTRAINT [PK__bypass_o__9F1C09A8C2170722] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_authorization_payment_id])
GO
