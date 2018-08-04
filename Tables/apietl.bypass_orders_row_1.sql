CREATE TABLE [apietl].[bypass_orders_row_1]
(
[ETL__bypass_orders_row_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seats_array] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_row_1] ADD CONSTRAINT [PK__bypass_o__88ACF88C5E49D532] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_row_id])
GO
