CREATE TABLE [ods].[Bypass_Line_Items_API]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime2] NULL,
[ETL__UpdatedDate] [datetime2] NULL,
[line_item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_price] [decimal] (13, 4) NULL,
[count] [int] NULL,
[refunded] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cancelled] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[menu_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sku] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printer] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[catalog] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate] [decimal] (13, 4) NULL,
[price] [decimal] (13, 4) NULL,
[item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[net_price_per_item] [decimal] (13, 4) NULL,
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
[discount_configuration_snapshot] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[addon_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[addon_quantity] [int] NULL,
[addon_price] [decimal] (13, 4) NULL,
[addon_group_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
