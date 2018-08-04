CREATE TABLE [apietl].[o_line_items_selection_groups_2]
(
[o_line_items_selection_groups_id] [uniqueidentifier] NOT NULL,
[o_line_items_id] [uniqueidentifier] NULL,
[group_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_line_items_selection_groups_2] ADD CONSTRAINT [PK__o_line_i__60B2A20062AEB1E9] PRIMARY KEY CLUSTERED  ([o_line_items_selection_groups_id])
GO
