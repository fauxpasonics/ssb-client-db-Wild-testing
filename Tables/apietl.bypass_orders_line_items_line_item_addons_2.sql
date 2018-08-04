CREATE TABLE [apietl].[bypass_orders_line_items_line_item_addons_2]
(
[ETL__bypass_orders_line_items_line_item_addons_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line_item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_line_items_line_item_addons_2] ADD CONSTRAINT [PK__bypass_o__FF60E600EBEAD92F] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_line_items_line_item_addons_id])
GO
