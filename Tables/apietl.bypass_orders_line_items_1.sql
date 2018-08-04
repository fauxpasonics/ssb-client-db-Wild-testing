CREATE TABLE [apietl].[bypass_orders_line_items_1]
(
[ETL__bypass_orders_line_items_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[count] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[refunded] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cancelled] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[menu_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sku] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printer] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[catalog] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[net_price_per_item] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[notes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[guest] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_inclusive] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[net_weight] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tare_weight] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[weight_unit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discount_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discount_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_variant] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[side] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discount_configuration_snapshot] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_line_items_1] ADD CONSTRAINT [PK__bypass_o__2F2912BFB791FCCE] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_line_items_id])
GO
