CREATE TABLE [apietl].[o_fulfillment_groups_line_items_2]
(
[o_fulfillment_groups_line_items_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[count] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[refunded] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cancelled] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[menu_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sku] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printer] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[notes] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[guest] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_inclusive] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[net_weight] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tare_weight] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[weight_unit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discount_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discount_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[side] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_variant] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discount_configuration_snapshot] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_line_items_2] ADD CONSTRAINT [PK__o_fulfil__CE575D726A0A311C] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_line_items_id])
GO
