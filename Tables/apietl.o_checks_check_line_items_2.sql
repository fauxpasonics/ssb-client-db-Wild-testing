CREATE TABLE [apietl].[o_checks_check_line_items_2]
(
[o_checks_check_line_items_id] [uniqueidentifier] NOT NULL,
[o_checks_id] [uniqueidentifier] NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[check_uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line_item_uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total_price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_checks_check_line_items_2] ADD CONSTRAINT [PK__o_checks__3748BB276BBE149C] PRIMARY KEY CLUSTERED  ([o_checks_check_line_items_id])
GO
