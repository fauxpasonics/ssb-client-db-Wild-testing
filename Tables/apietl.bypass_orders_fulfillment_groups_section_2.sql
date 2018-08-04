CREATE TABLE [apietl].[bypass_orders_fulfillment_groups_section_2]
(
[ETL__bypass_orders_fulfillment_groups_section_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_fulfillment_groups_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_fulfillment_groups_section_2] ADD CONSTRAINT [PK__bypass_o__E62145308C8B73C4] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_fulfillment_groups_section_id])
GO
