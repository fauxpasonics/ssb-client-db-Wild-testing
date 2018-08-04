CREATE TABLE [apietl].[bypass_orders_payments_merchant_receipt_info_2]
(
[ETL__bypass_orders_payments_merchant_receipt_info_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_payments_id] [uniqueidentifier] NULL,
[Reference Number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_payments_merchant_receipt_info_2] ADD CONSTRAINT [PK__bypass_o__FCA86B96191E6FE0] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_payments_merchant_receipt_info_id])
GO
