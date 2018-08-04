CREATE TABLE [apietl].[o_line_items_selection_groups_selections_3]
(
[o_line_items_selection_groups_selections_id] [uniqueidentifier] NOT NULL,
[o_line_items_selection_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_line_items_selection_groups_selections_3] ADD CONSTRAINT [PK__o_line_i__FF9D44E660CF12F1] PRIMARY KEY CLUSTERED  ([o_line_items_selection_groups_selections_id])
GO
