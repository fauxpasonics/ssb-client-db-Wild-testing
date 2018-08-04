CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_tax_rates_3]
(
[ETL__bypass_orders_fulfillment_groups_line_items_tax_rates_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[receipt_label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_tax_rates_3] ADD CONSTRAINT [PK__bypass_o__01656839B51C165F] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_line_items_tax_rates_id])
GO
