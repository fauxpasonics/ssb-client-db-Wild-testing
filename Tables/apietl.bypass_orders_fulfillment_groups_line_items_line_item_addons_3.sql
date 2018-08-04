CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_line_item_addons_3]
(
[ETL__bypass_orders_fulfillment_groups_line_items_line_item_addons_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line_item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_line_item_addons_3] ADD CONSTRAINT [PK__bypass_o__DDACD1B29BFEFACA] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_line_items_line_item_addons_id])
GO
