CREATE TABLE [apietl].[o_fulfillment_groups_service_location_rows_3]
(
[o_fulfillment_groups_service_location_rows_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_service_location_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seats_array] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_service_location_rows_3] ADD CONSTRAINT [PK__o_fulfil__B55C5701D2B225BB] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_service_location_rows_id])
GO
