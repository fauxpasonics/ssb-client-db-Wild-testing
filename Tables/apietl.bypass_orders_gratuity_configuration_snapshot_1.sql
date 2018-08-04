CREATE TABLE [apietl].[bypass_orders_gratuity_configuration_snapshot_1]
(
[ETL__bypass_orders_gratuity_configuration_snapshot_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[adjustment_configuration_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[adjustment_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apply_automatically] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[belly_up] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[display_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[in_seat] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_percent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_gratuity_configuration_snapshot_1] ADD CONSTRAINT [PK__bypass_o__4FF3B680D6B714BB] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_gratuity_configuration_snapshot_id])
GO
