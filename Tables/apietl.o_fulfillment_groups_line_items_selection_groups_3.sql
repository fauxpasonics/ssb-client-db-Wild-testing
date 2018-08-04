CREATE TABLE [apietl].[o_fulfillment_groups_line_items_selection_groups_3]
(
[o_fulfillment_groups_line_items_selection_groups_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[group_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_line_items_selection_groups_3] ADD CONSTRAINT [PK__o_fulfil__9C9132B2D0606DA4] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_line_items_selection_groups_id])
GO
