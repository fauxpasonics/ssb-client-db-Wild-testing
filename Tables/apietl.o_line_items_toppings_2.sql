CREATE TABLE [apietl].[o_line_items_toppings_2]
(
[o_line_items_toppings_id] [uniqueidentifier] NOT NULL,
[o_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_of_measurement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_line_items_toppings_2] ADD CONSTRAINT [PK__o_line_i__22D7C265B08036F5] PRIMARY KEY CLUSTERED  ([o_line_items_toppings_id])
GO
