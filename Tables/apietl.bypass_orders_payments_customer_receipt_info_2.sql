CREATE TABLE [apietl].[bypass_orders_payments_customer_receipt_info_2]
(
[ETL__bypass_orders_payments_customer_receipt_info_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_payments_id] [uniqueidentifier] NULL,
[Reference Number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_payments_customer_receipt_info_2] ADD CONSTRAINT [PK__bypass_o__40D127B8142D353D] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_payments_customer_receipt_info_id])
GO
