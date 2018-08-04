CREATE TABLE [apietl].[bypass_orders_line_items_selection_groups_2]
(
[ETL__bypass_orders_line_items_selection_groups_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_line_items_id] [uniqueidentifier] NULL,
[group_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_line_items_selection_groups_2] ADD CONSTRAINT [PK__bypass_o__8AD3B5717CA006F8] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_line_items_selection_groups_id])
GO
