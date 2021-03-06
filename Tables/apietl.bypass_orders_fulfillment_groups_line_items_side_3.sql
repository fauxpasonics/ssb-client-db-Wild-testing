CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_side_3]
(
[ETL__bypass_orders_fulfillment_groups_line_items_side_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_of_measurement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_side_3] ADD CONSTRAINT [PK__bypass_o__52A4BD1C7E0DA641] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_line_items_side_id])
GO
