CREATE TABLE [apietl].[bypass_orders_line_items_side_2]
(
[ETL__bypass_orders_line_items_side_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_line_items_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[quantity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[unit_of_measurement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_line_items_side_2] ADD CONSTRAINT [PK__bypass_o__73E8797963A1DDB5] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_line_items_side_id])
GO
