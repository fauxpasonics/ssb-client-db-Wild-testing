CREATE TABLE [apietl].[bypass_orders_line_items_selection_groups_selections_3]
(
[ETL__bypass_orders_line_items_selection_groups_selections_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_line_items_selection_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_line_items_selection_groups_selections_3] ADD CONSTRAINT [PK__bypass_o__4A7A7BA34C9E7807] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_line_items_selection_groups_selections_id])
GO
