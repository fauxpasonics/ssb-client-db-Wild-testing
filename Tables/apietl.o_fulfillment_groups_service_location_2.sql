CREATE TABLE [apietl].[o_fulfillment_groups_service_location_2]
(
[o_fulfillment_groups_service_location_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inseat_concession_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_service_location_2] ADD CONSTRAINT [PK__o_fulfil__9528662F78184330] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_service_location_id])
GO
