CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_service_location_rows_3]
(
[ETL__bypass_orders_fulfillment_groups_service_location_rows_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_service_location_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seats_array] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_service_location_rows_3] ADD CONSTRAINT [PK__bypass_o__C0DD849D257E5B7B] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_service_location_rows_id])
GO
