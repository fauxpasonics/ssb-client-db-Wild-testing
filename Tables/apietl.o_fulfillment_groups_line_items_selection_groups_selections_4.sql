CREATE TABLE [apietl].[o_fulfillment_groups_line_items_selection_groups_selections_4]
(
[o_fulfillment_groups_line_items_selection_groups_selections_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_line_items_selection_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_line_items_selection_groups_selections_4] ADD CONSTRAINT [PK__o_fulfil__729DD3009B6052EC] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_line_items_selection_groups_selections_id])
GO
