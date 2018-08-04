CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_service_location_2]
(
[ETL__bypass_orders_fulfillment_groups_service_location_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inseat_concession_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_service_location_2] ADD CONSTRAINT [PK__bypass_o__93AEACBDD9772B91] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_service_location_id])
GO
