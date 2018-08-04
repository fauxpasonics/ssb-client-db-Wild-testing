CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_selection_groups_3]
(
[ETL__bypass_orders_fulfillment_groups_line_items_selection_groups_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[group_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_selection_groups_3] ADD CONSTRAINT [PK__bypass_o__88B8C8527C478FC7] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_line_items_selection_groups_id])
GO
