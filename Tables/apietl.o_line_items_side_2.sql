CREATE TABLE [apietl].[o_line_items_side_2]
(
[o_line_items_side_id] [uniqueidentifier] NOT NULL,
[o_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_of_measurement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_line_items_side_2] ADD CONSTRAINT [PK__o_line_i__426EA71F0FC3F3E0] PRIMARY KEY CLUSTERED  ([o_line_items_side_id])
GO
