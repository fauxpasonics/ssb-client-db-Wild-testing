CREATE TABLE [apietl].[o_line_items_item_2]
(
[o_line_items_item_id] [uniqueidentifier] NOT NULL,
[o_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[base_price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reporting_group_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax_group_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[position] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[alcohol] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sku] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[weight] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_line_items_item_2] ADD CONSTRAINT [PK__o_line_i__F796BF889B68CAB0] PRIMARY KEY CLUSTERED  ([o_line_items_item_id])
GO
