CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_selection_groups_selections_4]
(
[ETL__bypass_orders_fulfillment_groups_line_items_selection_groups_selections_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_line_items_selection_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_line_items_selection_groups_selections_4] ADD CONSTRAINT [PK__bypass_o__50207B51B2AD549F] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_line_items_selection_groups_selections_id])
GO
