CREATE TABLE [apietl].[o_fulfillment_groups_line_items_line_item_addons_3]
(
[o_fulfillment_groups_line_items_line_item_addons_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line_item_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_line_items_line_item_addons_3] ADD CONSTRAINT [PK__o_fulfil__42990B3F5667672E] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_line_items_line_item_addons_id])
GO
