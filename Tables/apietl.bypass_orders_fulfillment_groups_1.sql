CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_1]
(
[ETL__bypass_orders_fulfillment_groups_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[position] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fulfill_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[concession_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[printed] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_taker_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fulfilled_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[instructions] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[in_seat] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[service_location] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_1] ADD CONSTRAINT [PK__bypass_o__D7C9F3DD9208DFCE] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_id])
GO
