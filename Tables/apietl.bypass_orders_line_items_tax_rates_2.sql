CREATE TABLE [apietl].[bypass_orders_line_items_tax_rates_2]
(
[ETL__bypass_orders_line_items_tax_rates_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_line_items_id] [uniqueidentifier] NULL,
[receipt_label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_line_items_tax_rates_2] ADD CONSTRAINT [PK__bypass_o__C75464143BBD6C1D] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_line_items_tax_rates_id])
GO
