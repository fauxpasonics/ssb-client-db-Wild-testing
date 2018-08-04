CREATE TABLE [apietl].[o_fulfillment_groups_line_items_toppings_3]
(
[o_fulfillment_groups_line_items_toppings_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_of_measurement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_line_items_toppings_3] ADD CONSTRAINT [PK__o_fulfil__37203870437F4033] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_line_items_toppings_id])
GO
