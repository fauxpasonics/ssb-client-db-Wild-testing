CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_row_2]
(
[ETL__bypass_orders_fulfillment_groups_row_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seats_array] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_row_2] ADD CONSTRAINT [PK__bypass_o__78F7D08E25EE0CFE] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_row_id])
GO
